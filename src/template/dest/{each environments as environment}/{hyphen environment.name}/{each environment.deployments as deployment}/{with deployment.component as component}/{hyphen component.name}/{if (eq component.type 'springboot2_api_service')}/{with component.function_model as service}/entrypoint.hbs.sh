#!/usr/bin/env bash

set -e
set -x

java \
  {{#if is_debug ~}}
  -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5060 \
  {{/if}}
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
  {{#each service.configuration_categories as |category| ~}}
  {{#each category.configurations as |config| ~}}
  {{printf '${%s:+ --%s=}${%s}' config.environment_variable_name config.key config.environment_variable_name}} \
  {{/each}}
  {{/each}}
