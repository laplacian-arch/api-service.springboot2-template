{{#each environment.deployments as |deployment| ~}}
{{#if (eq deployment.type 'springboot2_api_service_container_deployment') ~}}
build_component_for_{{lower-snake deployment.name}}() {
  echo "Preparing the container image for {{deployment.name}}..."
  {{#if deployment.use_locally_built_image ~}}
  (cd $COMPONENT_BASE_DIR/{{hyphen deployment.component.name}}
    ./gradlew build
  )
  {{/if}}
}
{{/if}}
{{/each}}
