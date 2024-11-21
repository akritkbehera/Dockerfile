FROM jenkins/jenkins:lts

USER root

# Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    unzip

# Create test directory
WORKDIR /app
COPY test.sh .
RUN chmod +x test.sh

# Switch back to Jenkins user
USER jenkins

# Jenkins port
EXPOSE 8080

# Default command
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]
