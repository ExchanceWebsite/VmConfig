FROM openjdk

WORKDIR /app

COPY ./spring-app-B.0.1-SNAPSHOT|. jar /app/spring-app.jar

ENTRYPOINT ["java", "-jar", "spring-app.jar")
