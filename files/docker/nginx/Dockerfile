FROM nginx

# build config
COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf

# build data
ENV WORKDIR=/opt
RUN date > /builddate
COPY ./web $WORKDIR/web

# build nginx