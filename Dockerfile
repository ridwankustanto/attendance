# build stage
FROM node:19.3.0-alpine3.17 as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY --from=build-stage /app/nginx.conf /etc/nginx/conf.d/nginx.conf
COPY --from=build-stage /app/.env /etc/nginx/conf.d/.env
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]