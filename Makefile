biblio/biblio.html:
	python ./scripts/dblp_crawler.py > biblio/biblio.html

biblio/biblio.md: ./scripts/dblp_crawler.py
	python3 ./scripts/dblp_crawler.py > biblio/biblio.md

site/content/pubs.md: biblio/biblio.md
	cat site/archetypes/pubs.md biblio/biblio.md > site/content/pubs.md

.PHONY: deploy
deploy:
	# cd site && hugo && rsync -avz --delete public/ unix.ic.ucsc.edu:/afs/cats.ucsc.edu/www/hsc/prod/public_html/
	cd site && hugo && rsync -avz --delete public/ www2-shell.prd.web.aws.ucsc.edu:/webroot/hsc/public_html/
	

.PHONY: scrape-pubs
scrape-pubs: biblio/biblio.md

.PHONY: update-pubs
update-pubs: site/content/pubs.md
