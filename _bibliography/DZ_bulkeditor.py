import bibtexparser
import os

bib_file = '/home/joseph/connect-lab.github.io/_bibliography/DZ_Complete.bib'

if os.path.exists(bib_file):
    with open(bib_file) as bibtex_file:
        bib_database = bibtexparser.load(bibtex_file)
        
        # Modify entries
        for entry in bib_database.entries:
            entry['researchtopic'] = 'Placeholder'
        
        # Write back to file
        with open('/home/joseph/connect-lab.github.io/_bibliography/DZ_Complete_TempTopic.bib', 'w') as output_file:
            bibtexparser.dump(bib_database, output_file)
else:
    print(f"Error: File '{bib_file}' does not exist.")

