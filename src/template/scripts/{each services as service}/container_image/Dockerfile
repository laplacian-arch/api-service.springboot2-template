FROM zenika/kotlin:1.3-jdk8-alpine
VOLUME /tmp
COPY build/app.jar app.jar
COPY entrypoint.sh entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]

