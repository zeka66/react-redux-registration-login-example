#!/bin/bash
set -ev

TAG=$1
DOCKER_USERNAME=$2
DOCKER_PASSWORD=$3


# Build the Docker images
docker build -t [secure]/react-redux-registration-login-example .
docker tag zeka66/react-redux-registration-login-example:$TAG zeka66/react-redux-registration-login-example:latest


# Login to Docker Hub and upload images
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker push zeka66/react-redux-registration-login-example:latest

