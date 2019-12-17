

biblio/biblio.html:
	python ./scripts/dblp_crawler.py >biblio/biblio.html

.PHONY: deploy
deploy:
	cd site && hugo && rsync -avz --delete public/ unix.ic.ucsc.edu:/afs/cats/www/hsc/prod/public_html/
