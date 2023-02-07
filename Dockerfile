FROM openjdk:17
LABEL maintainer="jean.denis.rafenoarisoa@gmail.com"
ADD /target/eureka-server-0.0.1-SNAPSHOT.jar /home/eureka-server-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/home/eureka-server-0.0.1-SNAPSHOT.jar", "--spring.profiles.active=prod"]