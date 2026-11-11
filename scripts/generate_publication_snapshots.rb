#!/usr/bin/env ruby

require 'bibtex'
require 'open3'
require 'yaml'

source = File.expand_path('../_bibliography/DZ_Complete.bib', __dir__)
destination = File.expand_path('../_data/publication_snapshots.yml', __dir__)
site_root = File.expand_path('..', __dir__)

def clean_abstract(text)
  text
    .gsub(/-\s*\n\s*/, '')
    .gsub(/\s+/, ' ')
    .gsub(/\A[—:;,.\s]+/, '')
    .strip
end

def brief_story(abstract)
  sentences = abstract.scan(/.*?(?:[.!?](?=\s+[A-Z])|\z)/)
  story = sentences.first(3).join(' ').strip
  story = abstract if story.empty?
  return story if story.length <= 680

  story[0, 680].sub(/\s+\S*\z/, '') + '…'
end

def extract_abstract(text)
  normalized = text.gsub("\f", "\n")
  patterns = [
    /^\s*(?:Abstract|Summary)\b[\s:—.-]*(.*?)(?=\b(?:Index Terms|Key ?words?|Keywords?)\b|\n\s*(?:I\.?|1\.?)\s*(?:Introduction|INTRODUCTION)\b)/mi,
    /^\s*(?:Abstract|Summary)\b[\s:—.-]*(.*?)(?=\n\s*(?:Introduction|INTRODUCTION|Contents|Table of Contents|Acknowledg(?:e)?ments?)\b)/mi,
    /^\s*(?:Abstract|Summary)\b[\s:—.-]*(.*?)(?=\n\s*(?:1|I)\s*[.:-]?\s*[A-Z][A-Za-z ]{3,}\n)/m
  ]

  patterns.each do |pattern|
    match = normalized.match(pattern)
    next unless match

    abstract = clean_abstract(match[1])
    next if abstract.scan(/\.\s*\.\s*\./).length >= 3
    return abstract if abstract.length >= 80
  end
  nil
end

existing = File.file?(destination) ? YAML.load_file(destination) : {}
snapshots = {}

BibTeX.open(source).entries.each_value do |entry|
  pdf = entry[:pdf].to_s.strip
  abstract = entry[:abstract].to_s.strip
  existing_summary = existing.dig(entry.key.to_s, 'summary').to_s.strip

  if abstract.empty? && existing_summary.empty?
    source_fields = %i[pdf slides poster supplementary material]
    source_fields.each do |field|
      asset = entry[field].to_s.strip
      next if asset.empty?

      asset_path = File.join(site_root, asset.sub(%r{\A/}, ''))
      next unless File.file?(asset_path)

      text, _error, process = Open3.capture3('pdftotext', '-f', '1', '-l', '30', '-raw', asset_path, '-')
      if process.success?
        abstract = extract_abstract(text).to_s
        break unless abstract.empty?
      end
    end
  end

  summary = existing_summary
  summary = brief_story(clean_abstract(abstract)) if summary.empty? && abstract.length >= 80
  next if summary.empty? && existing.dig(entry.key.to_s, 'figure').to_s.empty?

  snapshots[entry.key.to_s] = {
    'summary' => summary,
    'pdf' => pdf,
    'figure' => existing.dig(entry.key.to_s, 'figure')
  }.reject { |_key, value| value.to_s.empty? }
end

File.write(destination, snapshots.to_yaml(line_width: -1))
warn "Generated #{snapshots.length} publication snapshots in #{destination}"
