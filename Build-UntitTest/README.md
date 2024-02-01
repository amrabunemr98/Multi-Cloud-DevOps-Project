# Project Title

## Building and Testing with Gradle in Docker

This Dockerfile is designed to facilitate building and testing a Gradle-based project within a containerized environment. Follow the instructions below to effectively utilize this setup.

### Instructions:

1. **Use Official Gradle Image:**
   - This Dockerfile utilizes the official Gradle image (`gradle:7.3.3-jdk11`) as the build environment.

2. **Set Working Directory:**
   - The working directory is set to `/app`. Ensure your project structure aligns with this directory organization.

3. **Copy Gradle Wrapper Files:**
   - Gradle Wrapper files (`gradlew` and the `gradle` directory) are copied into the container.

4. **Copy Build Files:**
   - Copy `build.gradle` and `settings.gradle` files to facilitate dependency resolution.

5. **Resolve Dependencies:**
   - Execute the Gradle Wrapper to download and resolve project dependencies.

     ```bash
     RUN ./gradlew dependencies
     ```

6. **Copy Source Code:**
   - Copy the entire source code into the container.

7. **Run Tests:**
   - Execute tests using the Gradle Wrapper. The `--stacktrace` flag provides detailed stack traces in case of failures.

     ```bash
     RUN ./gradlew test --stacktrace
     ```

Feel free to customize this README to better fit the specifics of your project. Add additional sections, such as prerequisites, usage, or contributing guidelines, as needed.
