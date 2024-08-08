FROM node:16 as builder 

WORKDIR /app

COPY . . 

RUN npm install

RUN npm run build

FROM nginx:stable-alpine3.17

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY --from=builder /app/build .

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
