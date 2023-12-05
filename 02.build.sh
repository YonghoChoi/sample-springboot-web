#!/bin/bash

APP_NAME=sample-web

aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# docker build -t $APP_NAME .
# docker tag $APP_NAME:latest $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$APP_NAME:latest
# docker push $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$APP_NAME:latest

docker buildx build --push \
  --platform linux/arm64,linux/amd64\
  --tag $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$APP_NAME .