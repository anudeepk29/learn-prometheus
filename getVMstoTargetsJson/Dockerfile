# Use Ubuntu as the base image
FROM ubuntu:20.04

# Set non-interactive frontend for apt
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install dependencies (Terraform, Java, Git)
RUN apt-get update && \
    apt-get install -y wget gnupg software-properties-common curl git python3 python3-pip bash && \
    apt-get clean

WORKDIR /app

COPY . /app/

RUN mkdir /var/targets
RUN /app/app.sh
# Entry point (optional)
# ENTRYPOINT ["/bin/bash"]