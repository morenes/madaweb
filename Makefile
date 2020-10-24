

biblio/biblio.html:
	python ./scripts/dblp_crawler.py >biblio/biblio.html

biblio/biblio.md:
	python3 ./scripts/dblp_crawler.py >biblio/biblio.md

site/content/pubs.md: biblio/biblio.md
	cat site/archetypes/pubs.md biblio/biblio.md > site/content/pubs.md

.PHONY: deploy
deploy:
	cd site && hugo && rsync -avz --delete public/ unix.ic.ucsc.edu:/afs/cats/www/hsc/prod/public_html/

.PHONY: update-pubs
update-pubs:
	python3 ./scripts/dblp_crawler.py >biblio/biblio.md
