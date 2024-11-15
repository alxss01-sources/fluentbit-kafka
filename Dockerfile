FROM openjdk:17-alpine

WORKDIR /app

COPY target/fluentbit-kafka.jar app.jar

ENTRYPOINT [ "java", "-jar", "app.jar" ]