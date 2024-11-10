#!/bin/bash

aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 269715254496.dkr.ecr.ap-southeast-1.amazonaws.com/smd-copilot-metric-viewer

docker build -t copilot-metric-viewer -f api.Dockerfile .

docker tag copilot-metric-viewer:latest 269715254496.dkr.ecr.ap-southeast-1.amazonaws.com/smd-copilot-metric-viewer:latest

docker push 269715254496.dkr.ecr.ap-southeast-1.amazonaws.com/smd-copilot-metric-viewer:latest

helm upgrade --install --namespace=copilot-metric-viewer copilot-metric-viewer ./copilot-metric-viewer