# Use the official Gradle image as the build environment
FROM gradle:7.3.3-jdk11 AS build

# Set the working directory
WORKDIR /app

# Copy Gradle Wrapper files
COPY gradlew .
COPY gradle gradle

# Copy only the build files needed for dependency resolution
COPY build.gradle settings.gradle ./

# Give execute permissions to the Gradle Wrapper
RUN chmod +x gradlew

# Download and resolve dependencies using the Gradle Wrapper
RUN ./gradlew dependencies

# Copy the rest of the source code
COPY . .

# Give execute permissions to the Gradle Wrapper
RUN chmod +x gradlew

# Build the application using the Gradle Wrapper
RUN ./gradlew build --stacktrace

# Use a minimal base image for the runtime
FROM adoptopenjdk:11-jre-hotspot

# Set the working directory
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/build/libs/demo-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your app runs on
EXPOSE 8080

# Define the command to run your application
CMD ["java", "-jar", "app.jar"]
