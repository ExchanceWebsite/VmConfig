FROM openjdk:17-jdk-slim

FROM maven:3.9.4

COPY ./api-exchance-0.0.1-SNAPSHOT.jar api-exchance.jar
COPY ./certificado.p12  /app/

ENTRYPOINT ["java", "-jar", "api-exchance.jar"]

EXPOSE 8080

