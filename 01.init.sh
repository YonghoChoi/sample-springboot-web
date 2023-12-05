#!/bin/bash

APP_NAME=sample-web

aws ecr create-repository \
--repository-name $APP_NAME \
--image-scanning-configuration scanOnPush=true \
--region ${AWS_REGION}

aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

docker buildx create --name builder --use --platform linux/amd64,linux/arm64
docker buildx inspect --bootstrap
docker buildx ls
