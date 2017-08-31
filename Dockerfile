FROM node:7
WORKDIR /app
COPY package.json /app
COPY . /app
RUN npm install
CMD ["npm", "start"]
EXPOSE 4000