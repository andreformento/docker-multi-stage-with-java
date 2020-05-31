# syntax = docker/dockerfile:experimental

#############
# Build App
FROM openjdk:14.0-jdk as build

ENV APP_HOME=/root/

WORKDIR $APP_HOME
ADD gradle gradle
ADD build.gradle build.gradle
ADD gradlew gradlew
ADD src src

RUN --mount=type=cache,target=/root/.m2 \
    --mount=type=cache,target=/root/.gradle \
    ./gradlew build --no-daemon

# #############
# Final image
FROM openjdk:14.0-jdk

WORKDIR /root/

COPY --from=build /root/build/libs/*.jar app.jar

EXPOSE 8080

CMD ["java", \
     "-XX:+UnlockExperimentalVMOptions", \
     "-jar", \
     "app.jar"]
