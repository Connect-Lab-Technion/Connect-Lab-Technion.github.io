import bibtexparser
import requests
import re

def fetch_metadata(title):
    """Fetch metadata for a given title using the Crossref API."""
    url = f"https://api.crossref.org/works?query.title={title}&rows=1"
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        if data['message']['items']:
            item = data['message']['items'][0]
            return {
                'doi': item.get('DOI'),
                'url': item.get('URL')
            }
    return None

def update_bib_file(input_file, output_file):
    with open(input_file) as bibtex_file:
        bib_database = bibtexparser.load(bibtex_file)

    for entry in bib_database.entries:
        if 'title' in entry and ('doi' not in entry or 'url' not in entry):
            metadata = fetch_metadata(entry['title'])
            if metadata:
                if 'doi' not in entry and metadata['doi']:
                    entry['doi'] = metadata['doi']
                if 'url' not in entry and metadata['url']:
                    entry['url'] = metadata['url']

    with open(output_file, 'w') as bibtex_file:
        bibtexparser.dump(bib_database, bibtex_file)

# Usage
input_file = 'DZ_Complete_test.bib'
output_file = 'DZ_Complete_updated.bib'
update_bib_file(input_file, output_file)
print(f"Updated BibTeX file saved as {output_file}")