FROM node:8.15-alpine as builder

WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:latest
EXPOSE 80
COPY --from=builder /usr/app/build /usr/share/nginx/html
