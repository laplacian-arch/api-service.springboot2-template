#!/usr/bin/env bash

set -e
set -x

java \
  -Djava.security.egd=file:/dev/./urandom \
  ${IMAGE_VERSION:+ -Dimage.version=}${IMAGE_VERSION} \
  -jar /app/api.jar \
  ${DATASOURCE_URL:+ --spring.r2dbc.url=}${DATASOURCE_URL} \
  ${DATASOURCE_USER:+ --spring.r2dbc.username=}${DATASOURCE_USER} \
  ${DATASOURCE_PASS:+ --spring.r2dbc.password=}${DATASOURCE_PASS}
