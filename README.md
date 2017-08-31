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