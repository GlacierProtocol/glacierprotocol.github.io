FROM node:9.5.0-alpine
LABEL maintainer="joao@joaofn.com"

RUN npm install markdown-spellcheck -g

WORKDIR /spellcheck
COPY .spelling .

WORKDIR /src
VOLUME /src

CMD ["mdspell", "--en-us",  "--no-suggestions", "--ignore-acronyms", "--ignore-numbers", "--report", "--target-relative", "/spellcheck/.spelling",  "**/*.md"]
