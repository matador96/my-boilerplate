FROM node:14 as build

# Backend
WORKDIR /usr/src/app

COPY . .

# WORKDIR /usr/src/app/backend

RUN cd backend && npm install
COPY --from=build /usr/src/app/backend /home/backend

CMD [ "node", "server.js" ]
EXPOSE 3030

# Frontend
RUN cd frontend && npm install && npm run build

# Nginx
FROM nginx
RUN rm /usr/share/nginx/html/*
COPY --from=build /usr/src/app/frontend/build /usr/share/nginx/html
COPY /nginx/default.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
