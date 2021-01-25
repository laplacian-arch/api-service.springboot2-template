#!/usr/bin/env bash

set -e
set -x

java \
  {{printf '${%s:+ %s}' 'ENABLE_DEBUG' '-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:${DEBUG_PORT}'}} \
  {{printf '${%s:+ %s}' 'ENABLE_JMX' '-Djava.rmi.server.hostname=0.0.0.0'}} \
  {{printf '${%s:+ %s}' 'ENABLE_JMX' '-Dcom.sun.management.jmxremote.rmi.port=${JMX_PORT}'}} \
  {{printf '${%s:+ %s}' 'ENABLE_JMX' '-Dcom.sun.management.jmxremote.ssl=false'}} \
  {{printf '${%s:+ %s}' 'ENABLE_JMX' '-Dcom.sun.management.jmxremote.local.only=false'}} \
  {{printf '${%s:+ %s}' 'ENABLE_JMX' '-Dcom.sun.management.jmxremote.authenticate=false'}} \
  {{printf '${%s:+ %s}' 'ENABLE_JMX' '-Dcom.sun.management.jmxremote'}} \
  {{printf '${%s:+ %s}' 'ENABLE_JMX' '-Dcom.sun.management.jmxremote.port=9010'}} \
  -Djava.security.egd=file:/dev/./urandom \
  ${IMAGE_VERSION:+ -Dimage.version=}${IMAGE_VERSION} \
  -jar /app/api.jar \
  {{#each service.datasources as |datasource| ~}}
  {{define 'prefix' (concat 'datasource.' (hyphen datasource.name) '.') ~}}
  {{printf '${%s:+ --%s=}${%s}' (upper-snake (concat prefix 'username')) (concat prefix 'username') (upper-snake (concat prefix 'username'))}} \
  {{printf '${%s:+ --%s=}${%s}' (upper-snake (concat prefix 'password')) (concat prefix 'password') (upper-snake (concat prefix 'password'))}} \
  {{printf '${%s:+ --%s=}${%s}' (upper-snake (concat prefix 'jdbc-url')) (concat prefix 'jdbc-url') (upper-snake (concat prefix 'jdbc-url'))}} \
  {{/each}}
  {{#if service.depends_on_redis_cache ~}}
  {{printf '${%s:+ --%s=}${%s}' 'REDIS_AUTH_KEY' 'spring.redis.password' 'REDIS_AUTH_KEY'}} \
  {{printf '${%s:+ --%s=}${%s}' 'REDIS_HOST' 'spring.redis.host' 'REDIS_HOST'}} \
  {{printf '${%s:+ --%s=}${%s}' 'REDIS_PORT' 'spring.redis.port' 'REDIS_PORT'}} \
  {{~/if}}
  {{#each service_configurations as |config| ~}}
  {{printf '${%s:+ --%s=}${%s}' config.environment_variable_name config.key config.environment_variable_name}} \
  {{/each}}
