<!-- @head-content@ -->
# laplacian-arch/service-api.springboot2-template

This template gives a service api implementation based on the [service-api](https://github.com/nabla-squared/laplacian-arch.service-api.schema-model/) model.
The architecture stack which is employed in this template is:
  - Alpine based docker image
  - OpenJDK8
  - SpringBoot 2
  - Java-Graphql

<!-- @head-content@ -->

<!-- @toc@ -->
## Table of contents
1. [Usage](#usage)


1. [Source list](#source-list)



<!-- @toc@ -->

<!-- @main-content@ -->
## Usage

Add the following entry to your project definition.
```yaml
project:
  templates:
  - group: laplacian-arch
    name: service-api.springboot2-template
    version: 1.0.0
```




## Source list


[README.md](<./README.md>)

[.editorconfig](<./.editorconfig>)

[.gitattributes](<./.gitattributes>)

[.gitignore](<./.gitignore>)

[model/project/sources.yaml](<./model/project/sources.yaml>)

[model/project.yaml](<./model/project.yaml>)

[src/dest/{each services as service}{hyphen service.name}/application.properties.hbs](<./src/dest/{each services as service}{hyphen service.name}/application.properties.hbs>)

[src/dest/{each services as service}{hyphen service.name}/build.gradle.hbs](<./src/dest/{each services as service}{hyphen service.name}/build.gradle.hbs>)

[src/dest/{each services as service}{hyphen service.name}/gradlew](<./src/dest/{each services as service}{hyphen service.name}/gradlew>)

[src/dest/{each services as service}{hyphen service.name}/gradle/wrapper/gradle-wrapper.jar](<./src/dest/{each services as service}{hyphen service.name}/gradle/wrapper/gradle-wrapper.jar>)

[src/dest/{each services as service}{hyphen service.name}/gradle/wrapper/gradle-wrapper.properties](<./src/dest/{each services as service}{hyphen service.name}/gradle/wrapper/gradle-wrapper.properties>)

[src/dest/{each services as service}{hyphen service.name}/settings.gradle.hbs](<./src/dest/{each services as service}{hyphen service.name}/settings.gradle.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{each top_level.aggregated_entities as entity}{entity.class_name}Entity.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{each top_level.aggregated_entities as entity}{entity.class_name}Entity.kt.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{each top_level.aggregated_entities as entity}{entity.class_name}Resolver.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{each top_level.aggregated_entities as entity}{entity.class_name}Resolver.kt.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{top_level.class_name}RepositoryBase.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{top_level.class_name}RepositoryBase.kt.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{top_level.class_name}Repository.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{top_level.class_name}Repository.kt.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{each resource.operations as operation}{lower-underscore operation.identifier}/{upper-camel operation.identifier}LogicBase.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{each resource.operations as operation}{lower-underscore operation.identifier}/{upper-camel operation.identifier}LogicBase.kt.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{each resource.operations as operation}{lower-underscore operation.identifier}/{upper-camel operation.identifier}Logic.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{each resource.operations as operation}{lower-underscore operation.identifier}/{upper-camel operation.identifier}Logic.kt.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{each resource.operations as operation}{lower-underscore operation.identifier}/{upper-camel operation.identifier}RequestPayload.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{each resource.operations as operation}{lower-underscore operation.identifier}/{upper-camel operation.identifier}RequestPayload.kt.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{each resource.operations as operation}{lower-underscore operation.identifier}/{upper-camel operation.identifier}ResponsePayload.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{each resource.operations as operation}{lower-underscore operation.identifier}/{upper-camel operation.identifier}ResponsePayload.kt.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{upper-camel resource.identifier}ResourceBase.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{upper-camel resource.identifier}ResourceBase.kt.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{upper-camel resource.identifier}Resource.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{upper-camel resource.identifier}Resource.kt.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/configuration/GraphqlContextBuilder.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/configuration/GraphqlContextBuilder.kt.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/configuration/JooqConfiguration.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/configuration/JooqConfiguration.kt.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/controller/{each service.resources as resource}{upper-camel resource.identifier}Controller.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/controller/{each service.resources as resource}{upper-camel resource.identifier}Controller.kt.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/query/QueryResolver.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/query/QueryResolver.kt.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/{upper-camel service.identifier}Application.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/{upper-camel service.identifier}Application.kt.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/util/JooqUtil.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/util/JooqUtil.kt.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/resources/application.properties.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/resources/application.properties.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/resources/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{each top_level.aggregated_entities as entity}{entity.class_name}.graphqls.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/resources/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{each top_level.aggregated_entities as entity}{entity.class_name}.graphqls.hbs>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/resources/logback.xml](<./src/dest/{each services as service}{hyphen service.name}/src/gen/resources/logback.xml>)

[src/dest/{each services as service}{hyphen service.name}/src/gen/resources/{path service.namespace}/query/Query.graphqls.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/resources/{path service.namespace}/query/Query.graphqls.hbs>)

[src/scripts/{each services as service}{hyphen service.name}/bootrun.sh.hbs](<./src/scripts/{each services as service}{hyphen service.name}/bootrun.sh.hbs>)

[src/scripts/{each services as service}{hyphen service.name}/container_image/Dockerfile](<./src/scripts/{each services as service}{hyphen service.name}/container_image/Dockerfile>)

[src/scripts/{each services as service}{hyphen service.name}/container-image-build.sh.hbs](<./src/scripts/{each services as service}{hyphen service.name}/container-image-build.sh.hbs>)

[src/scripts/{each services as service}{hyphen service.name}/container_image/entrypoint.sh](<./src/scripts/{each services as service}{hyphen service.name}/container_image/entrypoint.sh>)

[src/scripts/{each services as service}{hyphen service.name}/container-image-push.sh.hbs](<./src/scripts/{each services as service}{hyphen service.name}/container-image-push.sh.hbs>)

[src/scripts/{each services as service}{hyphen service.name}/container-image-settings.sh.hbs](<./src/scripts/{each services as service}{hyphen service.name}/container-image-settings.sh.hbs>)

[src/scripts/{each services as service}{hyphen service.name}/jooqgen.sh.hbs](<./src/scripts/{each services as service}{hyphen service.name}/jooqgen.sh.hbs>)





<!-- @main-content@ -->