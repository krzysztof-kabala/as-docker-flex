#!/usr/bin/env bash

## vendor source directory
VENDOR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
## user project directory path
PROJECT_DIR=$(pwd)
## user project directory name
PROJECT_NAME=${PWD##*/}

## install once only
if [[ -f "$PROJECT_DIR/docker-compose.yml" ]]; then
    exit 0;
fi;

## copy files
scp -rp "$VENDOR_DIR/files/deploy" "$PROJECT_DIR/deploy"
scp -rp "$VENDOR_DIR/files/docker" "$PROJECT_DIR/docker"
scp -rp "$VENDOR_DIR/files/Yakefile" "$PROJECT_DIR/"
scp -rp "$VENDOR_DIR/files/docker-compose.yml" "$PROJECT_DIR/"
scp -rp "$VENDOR_DIR/files/README.md" "$PROJECT_DIR/"

## make docker-compose.yml complete
perl -pi -w -e "s/{name}/$PROJECT_NAME/g" "$PROJECT_DIR/README.md"
perl -pi -w -e "s/{name}/$PROJECT_NAME/g" "$PROJECT_DIR/docker-compose.yml"
perl -pi -w -e "s/{name}/$PROJECT_NAME/g" "$PROJECT_DIR/deploy/rancher/docker-compose.yml"
perl -pi -w -e "s/{name}/$PROJECT_NAME/g" "$PROJECT_DIR/deploy/prod/docker-compose.yml"

## complete .gitignore
echo $'\n###< as-docker-flex ###\n/docker/*/*.env\n/composer.phar\n###> as-docker-flex ###' >> "$PROJECT_DIR/.gitignore"