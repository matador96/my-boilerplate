FROM node:14 as build

# Backend
WORKDIR /usr/src/app

COPY . .

WORKDIR /usr/src/app/backend
RUN npm install

CMD [ "node", "server.js" ]

EXPOSE 8080

#Frontend
WORKDIR /usr/src/app/frontend
RUN npm install
RUN npm run build

#Nginx
FROM nginx
RUN rm /usr/share/nginx/html/*

WORKDIR /usr/src/app/frontend

COPY /build/* /usr/share/nginx/html/*
COPY /nginx/default.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
