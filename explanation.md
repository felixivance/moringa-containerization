# Choice of the base image on which to build each container.

# Frontend Container

The frontend container is built on the `node:16-alpine` image. This is because the frontend is a React application and React applications are built using Node.js. The `node:16-alpine` image is the latest LTS version of Node.js at the time of writing this document.

# Backend Container

The backend container is built on the `node:14-alpine` image. This is because the backend is a Node.js application and Node.js applications are built using Node.js. The `node:14-alpine` image is the latest LTS version of Node.js at the time of writing this document.

Dockerfile directives used in the creation and running of each container.

# Frontend Container

The following Dockerfile directives are used in the creation and running of the frontend container:

## Stage 1: Build the application

`FROM node:16-alpine as build`

## Set the working directory inside the container

`WORKDIR /app/client`

## Copy package.json and package-lock.json

`COPY ./package*.json ./`

## Install all dependencies including devDependencies

`RUN npm install`

## Copy the rest of the application code

`COPY ./ .`

## Build the application

`RUN npm run build`

## Stage 2: Create the production image

`FROM node:16-alpine`

## Set the working directory inside the container

`WORKDIR /app/client`

## install the serve to run the app

`RUN npm install -g serve`

## Copy the build artifacts from the previous stage

`COPY --from=build /app/client/build ./build`
`COPY --from=build /app/client/package.json /app/client/package-lock.json ./`

## Expose port 3000

`EXPOSE 3000`

## Command to run the React app

`CMD ["serve", "-s", "build"]`

# Backend Container

## Use official Node.js image as the base image

`FROM node:14-alpine`

## Set the working directory inside the container

`WORKDIR /app/backend`

## Copy package.json and package-lock.json

`COPY ./package\*.json ./`

## Install dependencies

`RUN npm install`

## Copy the rest of the application code

`COPY ./ .`

## Start the application

`CMD ["npm", "start"]`

Docker-compose Networking (Application port allocation and a bridge network implementation) where necessary.

# Frontend Container

The frontend container is exposed on port 3000. This is done in the Dockerfile using the `EXPOSE 3000` directive. In the `docker-compose.yml` file, the frontend service is mapped to port 3000 on the host machine.

# Backend Container

The backend container is exposed on port 8000. This is done in the Dockerfile using the `EXPOSE 8000` directive. In the `docker-compose.yml` file, the backend service is mapped to port 8000 on the host machine.

# Bridge Network Implementation

The frontend and backend containers are connected to a bridge network called `moringa-yolomy-network`. This is done in the `docker-compose.yml` file using the `networks` directive.

Docker-compose volume definition and usage (where necessary).

# Frontend Container

The frontend container does not require a volume definition as it serves static files and does not need to persist data.

# Backend Container

The backend container does not require a volume definition to persist data. However, if the backend application writes data to the file system, a volume can be defined in the `docker-compose.yml` file to persist the data, eg Log files.

Git workflow used to achieve the task.

The Git workflow used to achieve the task is the feature branch workflow. In this workflow, each feature or task is developed on a separate branch. Once the feature is complete, a pull request is created to merge the feature branch into the main branch. Code reviews are done on the pull request, and once approved, the feature branch is merged into the main branch.

Successful running of the applications and if not, debugging measures applied.

The applications were successfully run using the `docker-compose up` command. If the applications did not run successfully, the following debugging measures would be applied:

1. Check the Docker logs for any error messages
2. Check the Docker containers for any issues
3. Check the Docker images for any issues
4. Check the Docker network for any issues
5. Check the Docker volumes for any issues
6. Check the Docker-compose file for any issues

Good practices such as Docker image tag naming standards for ease of identification of images and containers.

The following good practices can be used for Docker image tag naming standards:

1. Use semantic versioning for tags (e.g., `v1.0.0`, `v1.0.1`, `v1.1.0`)
2. Use the latest tag for the latest version of the image (e.g., `latest`)
3. Use the commit hash as a tag for images built from a specific commit (e.g., `commit-abc123`)
4. Use the branch name as a tag for images built from a specific branch (e.g., `feature-branch`)
5. Use the date and time as a tag for images built at a specific date and time (e.g., `2022-01-01-12-00-00`)

There is a screenshot of your deployed image on DockerHub, clearly showing the version of the image

![DockerHub Image](https://raw.githubusercontent.com/felixivance/moringa-containerization/master/screenshots/dockerhub.png)

There is a screenshot of your running containers on your local machine

![Running Containers](https://raw.githubusercontent.com/felixivance/moringa-containerization/master/screenshots/local-images.png)

Update Mon 3rd June 2024

# building image with Mac M1/Apple Silicon Chip

you have to specify the platform

docker build --platform linux/amd64 -t felixivance/moringa-yolomy-client:v1.0.2 .
