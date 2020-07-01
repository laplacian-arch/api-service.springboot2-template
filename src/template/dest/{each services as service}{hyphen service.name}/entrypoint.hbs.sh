#!/usr/bin/env bash

set -e
set -x

java \
  -Djava.security.egd=file:/dev/./urandom \
  ${IMAGE_VERSION:+ -Dimage.version=}${IMAGE_VERSION} \
  -jar /app/api.jar \
  ${DATASOURCE_URL:+ --spring.datasource.url=}${DATASOURCE_URL} \
  ${DATASOURCE_USER:+ --spring.datasource.username=}${DATASOURCE_USER} \
  ${DATASOURCE_PASS:+ --spring.datasource.password=}${DATASOURCE_PASS}
