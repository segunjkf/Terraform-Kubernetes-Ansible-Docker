FROM maven:3.5-jdk-8 AS build  
COPY src /usr/src/app/src  
COPY pom.xml /usr/src/app  
RUN mvn -f /usr/src/app/pom.xml clean package

#
# Package stage
#
FROM openjdk:11-jre-slim
COPY --from=build ./server/src/main/java/com/example/Greeter.java /usr/local/lib/greeter.java
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/Greeter.java"]

