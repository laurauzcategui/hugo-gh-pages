FROM registry.gitlab.com/pages/hugo/hugo_extended:latest

RUN apk add --update --no-cache ca-certificates openssl git && \
  rm -rf /var/cache/apk/*

# Hugo External Dependecies (add py3-rst once its out of testing)
RUN apk add --update --no-cache py-pygments asciidoctor npm && \
  rm -rf /var/cache/apk/*

RUN npm install -g postcss-cli

RUN wget https://github.com/jgm/pandoc/releases/download/2.7.3/pandoc-2.7.3-linux.tar.gz && \
  tar xvzf pandoc-2.7.3-linux.tar.gz --strip-components 1 -C /usr/local && \
  rm pandoc-2.7.3-linux.tar.gz

LABEL "com.github.actions.name"="Hugo to GH Pages"
LABEL "com.github.actions.description"="GitHub Action for Build Hugo Site and Pushing it to Github Pages"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="red"

LABEL "repository"="https://github.com/chabad360/hugo-gh-pages"
LABEL "homepage"="https://github.com/chabad360/hugo-gh-pages"
LABEL "maintainer"="chabad360"

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
