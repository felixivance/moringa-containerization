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

9. Apply the Kubernetes configuration files

```bash
    kubectl apply -f kubernetes/deployments/
```
