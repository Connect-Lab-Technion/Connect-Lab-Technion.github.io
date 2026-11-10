#!/usr/bin/env ruby

require 'bibtex'
require 'cgi'
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
offset = ARGV.find { |arg| arg.start_with?('--offset=') }&.split('=', 2)&.last&.to_i || 0
selected_key = ARGV.find { |arg| arg.start_with?('--key=') }&.split('=', 2)&.last
no_manifest = ARGV.include?('--no-manifest')
sync_only = ARGV.include?('--sync-only')
force = ARGV.include?('--force')
max_pages = ARGV.find { |arg| arg.start_with?('--pages=') }&.split('=', 2)&.last&.to_i || 8
dpi = ARGV.find { |arg| arg.start_with?('--dpi=') }&.split('=', 2)&.last&.to_i || 180

snapshots = File.file?(snapshots_path) ? YAML.load_file(snapshots_path) : {}
featured = File.file?(featured_path) ? YAML.load_file(featured_path) : {}
FileUtils.mkdir_p(output_dir)

def run(*command)
  Open3.capture3(*command)
end

def attributes(tag)
  tag.scan(/([A-Za-z]+)="([\d.]+)"/).to_h.transform_values(&:to_f)
end

def figure_candidate(pdf, page_number, workdir, title:, dpi:)
  prefix = File.join(workdir, 'page')
  _out, _error, render = run('pdftocairo', '-f', page_number.to_s, '-l', page_number.to_s, '-png', '-r', dpi.to_s, '-singlefile', pdf, prefix)
  image = "#{prefix}.png"
  return unless render.success? && File.file?(image)

  html, _bbox_error, bbox = run('pdftotext', '-f', page_number.to_s, '-l', page_number.to_s, '-bbox-layout', pdf, '-')
  return unless bbox.success?
  page = html.match(/<page width="([\d.]+)" height="([\d.]+)">(.*?)<\/page>/m)
  return unless page

  page_width = page[1].to_f
  page_height = page[2].to_f
  dimensions, = run('magick', 'identify', '-format', '%w %h', image)
  pixel_width, pixel_height = dimensions.split.map(&:to_i)
  return if pixel_width.zero? || pixel_height.zero?

  rectangles = page[3].scan(/<word xMin="([\d.]+)" yMin="([\d.]+)" xMax="([\d.]+)" yMax="([\d.]+)"/)
  captions = page[3].scan(/<block ([^>]+)>(.*?)<\/block>/m).filter_map do |tag, body|
    words = body.scan(/<word [^>]*>(.*?)<\/word>/m).flatten.map { |word| CGI.unescapeHTML(word.gsub(/<[^>]+>/, '')) }
    text = words.join(' ').gsub(/\s+/, ' ').strip
    next unless text.match?(/\A(?:Fig(?:ure)?\.?\s*\d+|FIG(?:URE)?\.?\s*\d+)/)

    attributes(tag).merge(text: text)
  end
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
    '-morphology', 'Dilate', 'Rectangle:9x9',
    '-define', 'connected-components:verbose=true', '-connected-components', '8', 'null:'
  )
  listing = components + component_error

  components = listing.scan(/\s+\d+:\s+(\d+)x(\d+)\+(\d+)\+(\d+).*?gray\((\d+)\)/).filter_map do |width, height, x, y, gray|
    width, height, x, y, gray = [width, height, x, y, gray].map(&:to_i)
    next if gray.zero?
    area = width * height
    next if area < pixel_width * pixel_height * 0.0015
    next if width < pixel_width * 0.035 || height < pixel_height * 0.025
    next if width > pixel_width * 0.96 && height > pixel_height * 0.9
    next if y < pixel_height * 0.045 && height < pixel_height * 0.2
    aspect = width.to_f / height
    next if aspect > 4.8 || aspect < 0.16
    { x: x, y: y, width: width, height: height, area: area }
  end

  title_terms = title.downcase.scan(/[a-z]{5,}/).reject { |term| %w[using based control systems network networks formation].include?(term) }.uniq
  story_terms = %w[architecture experiment experimental framework graph illustration overview response result simulation trajectories trajectory]
  candidates = captions.filter_map do |caption|
    caption_x = caption['xMin'] / page_width * pixel_width
    caption_y = caption['yMin'] / page_height * pixel_height
    caption_width = (caption['xMax'] - caption['xMin']) / page_width * pixel_width
    if caption_width < pixel_width * 0.62
      column_left = caption_x < pixel_width / 2.0 ? pixel_width * 0.055 : pixel_width * 0.505
      column_right = caption_x < pixel_width / 2.0 ? pixel_width * 0.495 : pixel_width * 0.945
    else
      column_left = pixel_width * 0.045
      column_right = pixel_width * 0.955
    end
    earlier_caption_bottom = captions.filter_map do |other|
      other_y = other['yMin'] / page_height * pixel_height
      other_x = other['xMin'] / page_width * pixel_width
      same_column = caption_width >= pixel_width * 0.62 || (other_x < pixel_width / 2.0) == (caption_x < pixel_width / 2.0)
      next unless same_column && other_y < caption_y

      other['yMax'] / page_height * pixel_height + 12
    end.max
    top_limit = [caption_y - pixel_height * 0.40, pixel_height * 0.035, earlier_caption_bottom.to_f].max
    nearby = components.select do |component|
      center_x = component[:x] + component[:width] / 2.0
      bottom = component[:y] + component[:height]
      center_x.between?(column_left, column_right) && bottom <= caption_y + 8 && bottom >= top_limit && component[:y] >= top_limit - 12
    end
    next if nearby.empty?

    # Include every substantial panel aligned immediately above the caption.
    lowest = nearby.map { |component| component[:y] + component[:height] }.max
    nearby.select! { |component| component[:y] + component[:height] >= lowest - pixel_height * 0.28 }
    left = nearby.map { |component| component[:x] }.min
    top = nearby.map { |component| component[:y] }.min
    right = nearby.map { |component| component[:x] + component[:width] }.max
    bottom = nearby.map { |component| component[:y] + component[:height] }.max
    width = right - left
    height = bottom - top
    next if width < pixel_width * 0.16 || height < pixel_height * 0.055

    caption_text = caption[:text].downcase
    semantic_matches = title_terms.count { |term| caption_text.include?(term) }
    story_matches = story_terms.count { |term| caption_text.include?(term) }
    area = width * height
    quality = [area.to_f / (pixel_width * pixel_height), 0.30].min
    score = quality * (1.0 + semantic_matches * 0.35 + story_matches * 0.18)
    score *= 0.72 if page_number == 1
    { x: left, y: top, width: width, height: height, score: score, caption: caption[:text] }
  end

  best = candidates.max_by { |candidate| candidate[:score] }
  warn "  page #{page_number}: captions=#{captions.length}, components=#{components.length}, candidates=#{candidates.length}" if ENV['DEBUG_FIGURES']
  return unless best

  padding = 8
  x = [best[:x] - padding, 0].max
  y = [best[:y] - padding, 0].max
  width = [best[:width] + padding * 2, pixel_width - x].min
  height = [best[:height] + padding * 2, pixel_height - y].min
  { source: image, crop: "#{width}x#{height}+#{x}+#{y}", score: best[:score], width: width, height: height, caption: best[:caption] }
