#!/usr/bin/env bash

set -e
set -x

java \
  -Djava.security.egd=file:/dev/./urandom \
  ${IMAGE_VERSION:+ -Dimage.version=}${IMAGE_VERSION} \
  -jar /app/api.jar \
  {{#each service.datasources as |datasource| ~}}
  {{define "env_prefix"  (concat
    '${DATASOURCE'
    (if (eq datasource.name 'default') '' (concat '_' (upper-snake datasource.name)))
  ) ~}}
  {{define "prop_prefix" (concat
    'spring'
    (if (eq datasource.name 'default') '' (concat '.' (lower-snake datasource.name)))
    '.r2dbc'
  ) ~}}
  {{env_prefix}}_URL:+ --{{prop_prefix}}.url=}{{env_prefix}}_URL} \
  {{env_prefix}}_USER:+ --{{prop_prefix}}.username=}{{env_prefix}}_USER} \
  {{env_prefix}}_PASS:+ --{{prop_prefix}}.password=}{{env_prefix}}_PASS} \
  {{/each}}
  {{#each service.rest_clients as |client| ~}}
  {{define "env_prefix" (concat '${REST_CLIENT_' (upper-snake client.name)) ~}}
  {{define "prop_prefix" (concat 'rest_client.' (lower-snake client.name)) ~}}
  {{env_prefix}}_BASE_URL:+ --{{prop_prefix}}.base_url=}{{env_prefix}}_BASE_URL} \
  {{env_prefix}}_API_KEY:+ --{{prop_prefix}}.api_key=}{{env_prefix}}_API_KEY} \
  {{/each}}
  {{#each service.search_engine_clients as |client| ~}}
  {{define "env_prefix" (concat '${SEARCH_ENGINE_CLIENT_' (upper-snake client.name)) ~}}
  {{define "prop_prefix" (concat 'search_engine_client.' (lower-snake client.name)) ~}}
  {{env_prefix}}_BASE_URL:+ --{{prop_prefix}}.endpoints=}{{env_prefix}}_ENDPOINTS} \
  {{/each}}
