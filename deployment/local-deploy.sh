#!/bin/bash
IMAGE_TAG=$1

echo "Deploying $IMAGE_TAG locally..."
docker stop my-app 2>/dev/null || true
docker rm my-app 2>/dev/null || true
docker run -d --name my-app -p 8080:8080 $IMAGE_TAG
echo "App running at http://localhost:8080"