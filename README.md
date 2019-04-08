# laplacian-arch:template:api-server.springboot

This template gives a service api implementation based on a 'laplacian-arch.service-api' model.
The implementation employs following architechture stack:
  - Alpine based docker image
  - OpenJDK8
  - SpringBoot 2
  - Java-Graphql

By default, a sub-project is generated for each 'feature' in the model and each sub-project can be deployed
as an independent service.



## Dependent models
This template generates resources based on the following models:

- laplacian-arch.model.service-api-arch


## Getting started

Firstly, you need to add the following entry to your `laplacian-module.yml` :

```yaml
project:
  group: ${your.project.group}
  name: ${your.project.name}
  type: project
  version: "1.0.0"
  templates:
  ## ↓↓ ADD ↓↓ ##
  - group: laplacian-arch
    name: api-server
    subname: springboot
    version: "1.0.0"
  ## ↑↑ ADD ↑↑ ##
```

To reflect the change, you need to type the following command in your console :
```bash
./gradlew lM
```

Then put some model files under the *./model* directory and type the following command to generate files:
```bash
./gradlew lG
```