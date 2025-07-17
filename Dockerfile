FROM maven:3.9.6-eclipse-temurin-17-alpine

# Set working directory
WORKDIR /usr/src/myapp

# Copy project files
COPY . .

# Package the WAR without running tests
RUN mvn clean package -DskipTests

# Run the app using cargo plugin with jetty profile (make sure it exists)
CMD ["mvn", "cargo:run", "-P", "jetty"]
