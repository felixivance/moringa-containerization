# HOW TO SETUP LOCALLY

# Requirements

Make sure that you have the following installed:

- [node](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04)
- npm
- [MongoDB](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/) and start the mongodb service with `sudo service mongod start`

## Navigate to the Client Folder

`cd client`

## Run the following command to install the dependencies

`npm install`

## Run the following to start the app

`npm start`

## Open a new terminal and run the same commands in the backend folder

`cd ../backend`

`npm install`

`npm start`

### Go ahead a nd add a product (note that the price field only takes a numeric input)

# Using docker-compose to run the app

- Make sure you have docker and docker-compose installed on your machine

- Run the following command in the root directory of the project

`docker-compose up`

The following will happen:

1. The frontend will be built and the image will be created
2. The backend will be built and the image will be created
3. The images will be used to create containers
4. The containers will be started

- The app should be running on `http://localhost:3000`

- The backend should be running on `http://localhost:8000`
