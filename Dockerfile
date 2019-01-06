FROM node

RUN mkdir /app
WORKDIR /app

COPY package.json /app/
RUN npm install

FROM nginx

RUN apt-get update && apt-get upgrade -y \
    && apt-get clean

RUN mkdir /app

COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=0 /app /app
COPY src /app/src

WORKDIR /app

