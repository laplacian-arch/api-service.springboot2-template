<!-- @head-content@ -->
# laplacian-arch/service-api.springboot2-template

This template gives a service api implementation based on the [service-api](https://github.com/nabla-squared/laplacian-arch.service-api.schema-model/) model.
The architecture stack which is employed in this template is:
  - Alpine based docker image
  - OpenJDK8
  - SpringBoot 2
  - Java-Graphql


*Read this in other languages*: [[日本語](README_ja.md)] [[简体中文](README_zh.md)]
<!-- @head-content@ -->

<!-- @toc@ -->
## Table of contents
- [Usage](#usage)

- [Index](#index)

  * [Script List](#script-list)

  * [Source code list](#source-code-list)



<!-- @toc@ -->

<!-- @main-content@ -->
## Usage

To apply this Template module, add the following entry to your project definition.
```yaml
project:
  templates:
  - group: laplacian-arch
    name: service-api.springboot2-template
    version: 1.0.0
```

You can run the following command to see a list of resources affected by the application of this module and their contents.
```console
$ ./script/generate --dry-run

diff --color -r PROJECT_HOME/.NEXT/somewhere/something.md PROJECT_HOME/somewhere/something.md
1,26c1,10
< content: OLD CONTENT
---
> content: NEW CONTENT
```

If there is no problem, execute the following command to reflect the change.
```console
$ ./script/generate

```


## Index


### Script List


- [./script/generate.sh](<./scripts/generate.sh>)

  Generates the resources in each directory of `src/` `model/` `template/` in this project.
  The results are reflected in each directory of `dest/` `doc/` `script/`.

  *Generator input files*

  - `src/`
    Stores static resources that are not processed the generator.
    The contents of this directory are copied directly into the `dest/` directory.

  - `model/`
    Stores the static model data files written in *YAML* or *JSON* format used for the generation.

  - `template/`
    This directory contains the template files used for the generation.
    Files with a extension `.hbs` will be handled as templates. All other files are copied as is.

    - `template/dest` `template/doc` `template/scripts`
      Each of these directories contains the template files of the resource to be output
      in the directory `dest/` `doc/` `scripts`.

    - `template/model` `template/template`
      These directories store template files updating the contents of `template/` and `model/` used for the generation.
      If the content of `template/` `model/` is updated as a result of the generation,
      the generation process is executed recursively.
      The changes to `template/` `model/` that occur during the above process are treated as an intermediate state
      and will be lost after the completion of the process.
      Use the *--dry-run* option to check these intermediate files.

  *Generator output files*

  - `dest/`
    Outputs the source files of applications and modules created as the result of
    the generation process.

  - `doc/`
    Outputs the project documentation.

  - `scripts/`
    Outputs various scripts used in development and operation.

  > Usage: generate.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > -d, --dry-run
  >
  >   After this command is processed, the generated files are output to the `.NEXT` directory
  >   without reflecting to the folders of `dest/` `doc/` `scripts/`.
  >   In addition, the difference between the contents of the `.NEXT` directory and the current files.
  >   This directory also contains any intermediate files created during the generation.
  >   
  > -r, --max-recursion [VALUE]
  >
  >   The upper limit of the number of times to execute recursively
  >   when the contents of the `model/` `template/` directory are updated
  >   during the generation process.
  >    (Default: 10)
- [./script/publish-local.sh](<./scripts/publish-local.sh>)

  After the resources in the project are generated,
  the resources in the `./dest` directory are built as a template module
  and registered in the local repository.

  > Usage: publish-local.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > -r, --max-recursion [VALUE]
  >
  >   This option is the same as the option of the same name in [generate.sh](<./scripts/generate.sh>).
  >    (Default: 10)
  > , --skip-generation
  >
  >   This option is the same as the option of the same name in [generate.sh](<./scripts/generate.sh>).
  >   
### Source code list


- [model/project.yaml](<./model/project.yaml>)
- [src/dest/{each services as service}{hyphen service.name}/application.properties.hbs](<./src/dest/{each services as service}{hyphen service.name}/application.properties.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/build.gradle.hbs](<./src/dest/{each services as service}{hyphen service.name}/build.gradle.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/gradlew](<./src/dest/{each services as service}{hyphen service.name}/gradlew>)
- [src/dest/{each services as service}{hyphen service.name}/gradle/wrapper/gradle-wrapper.jar](<./src/dest/{each services as service}{hyphen service.name}/gradle/wrapper/gradle-wrapper.jar>)
- [src/dest/{each services as service}{hyphen service.name}/gradle/wrapper/gradle-wrapper.properties](<./src/dest/{each services as service}{hyphen service.name}/gradle/wrapper/gradle-wrapper.properties>)
- [src/dest/{each services as service}{hyphen service.name}/settings.gradle.hbs](<./src/dest/{each services as service}{hyphen service.name}/settings.gradle.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{each top_level.aggregated_entities as entity}{entity.class_name}Entity.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{each top_level.aggregated_entities as entity}{entity.class_name}Entity.kt.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{each top_level.aggregated_entities as entity}{entity.class_name}Resolver.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{each top_level.aggregated_entities as entity}{entity.class_name}Resolver.kt.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{top_level.class_name}RepositoryBase.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{top_level.class_name}RepositoryBase.kt.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{top_level.class_name}Repository.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{top_level.class_name}Repository.kt.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{each resource.operations as operation}{lower-underscore operation.identifier}/{upper-camel operation.identifier}LogicBase.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{each resource.operations as operation}{lower-underscore operation.identifier}/{upper-camel operation.identifier}LogicBase.kt.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{each resource.operations as operation}{lower-underscore operation.identifier}/{upper-camel operation.identifier}Logic.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{each resource.operations as operation}{lower-underscore operation.identifier}/{upper-camel operation.identifier}Logic.kt.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{each resource.operations as operation}{lower-underscore operation.identifier}/{upper-camel operation.identifier}RequestPayload.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{each resource.operations as operation}{lower-underscore operation.identifier}/{upper-camel operation.identifier}RequestPayload.kt.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{each resource.operations as operation}{lower-underscore operation.identifier}/{upper-camel operation.identifier}ResponsePayload.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{each resource.operations as operation}{lower-underscore operation.identifier}/{upper-camel operation.identifier}ResponsePayload.kt.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{upper-camel resource.identifier}ResourceBase.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{upper-camel resource.identifier}ResourceBase.kt.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{upper-camel resource.identifier}Resource.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{each service.resources as resource}{path resource.namespace}/{upper-camel resource.identifier}Resource.kt.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/configuration/GraphqlContextBuilder.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/configuration/GraphqlContextBuilder.kt.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/configuration/JooqConfiguration.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/configuration/JooqConfiguration.kt.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/controller/{each service.resources as resource}{upper-camel resource.identifier}Controller.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/controller/{each service.resources as resource}{upper-camel resource.identifier}Controller.kt.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/query/QueryResolver.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/query/QueryResolver.kt.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/{upper-camel service.identifier}Application.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/{upper-camel service.identifier}Application.kt.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/util/JooqUtil.kt.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/kotlin/{path service.namespace}/util/JooqUtil.kt.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/resources/application.properties.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/resources/application.properties.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/resources/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{each top_level.aggregated_entities as entity}{entity.class_name}.graphqls.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/resources/{each service.relating_top_level_entities as top_level}{path top_level.namespace}/entity/{top_level.identifier}/{each top_level.aggregated_entities as entity}{entity.class_name}.graphqls.hbs>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/resources/logback.xml](<./src/dest/{each services as service}{hyphen service.name}/src/gen/resources/logback.xml>)
- [src/dest/{each services as service}{hyphen service.name}/src/gen/resources/{path service.namespace}/query/Query.graphqls.hbs](<./src/dest/{each services as service}{hyphen service.name}/src/gen/resources/{path service.namespace}/query/Query.graphqls.hbs>)
- [src/scripts/{each services as service}{hyphen service.name}/bootrun.sh.hbs](<./src/scripts/{each services as service}{hyphen service.name}/bootrun.sh.hbs>)
- [src/scripts/{each services as service}{hyphen service.name}/container_image/Dockerfile](<./src/scripts/{each services as service}{hyphen service.name}/container_image/Dockerfile>)
- [src/scripts/{each services as service}{hyphen service.name}/container-image-build.sh.hbs](<./src/scripts/{each services as service}{hyphen service.name}/container-image-build.sh.hbs>)
- [src/scripts/{each services as service}{hyphen service.name}/container_image/entrypoint.sh](<./src/scripts/{each services as service}{hyphen service.name}/container_image/entrypoint.sh>)
- [src/scripts/{each services as service}{hyphen service.name}/container-image-push.sh.hbs](<./src/scripts/{each services as service}{hyphen service.name}/container-image-push.sh.hbs>)
- [src/scripts/{each services as service}{hyphen service.name}/container-image-settings.sh.hbs](<./src/scripts/{each services as service}{hyphen service.name}/container-image-settings.sh.hbs>)
- [src/scripts/{each services as service}{hyphen service.name}/jooqgen.sh.hbs](<./src/scripts/{each services as service}{hyphen service.name}/jooqgen.sh.hbs>)


<!-- @main-content@ -->