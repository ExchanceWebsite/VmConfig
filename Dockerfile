FROM openjdk

WORKDIR /app

COPY ./api-exchance-0.0.1-SNAPSHOT|. jar /app/api-exchance.jar

ENTRYPOINT ["java", "-jar", "api-exchance.jar")
