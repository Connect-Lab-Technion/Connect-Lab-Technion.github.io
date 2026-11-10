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

existing = File.file?(destination) ? YAML.load_file(destination) : {}
snapshots = {}

BibTeX.open(source).entries.each_value do |entry|
  pdf = entry[:pdf].to_s.strip
  abstract = entry[:abstract].to_s.strip

  if abstract.empty? && !pdf.empty?
    pdf_path = File.join(site_root, pdf.sub(%r{\A/}, ''))
    if File.file?(pdf_path)
      text, _error, process = Open3.capture3('pdftotext', '-f', '1', '-l', '3', '-raw', pdf_path, '-')
      if process.success?
        match = text.match(/\bAbstract\b[\s:—.-]*(.*?)(?=\b(?:Index Terms|Key ?words?)\b|\n\s*(?:I\.?|1\.?)\s+(?:Introduction|INTRODUCTION)\b)/mi)
        abstract = clean_abstract(match[1]) if match
      end
    end
  end

  next if abstract.length < 80

  snapshots[entry.key.to_s] = {
    'summary' => brief_story(clean_abstract(abstract)),
    'pdf' => pdf,
    'figure' => existing.dig(entry.key.to_s, 'figure')
  }.reject { |_key, value| value.to_s.empty? }
end

File.write(destination, snapshots.to_yaml(line_width: -1))
warn "Generated #{snapshots.length} publication snapshots in #{destination}"
