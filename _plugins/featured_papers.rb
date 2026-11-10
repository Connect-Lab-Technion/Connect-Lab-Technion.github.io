require 'bibtex'

module ConnectLab
  class FeaturedPapersGenerator < Jekyll::Generator
    safe true
    priority :high

    def generate(site)
      bibliography = File.join(site.source, '_bibliography', 'DZ_Complete.bib')
      figures = site.data.fetch('featured_paper_figures', {})
      papers = BibTeX.open(bibliography).entries.values.filter_map do |entry|
        paper_data(entry, figures[entry.key.to_s])
      end
      site.data['featured_papers'] = papers.sort_by { |paper| [-paper['year'], -paper['month'], paper['title']] }
    rescue StandardError => error
      Jekyll.logger.warn 'Featured papers:', error.message
      site.data['featured_papers'] = []
    end

    private

    def value(entry, key)
      entry[key]&.to_s&.strip
    end

    def paper_data(entry, figure_data)
      year = value(entry, :year).to_i
      title = value(entry, :title)
      return if year.zero? || title.to_s.empty? || figure_data.nil?

      link = first_present(
        value(entry, :arxiv),
        value(entry, :url),
        doi_link(value(entry, :doi)),
        value(entry, :pdf)
      ) || "/publications/##{entry.key}"

      topics = value(entry, :researchtopic).to_s.downcase.split(',').map(&:strip)
      key = entry.key.to_s
      description = clean_description(first_present(figure_data['description'], value(entry, :abstract)))
      return if description.empty?

      {
        'key' => key,
        'title' => title.gsub(/[{}]/, ''),
        'authors' => format_authors(value(entry, :author)),
        'year' => year,
        'month' => value(entry, :month_numeric).to_i,
        'topics' => topics,
        'description' => description,
        'link' => link,
        'figure' => figure_data['figure'],
        'figure_alt' => figure_data['alt']
      }
    end

    def first_present(*values)
      values.find { |value| value && !value.empty? }
    end

    def doi_link(doi)
      "https://doi.org/#{doi}" if doi && !doi.empty?
    end

    def format_authors(authors)
      return '' if authors.to_s.empty?

      authors.split(/\s+and\s+/i).map do |author|
        family, given = author.split(',').map(&:strip)
        given ? "#{given} #{family}" : family
      end.join(', ')
    end

    def clean_description(abstract)
      return '' if abstract.to_s.empty?

      abstract.gsub(/[{}]/, '').gsub(/\s+/, ' ').strip
    end
  end
end
