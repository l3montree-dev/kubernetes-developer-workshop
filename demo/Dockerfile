FROM amazoncorretto:23.0.2-alpine3.21 AS builder

WORKDIR /
COPY . .

RUN ./gradlew bootJar
RUN cp /build/libs/demo-0.0.1-SNAPSHOT.jar /demo-0.0.1-SNAPSHOT.jar

# -------- Uncomment the two lines below to use a multi stage build --------
# FROM amazoncorretto:23.0.2-alpine3.21
# COPY --from=builder /demo-0.0.1-SNAPSHOT.jar /demo-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","/demo-0.0.1-SNAPSHOT.jar"]