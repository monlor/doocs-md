#!/bin/bash

RELEASE_DIR='./docker';
REPO_NAME='ghcr.io/doocs/md'

echo "Images have been built and pushed to GitHub Container Registry (GHCR)"
echo "Repository: $REPO_NAME"

# 列出已构建并推送的镜像
for app_ver in $RELEASE_DIR/*; do
    if [ -f "$app_ver/.env" ]; then
        . "$app_ver/.env"
        echo "----------------"
        echo "Version: $VER_APP"
        
        if [ -f "$app_ver/Dockerfile.base" ]; then
            echo "- $REPO_NAME:$VER_APP-assets"
        fi
        
        if [ -f "$app_ver/Dockerfile.standalone" ]; then
            echo "- $REPO_NAME:$VER_APP"
        fi
        
        if [ -f "$app_ver/Dockerfile.nginx" ]; then
            echo "- $REPO_NAME:$VER_APP-nginx"
        fi
        
        if [ -f "$app_ver/Dockerfile.static" ]; then
            echo "- $REPO_NAME:$VER_APP-static"
        fi
    fi
done

echo "----------------"
echo "所有多架构镜像已成功构建并推送到 GHCR"