group = "laplacian-arch"
version = "1.0.0"

plugins {
    `maven-publish`
    kotlin("jvm") version "1.3.10"
    id("laplacian-arch.model.service-api-arch") version "1.0.0"
}

repositories {
    maven(url = "../mvn-repo/")
    maven(url = "https://raw.github.com/nabla-squared/mvn-repo/master/")
    jcenter()
}




val templateModule by tasks.register<Jar>("templateModule") {
    from(laplacianGenerate.templateSources)
}

dependencies {
    model("laplacian-arch:laplacian-arch.model-def.service-api-arch:1.0.0")
}

publishing {
    repositories {
        maven(url = "../mvn-repo/")
    }
    publications {
        create<MavenPublication>("mavenJava") {
            artifact(templateModule)
        }
    }
}