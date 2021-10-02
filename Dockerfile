FROM node:16-alpine3.11 as app-builder
RUN npm i -g @angular/cli
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN ng build

FROM nginx:alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=app-builder /app/dist/* ./