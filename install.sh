#!/usr/bin/env bash

## vendor source directory
VENDOR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
## user project directory path
PROJECT_DIR=$(pwd)
## user project directory name
PROJECT_NAME=${PWD##*/}

## install once only
if [[ -f "$PROJECT_DIR/docker-compose.yml" ]]; then
    printf "You have as-docker installed!"
    exit 1;
fi;

## copy files
scp -rp "$VENDOR_DIR/files/deploy" "$PROJECT_DIR/deploy"
scp -rp "$VENDOR_DIR/files/Yakefile" "$PROJECT_DIR/"
scp -rp "$VENDOR_DIR/files/docker-compose.yml" "$PROJECT_DIR/"
scp -rp "$VENDOR_DIR/files/README.md" "$PROJECT_DIR/"

## make docker-compose.yml complete
perl -pi -w -e "s/{name}/$PROJECT_NAME/g" "$PROJECT_DIR/README.md"
perl -pi -w -e "s/{name}/$PROJECT_NAME/g" "$PROJECT_DIR/docker-compose.yml"
perl -pi -w -e "s/{name}/$PROJECT_NAME/g" "$PROJECT_DIR/deploy/rancher/docker-compose.yml"
perl -pi -w -e "s/{name}/$PROJECT_NAME/g" "$PROJECT_DIR/deploy/prod/docker-compose.yml"

## final alert
printf "as-docker installed!\n\n"
printf "See [doc] for more details\n"