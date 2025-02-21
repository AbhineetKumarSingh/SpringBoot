FROM openjdk:17

COPY target/Demo_Application.jar /usr/app/

WORKDIR /usr/app/

EXPOSE 8090

ENTRYPOINT [ "java","-jar","Demo_Application.jar"]
