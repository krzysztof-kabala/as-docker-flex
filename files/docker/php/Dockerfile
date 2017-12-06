FROM amsdard/php:7

ENV WORKDIR=/opt

# build data
RUN date > /builddate
COPY ./app $WORKDIR/app
COPY ./bin $WORKDIR/bin
COPY ./src $WORKDIR/src
COPY ./var $WORKDIR/var
COPY ./web $WORKDIR/web
COPY ./vendor $WORKDIR/vendor
COPY ./composer.json $WORKDIR
RUN chown 1000:1000 -R /opt

# build php