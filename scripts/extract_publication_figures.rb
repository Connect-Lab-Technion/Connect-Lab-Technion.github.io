#!/usr/bin/env ruby

require 'bibtex'
require 'fileutils'
require 'open3'
require 'tmpdir'
require 'yaml'

site_root = File.expand_path('..', __dir__)
bibliography = File.join(site_root, '_bibliography', 'DZ_Complete.bib')
snapshots_path = File.join(site_root, '_data', 'publication_snapshots.yml')
featured_path = File.join(site_root, '_data', 'featured_paper_figures.yml')
output_dir = File.join(site_root, 'img', 'publications', 'snapshots')
limit = ARGV.find { |arg| arg.start_with?('--limit=') }&.split('=', 2)&.last&.to_i
selected_key = ARGV.find { |arg| arg.start_with?('--key=') }&.split('=', 2)&.last
no_manifest = ARGV.include?('--no-manifest')
sync_only = ARGV.include?('--sync-only')
force = ARGV.include?('--force')

snapshots = File.file?(snapshots_path) ? YAML.load_file(snapshots_path) : {}
featured = File.file?(featured_path) ? YAML.load_file(featured_path) : {}
FileUtils.mkdir_p(output_dir)

def run(*command)
  Open3.capture3(*command)
end

def figure_candidate(pdf, page_number, workdir)
  prefix = File.join(workdir, 'page')
  _out, _error, render = run('pdftocairo', '-f', page_number.to_s, '-l', page_number.to_s, '-png', '-r', '120', '-singlefile', pdf, prefix)
  image = "#{prefix}.png"
  return unless render.success? && File.file?(image)

  html, _bbox_error, bbox = run('pdftotext', '-f', page_number.to_s, '-l', page_number.to_s, '-bbox', pdf, '-')
  return unless bbox.success?
  page = html.match(/<page width="([\d.]+)" height="([\d.]+)">(.*?)<\/page>/m)
  return unless page

  page_width = page[1].to_f
  page_height = page[2].to_f
  dimensions, = run('magick', 'identify', '-format', '%w %h', image)
  pixel_width, pixel_height = dimensions.split.map(&:to_i)
  return if pixel_width.zero? || pixel_height.zero?

  rectangles = page[3].scan(/<word xMin="([\d.]+)" yMin="([\d.]+)" xMax="([\d.]+)" yMax="([\d.]+)"/)
  overlay = File.join(workdir, 'text-mask.svg')
  svg = ["<svg xmlns='http://www.w3.org/2000/svg' width='#{pixel_width}' height='#{pixel_height}'>"]
  rectangles.each do |x1, y1, x2, y2|
    left = (x1.to_f / page_width * pixel_width - 2).floor
    top = (y1.to_f / page_height * pixel_height - 2).floor
    width = ((x2.to_f - x1.to_f) / page_width * pixel_width + 4).ceil
    height = ((y2.to_f - y1.to_f) / page_height * pixel_height + 4).ceil
    svg << "<rect x='#{left}' y='#{top}' width='#{width}' height='#{height}' fill='white'/>"
  end
  svg << '</svg>'
  File.write(overlay, svg.join)

  cleaned = File.join(workdir, 'cleaned.png')
  overlay_png = File.join(workdir, 'text-mask.png')
  run('magick', '-background', 'none', overlay, overlay_png)
  run('magick', image, overlay_png, '-compose', 'over', '-composite', cleaned)
  components, component_error, = run(
    'magick', cleaned, '-colorspace', 'Gray', '-threshold', '92%', '-negate',
    '-morphology', 'Dilate', 'Rectangle:13x13',
    '-define', 'connected-components:verbose=true', '-connected-components', '8', 'null:'
  )
  listing = components + component_error

  candidates = listing.scan(/\s+\d+:\s+(\d+)x(\d+)\+(\d+)\+(\d+).*?gray\((\d+)\)/).filter_map do |width, height, x, y, gray|
    width, height, x, y, gray = [width, height, x, y, gray].map(&:to_i)
    next if gray.zero?
    area = width * height
    next if area < pixel_width * pixel_height * 0.007
    next if width < pixel_width * 0.12 || height < pixel_height * 0.09
    next if width > pixel_width * 0.96 && height > pixel_height * 0.9
    next if y < pixel_height * 0.045 && height < pixel_height * 0.2
    aspect = width.to_f / height
    next if aspect > 4.8 || aspect < 0.16
    page_weight = page_number == 1 ? 0.25 : 1.0
    text_weight = rectangles.length < 30 ? 0.3 : 1.0
    { x: x, y: y, width: width, height: height, score: area * (1.0 - (y.to_f / pixel_height * 0.12)) * page_weight * text_weight }
  end
  best = candidates.max_by { |candidate| candidate[:score] }
  warn "  page #{page_number}: words=#{rectangles.length}, components=#{listing.lines.length}, candidates=#{candidates.length}" if ENV['DEBUG_FIGURES']
  return unless best

  padding = 18
  x = [best[:x] - padding, 0].max
  y = [best[:y] - padding, 0].max
  width = [best[:width] + padding * 2, pixel_width - x].min
  height = [best[:height] + padding * 2, pixel_height - y].min
  { source: image, crop: "#{width}x#{height}+#{x}+#{y}", score: best[:score], width: width, height: height }
end

entries = BibTeX.open(bibliography).entries.values
entries = entries.select { |entry| entry.key.to_s == selected_key } if selected_key
entries = entries.first(limit) if limit && limit.positive?
generated = 0

entries.each_with_index do |entry, index|
  key = entry.key.to_s
  next if featured.dig(key, 'figure')
  pdf = entry[:pdf].to_s.strip
  next if pdf.empty?
  source_pdf = File.join(site_root, pdf.sub(%r{\A/}, ''))
  next unless File.file?(source_pdf)

  safe_key = key.gsub(/[^A-Za-z0-9_.-]/, '-')
  destination = File.join(output_dir, "#{safe_key}.jpg")
  if sync_only || (File.file?(destination) && !force)
    if File.file?(destination)
      snapshots[key] ||= {}
      snapshots[key]['figure'] = "/img/publications/snapshots/#{safe_key}.jpg"
    elsif sync_only && snapshots.dig(key, 'figure') == "/img/publications/snapshots/#{safe_key}.jpg"
      snapshots[key].delete('figure')
    end
    next
  end
  best = nil
  Dir.mktmpdir('publication-figure') do |workdir|
    1.upto(5) do |page|
      page_dir = File.join(workdir, page.to_s)
      FileUtils.mkdir_p(page_dir)
      candidate = figure_candidate(source_pdf, page, page_dir)
      best = candidate if candidate && (!best || candidate[:score] > best[:score])
    end
    next unless best
    _out, _error, converted = run('magick', best[:source], '-crop', best[:crop], '+repage', '-trim', '+repage', '-resize', '900x520>', '-background', 'white', '-alpha', 'remove', '-quality', '80', destination)
    next unless converted.success? && File.file?(destination)
  end

  if File.file?(destination)
    snapshots[key] ||= {}
    snapshots[key]['figure'] = "/img/publications/snapshots/#{safe_key}.jpg"
    generated += 1
  end
  warn "[#{index + 1}/#{entries.length}] #{key}: #{File.file?(destination) ? 'figure' : 'no candidate'}"
end

File.write(snapshots_path, snapshots.to_yaml(line_width: -1)) unless no_manifest
warn "Generated #{generated} publication figures"
