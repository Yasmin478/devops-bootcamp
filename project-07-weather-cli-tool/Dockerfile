# Base image
FROM ubuntu:latest

# Install dependencies
RUN apt-get update -o Acquire::Check-Valid-Until=false && apt-get install -y curl jq

# Set working directory
WORKDIR /app

# Copy script into container
COPY weather.sh .

# Make script executable
RUN chmod +x weather.sh

# Default command
ENTRYPOINT ["./weather.sh"]