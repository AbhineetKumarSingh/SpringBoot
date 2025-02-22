<<<<<<< HEAD
FROM openjdk:17-jdk-slim
=======
FROM openjdk:17
>>>>>>> af50349a745e890ff69a1946f036414fafb5959a

COPY target/Demo_Application.jar /usr/app/

WORKDIR /usr/app/

EXPOSE 8090

ENTRYPOINT [ "java","-jar","Demo_Application.jar"]
