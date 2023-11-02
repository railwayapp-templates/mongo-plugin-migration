FROM ubuntu:20.04

# Avoid prompts from apt during build
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages including MongoDB tools
RUN apt-get update && \
    apt-get install -y bash ncurses-bin wget gnupg && \
    wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add - && \
    echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list && \
    apt-get update && \
    apt-get install -y mongodb-org-shell mongodb-org-tools build-essential

# Set your working directory
WORKDIR /app

# Copy all your files into the image
COPY . .

# Make sure your script is executable
RUN chmod +x ./migrate.sh

# Run your script
CMD ["bash", "./migrate.sh"]
