# syntax=docker/dockerfile:experimental

# Stage 1: Build the application
FROM eclipse-temurin:17-jdk-alpine as build
WORKDIR /workspace/app

# Copy the Maven wrapper files
COPY mvnw .
COPY .mvn .mvn

# Copy the project files
COPY pom.xml .
COPY src src

# Build the application with Maven
RUN --mount=type=cache,target=/root/.m2 ./mvnw install -DskipTests
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

# Stage 2: Create the final image
FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
ARG DEPENDENCY=/workspace/app/target/dependency

# Copy dependency jars and application resources
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF

# Copy application classes
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app

# Set the entry point
ENTRYPOINT ["java", "-cp", "app:app/lib/*", "com.example.comp367webapp.Comp367WebappApplication"]
