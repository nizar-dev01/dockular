FROM node:lts-stretch-slim
RUN npm install @angular/cli
WORKDIR /app
EXPOSE 4200
ADD ./package.json .
RUN npm install
ADD . .
CMD npm start