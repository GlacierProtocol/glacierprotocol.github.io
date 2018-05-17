#!/bin/bash
set -e

CONTAINER_NAME_SITE=com.glacier.pdf
FILENAME=assets/glacier.pdf
# Set this if you want to keep intermediate artifacts for debugging
KEEP_ARTIFACTS=
WEBSITE_PORT=40000

check_clean_state() {
  if [ -n "$(docker ps --filter name=$CONTAINER_NAME_SITE --quiet)" ]; then
    stop_site
  fi
}

generate_pdf_source() {
  echo "Concatenating all markdown pages into a single one"
  docker run -v $(pwd):/src joaofnfernandes/catmd:latest \
    --order-file /src/_data/docs_toc.yml \
    --path-dir /src/_docs \
    --out /src/pdf.md
}

rm_artifacts() {
  echo "Removing single markdown file"
  rm -f pdf.md
}

run_site() {
  echo "Deploying Glacier website"
  docker run -dit --rm --name $CONTAINER_NAME_SITE \
    -v $(pwd):/usr/src/app \
    -p $WEBSITE_PORT:$WEBSITE_PORT \
    starefossen/github-pages:172 jekyll serve -d /_site -H 0.0.0.0 -P $WEBSITE_PORT
}

poll_site() {
  echo 'Waiting for website to be running'
  until $(curl --output /dev/null --silent --head --fail http://127.0.0.1:$WEBSITE_PORT); do
    printf '.'
    sleep 1
  done
}

stop_site() {
  echo "Stopping Glacier website"
  docker stop $CONTAINER_NAME_SITE
}

generate_pdf() {
  docker run --rm -v $(pwd):/src \
    weasyprint --base-url http://172.17.0.1:$WEBSITE_PORT \
    http://172.17.0.1:$WEBSITE_PORT/pdf.html $FILENAME
  echo "PDF successfully created at $FILENAME"
}

main() {
  check_clean_state
  generate_pdf_source
  run_site
  poll_site
  generate_pdf
  stop_site
  if [ -n "$KEEP_ARTIFACTS" ]; then
    echo "Leaving artifacts for debug"
  else
    rm_artifacts
  fi
}

main