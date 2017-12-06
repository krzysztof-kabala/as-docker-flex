Symfony Standard Edition - AS docker edition
========================

See [DOCS](https://symfony.com/doc/current/index.html) for more details.


Requirements
---
 * configure Your local [projects enrironment](https://bitbucket.org/as-docker/projects-environment)
 * [optional] install composer globally [global composer command](https://hub.docker.com/r/amsdard/composer/)
 * make sure You have [YAKE](https://yake.amsdard.io/) installed


Create project
---
* git only way
```
git clone git@github.com:amsdard/symfony-standard.git project-name
# cd to project directory
yake composer install
```
* global `composer` way
```
composer create-project amsdard/symfony-standard project-name
```


First project install
---
```
yake configure-docker
# configure each "./docker/*/config.env"
yake up
yake console assetic:watch   # run in background
```
* directory name `project-name` will become Your domain name: `project-name.app` and Your container's image tag namespace
* remove YAKE `configure-docker` task from `Yakefile`
* update `composer.json` by Your project name, description
* do not use `require-dev` in composer.json (keep common vendors)
* if You want to use local composer (based on PHP image) - RECOMMENDED:
```
curl -fsSL 'https://getcomposer.org/composer.phar' -o ./composer.phar
```
and replace YAKE *composer* task by:
```
composer: $BIN php ./composer.phar --optimize-autoloader $CMD
```
* run `yake console assetic:watch` in background to work with assets
* `yake console assetic:dump --env=prod --no-debug` before deploy


Deploy (dev / rancher)
---
```
yake push php
yake push nginx
```
* import `./deploy/rancher/docker-compose.yml` into Rancher + complete ENVs
* make sure `mysql` works on specific host (Scheduling)
* make sure `nginx` has *Health Check* enabled


Deploy (prod)
---
```
yake push php
yake push nginx
```
* import `./deploy/prod/docker-compose.yml` into server + copy ENV files from `docker` directory
* `docker-compose pull --parallel --quiet`
* `docker-compose up -d --force-recreate`

