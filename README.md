# Introduction
Docker is container runs as a guest operating system. It is pretty similar like
VM but vm does not share their resources with other vm. On the other hand container
share their resources with other container on same host machine.

# How to run your node app to docker
First build a node app with express generator like below:
##### create a directory
```
mkdir docker-node-test
```

##### Go the project directory
```
cd docker-node-test
```

##### Install express generator globally
```
npm install -g express-generator
```

##### Create your express app
```
express -f
```
##### create a docker file
```
touch Dockerfile
```

Now update your docker file based on your requirements. Here is mine
```
FROM node:7
WORKDIR /app
COPY package.json /app
COPY . /app
RUN npm install
CMD ["npm", "start"]
EXPOSE 4000
```

Here is the explanations of the above code base
```
FROM node:7
-- You are telling to docker to get node 7 to build your project from wherever
docker knows where to get it.
```
```
WORKDIR /app
-- Create a directory inside of the container called "app"
```
```
COPY package.json /app
-- copy your local package.json to the containers app directory
```
```
COPY . /app
-- Copy your whole applications to the app folder/direcoty of the container
```
```
RUN npm install
-- Run npm install to fetch all the project dependency
```
```
CMD ["npm", "start"]
-- Start your node application.
```
```
EXPOSE 4000
-- You are exposing the application port to outside of the container
```

# Build your application container
```
docker build -t your-tag-for-the-applications .
```
-t is used to tag the app

# Run your application container
```
docker run -p your-host-machine-port:your-exposed-port-from-docker YourAppName
```
# Inspect your app
```
docker ps yourappname
```

# Sharing docker image
First Singup an account at hub.docker.com

Now build the app again for your docker account
```
docker build -t [your-docker-hub-username]/yourProjectName
```
Now login to your docker hub account:
```
docker login
```
Enter your user name and password

Now push your code to docker hub.
```
docker push [your-dockerhub-username]/yourProjectName
```
Now you can run your docker image on any server or PC with docker installed

##### Get the image from docker hub
```
docker pull
```
##### Run the image
```
docker run [your-dockerhub-username]/yourProjectName
```
### Removing all the container and Images
#### List all containers (only IDs)
```docker ps -aq
```
#### Stop all running containers
```
docker stop $(docker ps -aq)
```
#### Remove all containers
```
docker rm $(docker ps -aq)
```
#### Remove all images
```
docker rmi $(docker images -q)
```
