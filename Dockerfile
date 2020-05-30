# syntax = docker/dockerfile:experimental

#############
# Build App
FROM openjdk:14.0-jdk as build

ENV APP_HOME=/app

WORKDIR $APP_HOME
ADD gradle gradle
ADD build.gradle build.gradle
ADD gradlew gradlew
ADD src src

RUN --mount=type=cache,target=$APP_HOME/.m2 \
    --mount=type=cache,target=$APP_HOME/.gradle \
    ./gradlew build --no-daemon

# #############
# Final image
FROM openjdk:14.0-jdk
WORKDIR /app/
COPY --from=build /app/build/libs/*.jar app.jar

EXPOSE 8080

CMD ["java", \
     "-XX:+UnlockExperimentalVMOptions", \
     "--enable-preview", \
     "-jar", \
     "app.jar"]
