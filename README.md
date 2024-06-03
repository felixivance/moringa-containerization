## Updated: 03 June 2024

# HOW TO SETUP LOCALLY, CONFIGURE CONTAINERS, DEPLOY TO GKE

# Requirements

Make sure that you have the following installed:

- [node](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04)
- npm
- [MongoDB](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/) and start the mongodb service with `sudo service mongod start`

# Clone the repository

```bash
git clone git@github.com:felixivance/moringa-containerization.git
```

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

## GKE Deployment

###

This is a guide on how to deploy the application to Google Kubernetes Engine (GKE)

### Prerequisites

```bash
gcloud init
gcloud auth login
gcloud config set project [YOUR_PROJECT_ID]
```

Steps to hosting the application to GKE

1. Create a new project in Google Cloud Platform
2. Enable the Kubernetes Engine API
3. Setting default compute region

```bash
    gcloud config set compute/region us-east1
```

4. Setting default compute zone

```bash
    gcloud config set compute/zone us-east1-d
```

5. Create a new Kubernetes cluster

```bash
    gcloud container clusters create moringa-yolomy-cluster --zone us-east1-d
```

6. Authenticate the cluster

```bash
    gcloud container clusters get-credentials moringa-yolomy-cluster --zone us-east1-d
```

7. Create a new namespace

```bash
    kubectl create namespace moringa-yolomy-namespace
```

8. set the namespace as the default namespace

```bash
    kubectl config set-context --current --namespace=moringa-yolomy-namespace
```

9. Apply the Kubernetes deployment configuration files

```bash
    kubectl apply -f kubernetes/deployments/
```

10. Apply the kubernetes services files

```bash
    kubectl apply -f kubernetes/services/
```

11. Apply the kubernetes stateful set files

```bash
    kubectl apply -f kubernetes/stateful-sets/
```

12. Apply the persistent volume and persistent volume claim files

```bash
    kubectl apply -f kubernetes/persistent-volumes/
```

13. Access the application

```bash
    kubectl get services
```

- Copy the external IP address of the client service and paste it in your browser

in this case, the client service is exposed on port 80

The client application is hosted on: [http://34.73.250.153/](http://34.73.250.153/)
