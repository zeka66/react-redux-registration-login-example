#!/bin/bash
set -ev

TAG=$1
DOCKER_USERNAME=$2
DOCKER_PASSWORD=$3

# Create publish artifact
dotnet publish -c Release .
cp Dockerfile bin/Release/netcoreapp2.2/publish/

# Build the Docker images
docker build -t zeka66/aspnet-core-registration-login-api:$TAG bin/Release/netcoreapp2.2/publish/.
docker tag zeka66/aspnet-core-registration-login-api:$TAG zeka66/aspnet-core-registration-login-api:latest

# Login to Docker Hub and upload images
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker push zeka66/aspnet-core-registration-login-api:$TAG
docker push zeka66/aspnet-core-registration-login-api:latest