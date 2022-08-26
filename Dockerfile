#FROM tomcat:latest
#RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
#COPY ./*.war /usr/local/tomcat/webapps

FROM maven:3.6.0-jdk-11 AS build  
COPY server /usr/src/app/server  
COPY webapp /usr/src/app/webapp
COPY pom.xml /usr/src/app  
RUN mvn -f /usr/src/app/pom.xml clean package

#
# Package stage
#
FROM gcr.io/distroless/java 
COPY --from=build ./usr/src/app/server/src/main/java/com/example/Greeter.java /usr/app/Greeter.java
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/app/Greeter.java"]


 