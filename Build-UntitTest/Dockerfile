# Use the official Gradle image as the build environment
FROM gradle:7.3.3-jdk11 AS build

# Set the working directory
WORKDIR /app

# Copy Gradle Wrapper files
COPY ../gradlew .
COPY ../gradle gradle

# Copy only the build files needed for dependency resolution
COPY ../build.gradle settings.gradle ./

# Give execute permissions to the Gradle Wrapper
RUN chmod +x gradlew

# Download and resolve dependencies using the Gradle Wrapper
RUN ./gradlew dependencies

# Copy the rest of the source code
COPY ../ .

# Give execute permissions to the Gradle Wrapper
RUN chmod +x gradlew

# Run tests using the Gradle Wrapper
RUN ./gradlew test --stacktrace
