#!/bin/bash
IMAGE_TAG=$1

echo "Deploying $IMAGE_TAG to EC2..."
ssh -o StrictHostKeyChecking=no ubuntu@$EC2_HOST << EOF
  docker stop my-app 2>/dev/null || true
  docker rm my-app 2>/dev/null || true
  docker run -d --name my-app -p 8080:8080 $IMAGE_TAG
EOF
echo "App running at http://$EC2_HOST:8080"