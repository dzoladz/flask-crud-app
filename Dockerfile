# First Dockerfile
FROM ubuntu:18.04
MAINTAINER Derek C. Zoladz version: 0.1

# apt-get packages
RUN apt-get update && \
	apt-get install -y git \
			python3.6 \
			python3-pip && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# pip install 
RUN pip3 install \
	flask \
	sqlalchemy \
	flask-sqlalchemy

# Build application
RUN mkdir -p /app/flask-crud-app
WORKDIR /app
RUN git clone https://github.com/dzoladz/flask-crud-app
WORKDIR /app/flask-crud-app

# Expose ports
EXPOSE 5000

# Command
CMD ["python3", "bookmanager.py"]
