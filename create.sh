#!/bin/bash

# 创建目录
mkdir -p dify-sandbox-docker/scripts

# 创建文件
touch dify-sandbox-docker/Dockerfile
touch dify-sandbox-docker/docker-compose.yml
touch dify-sandbox-docker/.env
touch dify-sandbox-docker/requirements.txt
touch dify-sandbox-docker/package.json
touch dify-sandbox-docker/README.md
touch dify-sandbox-docker/scripts/detect_interpreters.sh
touch dify-sandbox-docker/scripts/install_dependencies.sh

echo "目录和初始文件创建完成！"
