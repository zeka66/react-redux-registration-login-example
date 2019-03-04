#!/bin/bash
set -ev

TAG=$1
DOCKER_USERNAME=$2
DOCKER_PASSWORD=$3

# Create publish artifact

# dotnet publish -c Release .

# cp Dockerfile bin/Release/netcoreapp2.2/publish/

# Build the Docker images
docker build -t zeka66/react-redux-registration-login-example:$TAG zeka66/react-redux-registration-login-example/node_modules/react
docker tag zeka66/react-redux-registration-login-example:$TAG zeka66/react-redux-registration-login-example:latest

# Login to Docker Hub and upload images
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker push zeka66/react-redux-registration-login-example:$TAG
docker push zeka66/react-redux-registration-login-example:latest

