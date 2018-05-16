SHA = $(shell git rev-parse --short HEAD)
CONTAINER_NAME_SITE=glacier-website
TOC_FILE=_data/docs_toc.yml
SOURCE_DIR=_docs
SOURCE_MD=$(shell find $(SOURCE_DIR) -type f -iname '*.md')
SOURCE_HTML=$(shell find _includes _layouts -type f -iname '*.html')
SOURCE_CSS=$(shell find _sass css -type f -iname '*.scss' -o -iname '*.css')

################################################################################
#	Main targets
################################################################################

# Builds the site locally so that you can preview it without pushing to Github
.PHONY: site
site: run-site

# Stops serving the website
.PHONY: stop-site
stop-site: run-stop-site

# Generates a pdf version of the Glacier protocol
.PHONY: pdf
pdf: assets/glacier.pdf

## Runs a spell checker on the sources
.PHONY: spell
spell: run-spell-check

################################################################################
#	Utilities
################################################################################

.PHONY: run-site
run-site:
	@echo "Deploying website"
	@docker run -dit --rm --name $(CONTAINER_NAME_SITE) \
		-v "$(shell pwd)":/usr/src/app \
		-p 4000:4000 \
		starefossen/github-pages:172
	@echo "Website running at http://localhost:4000"

.PHONY: run-stop-site
run-stop-site:
	@docker rm -f $(CONTAINER_NAME_SITE)
	@echo "Site stopped"

# Utility to generate a pdf version of the protocol
assets/glacier.pdf: dockerfiles/bin/.weasyprint $(SOURCE_MD) $(SOURCE_HTML) $(SOURCE_CSS)
	./_build/generate_pdf.sh


# Runs a spell checker to make sure your site looks nifty without typos
.PHONY: run-spell-check
run-spell-check: dockerfiles/bin/.spellcheck
	@echo "Running spellchecker"
	@docker run --rm -t -v "$(shell pwd)":/src spellcheck

# TODO: Add target that removes docker images
.PHONY: clean
clean:
	@echo "Cleaning temp files and artifacts"
	@rm -rf _site .sass-cache .jekyll-metadata bin

################################################################################
#	Build Docker images
################################################################################
dockerfiles/bin/.spellcheck: dockerfiles/spellcheck/Dockerfile dockerfiles/spellcheck/.spelling
	@echo "Building Docker image with spellchecker"
	@docker build -t spellcheck $(<D)
	@mkdir -p dockerfiles/bin
	@touch $@

dockerfiles/bin/.weasyprint: dockerfiles/weasyprint/Dockerfile
	@echo "Building Docker image with Pandoc and WeasyPrint"
	@docker build -t weasyprint $(<D)
	@mkdir -p dockerfiles/bin
	@touch $@

dockerfiles/bin/.pandoc: dockerfiles/pandoc/dockerfile dockerfiles/pandoc/entrypoint.sh
	@echo "Building Docker image with Pandoc"
	@docker build -t pandoc $(<D)
	@mkdir -p dockerfiles/bin
	@touch $@
