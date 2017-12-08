AS docker - Symfony (flex)
========================
implement Docker into Your Symfony (^4.0) project using flex


Requirements
---
 * configure Your local [projects enrironment](https://bitbucket.org/as-docker/projects-environment)
 * [optional] install composer globally [global composer command](https://hub.docker.com/r/amsdard/composer/)
 * make sure You have [YAKE](https://yake.amsdard.io/) installed
 * fresh symfony skeleton ^4.0


Install
---
```
composer require amsdard/symfony-as-docker
```
* see Your new local README.md


Install - Full sample
---
create a new project
```
composer create-project symfony/skeleton my_project
```

allow to use community contrib
```
composer config extra.symfony.allow-contrib true
```

install basic Symfony components
```
composer require annotations validator encore translator security debug-pack make
```

install as-docker
```
composer require amsdard/symfony-as-docker
```

run the project
```
yake yarn install
yake configure
yake up
```


How it works
---
* below file structure will be installed
```
.
├── README.md
├── docker-compose.yml
├── Yakefile
├── deploy
│   ├── prod
│   │   └── docker-compose.yml
│   └── rancher
│       └── docker-compose.yml
└── docker
    ├── mysql
    │   ├── config.env
    │   └── config.env.dist
    ├── nginx
    │   ├── Dockerfile
    │   └── default.conf
    └── php
        └── Dockerfile
```
* Your project directory name will be filled as local domain name and docker image namespace (see `docker-compose.yml`)
* new rules will be added to Your `.gitignore` file: 
  * `/composer.phar` internal project composer
  * `/docker/*/*.env` container ENV
 
