#!/bin/bash
set -o allexport; source .env; set +o allexport
docker run -p 8080:8080 --rm ${IMAGE_NAME} 
