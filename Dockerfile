#builder phrase to install dependencies
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#/app/build will have the builded files

#run phrase using nginx a image container to just direct flow to static web page dont need to run nginx as it is started
#up automatically
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

