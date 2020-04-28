FROM node:alpine AS builder
#start build step
WORKDIR '/app'

COPY package.json .


RUN npm install

COPY . .

RUN npm run build

#end build step /app/build working dir

#start prod step
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
#stop prod step