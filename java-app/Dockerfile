###############
# Maven 
#
FROM maven:3.6.3-jdk-11-slim as maven

WORKDIR /app

RUN apt-get update -y && apt-get install curl -y

RUN curl -O https://repo1.maven.org/maven2/com/cyberark/conjur/api/conjur-api/3.0.2/conjur-api-3.0.2-with-dependencies.jar \
    && mvn org.apache.maven.plugins:maven-install-plugin:2.5.2:install-file -Dfile=conjur-api-3.0.2-with-dependencies.jar

COPY pom.xml ./pom.xml
RUN  mvn verify clean --fail-never 

COPY ./src ./src
RUN mvn package 

###############
# Java App 
#
FROM openjdk:11-jre-slim
MAINTAINER Quincy Cheng

RUN apt-get update -y && apt-get install curl -y

COPY --from=maven /app/target/java-app-1.0-SNAPSHOT-jar-with-dependencies.jar /app.jar
COPY start.sh /start.sh
COPY curl.sh /curl.sh  

ENTRYPOINT [ "/start.sh" ]
