FROM openjdk:17-jdk-slim

WORKDIR /app

COPY ./api-exchance-0.0.1-SNAPSHOT|. jar /app/api-exchance.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "api-exchance.jar")
