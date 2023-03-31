ARG NGINX_IMAGE

FROM ${NGINX_IMAGE}

## Если нужна basic авторизация через nginx используй следующие закоменченые команды
## И в docker build не забудь добавить --build-arg APP_ENV=development или production
## В production basic отключен
#ARG APP_ENV
#ENV APP_ENV=$APP_ENV
#RUN apk add apache2-utils

## Если нужна basic авторизация раскоментируй строку ниже и закоментируй следуюшую за ней
#COPY .docker/nginx/default_$APP_ENV.conf etc/nginx/conf.d/default.conf
COPY .docker/nginx/default.conf etc/nginx/conf.d/default.conf

WORKDIR /usr/share/nginx/html

ARG DIST_DIR
ENV DIST_DIR=$DIST_DIR
COPY $DIST_DIR .

ARG NAMESPACE
ENV NAMESPACE=$NAMESPACE
COPY $NAMESPACE .

## Если нужна basic авторизация через nginx используй 2 нижнии строки
#ARG BASIC_USER
#ARG BASIC_PASS
#ENV BASIC_USER=$BASIC_USER
#ENV BASIC_PASS=$BASIC_PASS
#RUN if [ "$APP_ENV" != "production" ] ; then htpasswd -bc /etc/nginx/.htpasswd $BASIC_USER $BASIC_PASS; else echo 'app in production mod'; fi
#RUN apk del apache2-utils


