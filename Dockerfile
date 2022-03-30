FROM node:alpine3.14
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
#RUN npm run build
CMD ["npm", "run","build"]

FROM nginx
EXPOSE 80
COPY --from=0 /app /usr/share/nginx/html
