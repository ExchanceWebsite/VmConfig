FROM openjdk:17-jdk-slim

FROM maven:3.9.4

COPY /home/ubuntu/spring-certificate/certificado.p12  /app/

COPY ./api-exchance-0.0.1-SNAPSHOT.jar api-exchance.jar


ENTRYPOINT ["java", "-jar", "api-exchance.jar"]

EXPOSE 8080

