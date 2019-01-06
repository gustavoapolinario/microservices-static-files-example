FROM nginx

RUN apt-get update && apt-get upgrade -y \
    && apt-get clean

RUN mkdir /app
WORKDIR /app

COPY package.json /app/
RUN npm install --only=production

COPY nginx.conf /etc/nginx/nginx.conf
COPY src /app/src


