FROM maven AS build-stage
ENV APP_NAME=sample-web
WORKDIR /opt/$APP_NAME

COPY . .
RUN mvn package

FROM amazoncorretto:21-alpine
ENV APP_NAME=sample-web
COPY --from=build-stage /opt/$APP_NAME/target/$APP_NAME.jar /app/$APP_NAME.jar

WORKDIR /app
EXPOSE 8080
CMD [ "sh", "-c", "java -jar /app/$APP_NAME.jar" ]