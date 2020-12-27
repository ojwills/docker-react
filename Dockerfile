#Build phase
FROM node:alpine
WORKDIR '/app'
COPY package.json . 
RUN npm install 
COPY . .
RUN npm run build 
#Run phase
FROM nginx
#required by elastic beanstalk
EXPOSE 80 
COPY --from=0 /app/build /usr/share/nginx/html
#default nginx startup command is run