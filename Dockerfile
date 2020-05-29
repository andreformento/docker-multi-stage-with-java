# syntax = docker/dockerfile:experimental

#############
# Build App
FROM openjdk:9-slim as build

ENV APP_HOME=/root/

WORKDIR $APP_HOME
ADD gradle $APP_HOME/gradle
ADD build.gradle $APP_HOME/build.gradle
ADD gradlew $APP_HOME/gradlew
ADD src $APP_HOME/src

RUN --mount=type=cache,target=/root/.m2 \
    --mount=type=cache,target=/root/.gradle \
    ./gradlew build

# #############
# Final image
FROM openjdk:9-slim
WORKDIR /root/
COPY --from=build /root/build/libs/*.jar app.jar

EXPOSE 8080

CMD ["java","-jar","app.jar"]
