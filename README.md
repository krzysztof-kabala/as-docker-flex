AS docker - Symfony Flex
========================
implement Docker into Your Symfony project


Requirements
---
 * configure Your local [projects enrironment](https://bitbucket.org/as-docker/projects-environment)
 * [optional] install composer globally [global composer command](https://hub.docker.com/r/amsdard/composer/)
 * make sure You have [YAKE](https://yake.amsdard.io/) installed
 * fresh symfony skeleton ^3.4


Install
---
```
composer require amsdard/symfony-as-docker
./vendor/amsdard/symfony-as-docker/install.sh
```
* see Your new local README.md


Full example
---
```
composer create-project symfony/skeleton my-project
composer require amsdard/symfony-as-docker
./vendor/amsdard/symfony-as-docker/install.sh
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