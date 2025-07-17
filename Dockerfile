FROM openjdk:17.0.2

# Install Maven
RUN apt-get update && apt-get install -y maven

# Copy project
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp

# Package the WAR
RUN mvn clean package -DskipTests

# Run app using Jetty profile (you can replace 'jetty' with any other valid one like 'tomee80')
CMD ["mvn", "cargo:run", "-P", "jetty"]
