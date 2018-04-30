#!/bin/bash
set -e

CONTAINER_NAME_SITE=glacier-website
FILENAME=assets/glacier.pdf
# Set this if you want to keep the pdf source for debugging
KEEP_ARTIFACTS=

generate_pdf_source() {
  echo "Concatenating all markdown pages into a single one"
  docker run -v $(pwd):/src joaofnfernandes/catmd:latest \
    --order-file /src/_data/docs_toc.yml \
    --path-dir /src/_docs \
    --out /src/pdf.md
}

rm_pdf_source() {
  echo "Removing single markdown file"
  rm -f pdf.md
}

run_site() {
  echo "Deploying Glacier website"
  docker run -dit --rm --name $CONTAINER_NAME_SITE \
    -v $(pwd):/usr/src/app \
    -p 4000:4000 \
    starefossen/github-pages:172
}

stop_site() {
  echo "Stopping Glacier website"
  docker rm -f $CONTAINER_NAME_SITE
}

generate_pdf() {
  docker run --rm -v $(pwd):/src \
    weasyprint --base-url http://172.17.0.1:4000 \
    http://172.17.0.1:4000/pdf.html $FILENAME
  echo "PDF successfully created at $FILENAME"
}

main() {
  generate_pdf_source
  run_site
  sleep 5
  generate_pdf
  stop_site
  if [ -z "$KEEP_ARTIFACTS" ]; then
    rm_pdf_source
  fi
}

main