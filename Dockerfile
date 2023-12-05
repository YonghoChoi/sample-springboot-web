FROM maven AS build-stage
ENV APP_NAME=sample-web
WORKDIR /opt/$APP_NAME

COPY pom.xml .
RUN mvn -B dependency:go-offline

COPY ../sample-web .
RUN mvn package

FROM amazoncorretto:11.0.20-alpine
ENV APP_NAME=sample-web
COPY --from=build-stage /opt/$APP_NAME/target/$APP_NAME.jar /app/$APP_NAME.jar

WORKDIR /app
EXPOSE 8080
ENTRYPOINT [ "/jre/bin/java", "-jar", "/app/$APP_NAME.jar" ]