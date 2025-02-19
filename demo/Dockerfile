FROM amazoncorretto:23.0.2-alpine3.21 as builder

WORKDIR /app

COPY . .
# Build the application
RUN ./gradlew bootJar

FROM amazoncorretto:23.0.2-alpine3.21

COPY --from=builder /app/build/libs/demo-0.0.1-SNAPSHOT.jar /demo-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","/demo-0.0.1-SNAPSHOT.jar"]