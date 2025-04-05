FROM node:21-alpine3.19

WORKDIR /usr/src/app

COPY package.json ./
COPY package-lock.json ./

RUN npm install

# Instalar wait-for-it
RUN apk --no-cache add bash
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /usr/local/bin/wait-for-it.sh
RUN chmod +x /usr/local/bin/wait-for-it.sh

COPY . .

EXPOSE 3002