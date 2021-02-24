###############
# Maven 
#
FROM maven:3.6.3-jdk-11-slim as maven

WORKDIR /app

COPY pom.xml ./pom.xml
RUN mvn verify clean --fail-never

COPY ./src ./src
RUN mvn package && mv target/java-app-*-jar-with-dependencies.jar app.jar

###############
# Java App 
#
FROM openjdk:11-jre-slim
MAINTAINER Quincy Cheng

COPY --from=maven /app/app.jar /app.jar
COPY start.sh /start.sh
COPY curl.sh /curl.sh

RUN apt-get update -y && apt-get install curl -y

ENTRYPOINT [ "/start.sh" ]
