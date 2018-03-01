#############
# Build App
FROM openjdk:9-slim as build

ENV APP_HOME=/root/dev/

RUN mkdir -p $APP_HOME/src/main/java
WORKDIR $APP_HOME
COPY build.gradle gradlew $APP_HOME
COPY gradle $APP_HOME/gradle
# download gradle
RUN ./gradlew clean
# download dependencies
RUN ./gradlew build -x test --continue
COPY . .
RUN ./gradlew build

#############
# Final image
FROM openjdk:9-slim
WORKDIR /root/
COPY --from=build /root/dev/build/libs/*.jar app.jar
EXPOSE 8080
CMD ["java","-jar","app.jar"]
