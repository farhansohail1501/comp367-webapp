FROM maven:latest AS build
WORKDIR /workspace/app

# Copy the Maven wrapper files
COPY mvnw .
COPY mvnw.cmd .
COPY .mvn .mvn

# Copy the project files
COPY pom.xml .
COPY src src

# Build the application with Maven
RUN mvn clean install -DskipTests
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
ARG DEPENDENCY=/workspace/app/target/dependency
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java", "-cp", "app:app/lib/*", "com.example.comp367webapp.Comp367WebappApplication"]