end

entries = BibTeX.open(bibliography).entries.values
entries = entries.select { |entry| entry.key.to_s == selected_key } if selected_key
entries = entries.drop(offset) if offset.positive?
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
  FileUtils.rm_f(destination) if force
  best = nil
  Dir.mktmpdir('publication-figure') do |workdir|
    1.upto(max_pages) do |page|
      page_dir = File.join(workdir, page.to_s)
      FileUtils.mkdir_p(page_dir)
      candidate = figure_candidate(source_pdf, page, page_dir, title: entry[:title].to_s, dpi: dpi)
      best = candidate if candidate && (!best || candidate[:score] > best[:score])
    end
    next unless best
    _out, _error, converted = run('magick', best[:source], '-crop', best[:crop], '+repage', '-trim', '+repage', '-resize', '1400x820>', '-background', 'white', '-alpha', 'remove', '-sampling-factor', '4:4:4', '-quality', '90', destination)
    next unless converted.success? && File.file?(destination)
    warn "  selected: #{best[:caption]}" if ENV['DEBUG_FIGURES']
  end

  if File.file?(destination)
    snapshots[key] ||= {}
    snapshots[key]['figure'] = "/img/publications/snapshots/#{safe_key}.jpg"
    generated += 1
  elsif snapshots.dig(key, 'figure') == "/img/publications/snapshots/#{safe_key}.jpg"
    snapshots[key].delete('figure')
  end
  warn "[#{index + 1}/#{entries.length}] #{key}: #{File.file?(destination) ? 'figure' : 'no candidate'}"
end

File.write(snapshots_path, snapshots.to_yaml(line_width: -1)) unless no_manifest
warn "Generated #{generated} publication figures"
