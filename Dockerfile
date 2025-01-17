FROM openjdk:8-alpine

# Required for starting application up.
RUN apk update && apk add bash

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/spring-boot-mongo-1.0.jar $PROJECT_HOME/spring-boot-mongo.jar

WORKDIR $PROJECT_HOME
EXPOSE 8080
CMD ["java", "-Dspring.data.mongodb.uri=mongodb://mongo:27017/spring-mongo", "-Djava.security.egd=file:/dev/./urandom", "-jar", "spring-boot-mongo.jar"]

