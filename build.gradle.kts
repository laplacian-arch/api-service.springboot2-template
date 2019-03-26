import laplacian.gradle.task.LaplacianGenerateExtension
group = "laplacian-arch"
version = "1.0.0"
plugins {
    `maven-publish`
    kotlin("jvm") version "1.3.10"
    id("laplacian.generator") version "1.0.0"
}
repositories {
    maven(url = "../mvn-repo/")
    maven(url = "https://raw.github.com/nabla-squared/mvn-repo/maven/")
    jcenter()
}
dependencies {
}
configure<LaplacianGenerateExtension> {
    template {
        from("src/main/resources")
    }
}
publishing {
    repositories {
        maven(url = "../mvn-repo/")
    }
    publications.create("mavenJava", MavenPublication::class.java) {
        from(components["java"])
    }
}