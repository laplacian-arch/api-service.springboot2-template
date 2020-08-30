<!-- @head-content@ -->
# laplacian-arch/api-service.springboot2-template

このテンプレートは[APIサービスモデル](https://github.com/nabla-squared/api-service.domain-model/)の定義に従って、[SpringBoot2](https://spring.io/projects/spring-boot)ベースのランタイムを生成します。


*Read this in other languages*: [[English](README.md)] [[简体中文](README_zh.md)]
<!-- @head-content@ -->

<!-- @toc@ -->
## Table of contents
- [使用方法](#使用方法)

- [インデックス](#インデックス)

  * [スクリプト一覧](#スクリプト一覧)

  * [ソースコード一覧](#ソースコード一覧)



<!-- @toc@ -->

<!-- @main-content@ -->
## 使用方法

この templateモジュールを適用するには、プロジェクト定義に以下のエントリを追加してください。
```yaml
project:
  templates:
  - group: laplacian-arch
    name: api-service.springboot2-template
    version: 1.0.0
```

下記のコマンドを実行すると、このモジュールの適用によって影響を受ける資源の一覧とその内容を確認できます。

```console
$ ./script/generate --dry-run

diff --color -r PROJECT_HOME/.NEXT/somewhere/something.md PROJECT_HOME/somewhere/something.md
1,26c1,10
< content: OLD CONTENT
---
> content: NEW CONTENT
```

内容に問題が無ければ、下記コマンドを実行して変更を反映してください。

```console
$ ./script/generate

```


## インデックス


### スクリプト一覧


- [./script/generate.sh](<./scripts/generate.sh>)

  このプロジェクト内の資源を自動生成します。
  `src/` `model/` `template/` の各ディレクトリに格納された資源をもとに自動生成を行い、その結果を`dest/` `doc/` `script/` の各ディレクトリに反映します。

  *自動生成入力ファイル*

  - `src/`
    自動生成の対象とならない静的な資源を格納します。
    このディレクトリの内容は `dest/` 配下にそのままコピーされます。

  - `model/`
    自動生成で使用されるYAMLもしくはJSON形式で記述された静的なモデルデータを格納します。

  - `template/`
    自動生成で使用されるテンプレートファイルを格納します。ファイル拡張子に `.hbs` を含むファイルがテンプレートして扱われます。
    それ以外のファイルはそのままコピーされます。

    - `template/dest` `template/doc` `template/scripts`
      これらのディレクトリはそれぞれ、`dest/` `doc/` `scripts`の各ディレクトリに出力される資源のテンプレートを格納します。

    - `template/model` `template/template`
      自動生成で使用される`template/` `model/`の内容を更新するためのテンプレートを格納します。
      自動生成の結果、`template/` `model/` の内容が更新された場合は、自動生成処理を再帰的に実行します。
      なお、上記処理中に発生した`template/` `model/`への変更は、中間状態として扱われるため、処理完了後は失われます。
      これらの中間ファイルを確認するためには *--dry-run* オプションを使用してください。

  *自動生成結果ファイル*

  - `dest/`
    自動生成の結果作成されるアプリケーションやモジュールのソースファイル等を出力します。

  - `doc/`
    プロジェクトのドキュメントを出力します。

  - `scripts/`
    開発・運用で使用する各種スクリプトを出力します。

  > Usage: generate.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -d, --dry-run
  >
  >   自動生成処理を実行後、生成されたファイルを`dest/` `doc/` `scripts/`の各フォルダに反映せずに、`.NEXT`ディレクトリに出力します。
  >   また、`.NEXT`ディレクトリの内容と現在のファイルの差異を出力します。
  >   このディレクトリには自動生成中に作成された中間ファイルも含まれます。
  >   
  > -r, --max-recursion [VALUE]
  >
  >   自動生成処理中に`model/` `template/`ディレクトリの内容が更新された場合に、
  >   再帰的に自動生成処理を実行する回数の上限。
  >    (Default: 10)
  > , --local-module-repository [VALUE]
  >
  >   ローカルでビルドされたモジュールを格納するリポジトリのパス。
  >   ここに存在するモジュールが最優先で参照されます。
  >   
  > , --updates-scripts-only
  >
  >   スクリプトファイルのみを更新の対象とします。
  >   プロジェクトを初期生成する際、自動生成スクリプト自体を初回作成する場合などに指定します。
  >   
- [./script/publish-local.sh](<./scripts/publish-local.sh>)

  プロジェクト内の資源を自動生成した後、ディレクトリにある資源をテンプレートモジュールとしてビルドし、
  ローカルリポジトリに登録します。

  > Usage: publish-local.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -r, --max-recursion [VALUE]
  >
  >   [generate.sh](<./scripts/generate.sh>)の同名のオプションと同じものです。
  >    (Default: 10)
  > , --skip-generation
  >
  >   自動生成処理を行わずに、ビルドおよびローカルリポジトリへの登録を行います。
  >   
  > , --local-module-repository [VALUE]
  >
  >   ビルドしたモジュールを格納するローカルリポジトリのパス。
  >   指定したパスにリポジトリが存在しない場合は、自動的に作成されます。
  >   
### ソースコード一覧


- [model/project.yaml](<./model/project.yaml>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/Dockerfile.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/Dockerfile.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/build.gradle.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/build.gradle.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/.dockerignore.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/.dockerignore.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/entrypoint.hbs.sh](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/entrypoint.hbs.sh>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/gradle.properties.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/gradle.properties.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/gradlew](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/gradlew>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/gradle/wrapper/gradle-wrapper.jar](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/gradle/wrapper/gradle-wrapper.jar>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/gradle/wrapper/gradle-wrapper.properties.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/gradle/wrapper/gradle-wrapper.properties.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/settings.gradle.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/settings.gradle.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{each service.top_level_entities_used_in_graphql as top_level}/{path top_level.namespace}/entity/RepositoryBase.kt.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{each service.top_level_entities_used_in_graphql as top_level}/{path top_level.namespace}/entity/RepositoryBase.kt.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{each service.top_level_entities_used_in_graphql as top_level}/{path top_level.namespace}/entity/{lower-snake top_level.name}/{each top_level.aggregated_entities as entity}/{entity.class_name}Entity.kt.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{each service.top_level_entities_used_in_graphql as top_level}/{path top_level.namespace}/entity/{lower-snake top_level.name}/{each top_level.aggregated_entities as entity}/{entity.class_name}Entity.kt.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{each service.top_level_entities_used_in_graphql as top_level}/{path top_level.namespace}/entity/{lower-snake top_level.name}/{each top_level.aggregated_entities as entity}/{entity.class_name}Resolver.kt.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{each service.top_level_entities_used_in_graphql as top_level}/{path top_level.namespace}/entity/{lower-snake top_level.name}/{each top_level.aggregated_entities as entity}/{entity.class_name}Resolver.kt.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{each service.top_level_entities_used_in_graphql as top_level}/{path top_level.namespace}/entity/{lower-snake top_level.name}/{each top_level.aggregated_entities as entity}/{entity.class_name}SearchInput.kt.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{each service.top_level_entities_used_in_graphql as top_level}/{path top_level.namespace}/entity/{lower-snake top_level.name}/{each top_level.aggregated_entities as entity}/{entity.class_name}SearchInput.kt.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{each service.top_level_entities_used_in_graphql as top_level}/{path top_level.namespace}/entity/{lower-snake top_level.name}/{top_level.class_name}RepositoryImpl.kt.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{each service.top_level_entities_used_in_graphql as top_level}/{path top_level.namespace}/entity/{lower-snake top_level.name}/{top_level.class_name}RepositoryImpl.kt.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{each service.top_level_entities_used_in_graphql as top_level}/{path top_level.namespace}/entity/{lower-snake top_level.name}/{top_level.class_name}Repository.kt.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{each service.top_level_entities_used_in_graphql as top_level}/{path top_level.namespace}/entity/{lower-snake top_level.name}/{top_level.class_name}Repository.kt.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{path service.namespace}/configuration/CorsConfig.kt.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{path service.namespace}/configuration/CorsConfig.kt.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{path service.namespace}/configuration/GraphqlConfig.kt.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{path service.namespace}/configuration/GraphqlConfig.kt.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{path service.namespace}/query/IntSearchInput.kt.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{path service.namespace}/query/IntSearchInput.kt.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{path service.namespace}/query/QueryResolver.kt.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{path service.namespace}/query/QueryResolver.kt.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{path service.namespace}/query/StringSearchInput.kt.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{path service.namespace}/query/StringSearchInput.kt.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{path service.namespace}/{upper-camel service.name}Application.kt.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{path service.namespace}/{upper-camel service.name}Application.kt.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{path service.namespace}/util/util.kt.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/kotlin/{path service.namespace}/util/util.kt.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/resources/application.properties.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/resources/application.properties.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/resources/{each service.top_level_entities_used_in_graphql as top_level}/{path top_level.namespace}/entity/{lower-snake top_level.name}/{each top_level.aggregated_entities as entity}/{entity.class_name}.graphql.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/resources/{each service.top_level_entities_used_in_graphql as top_level}/{path top_level.namespace}/entity/{lower-snake top_level.name}/{each top_level.aggregated_entities as entity}/{entity.class_name}.graphql.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/resources/logback.xml](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/resources/logback.xml>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/resources/{path service.namespace}/query/IntSearchInput.hbs.graphql](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/resources/{path service.namespace}/query/IntSearchInput.hbs.graphql>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/resources/{path service.namespace}/query/Query.graphql.hbs](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/resources/{path service.namespace}/query/Query.graphql.hbs>)
- [src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/resources/{path service.namespace}/query/StringSearchInput.hbs.graphql](<./src/template/dest/{each environments as environment}/{hyphen environment.name}/{each environment.components as component}/{hyphen component.name}/{if (eq component.type 'springboot2_api_service')}/{with component.function_model as service}/src/gen/resources/{path service.namespace}/query/StringSearchInput.hbs.graphql>)


<!-- @main-content@ -->