FROM node

RUN mkdir /app
WORKDIR /app

COPY bower.json /app/
COPY .bowerrc /app

RUN npm install -g bower

RUN bower --allow-root install


FROM nginx

MAINTAINER Gustavo Apolinario <gustavo.guss@gmail.com>

RUN apt-get update && apt-get upgrade -y \
    && apt-get clean

RUN mkdir /app

COPY --from=0 /app /app
COPY src /app/src

WORKDIR /app

