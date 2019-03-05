FROM docker.elastic.co/logstash/logstash:6.6.1

COPY Dockerfile /Dockerfile
COPY pipeline/ /usr/share/logstash/pipeline/

# Metadata params
ARG BUILD_DATE
ARG VERSION
ARG VCS_URL
ARG VCS_REF

# Metadata
LABEL org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.name="" \
  org.label-schema.description="" \
  org.label-schema.vcs-url=$VCS_URL \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.version=$VERSION \
  org.label-schema.url="https://github.com/jecnua/docker-skelethon" \
  org.label-schema.schema-version="1.0" \
  com.jecnua.docker.dockerfile="/Dockerfile" \
  com.jecnua.license="MIT" \
  maintainer="fabrizio.sabatini.it@gmail.com"
