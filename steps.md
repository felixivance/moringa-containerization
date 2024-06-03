## GKE Deployment

Steps to hosting the application to GKE

1. Create a new project in Google Cloud Platform
2. Enable the Kubernetes Engine API
3. Setting default compute region

```bash
    gcloud config set compute/region us-central1
```

4. Setting default compute zone

```bash
    gcloud config set compute/zone us-central1-a
```

5. Create a new Kubernetes cluster

```bash
    gcloud container clusters create moringa-yolomy-cluster --zone us-east1-d
```

6. Authenticate the cluster

```bash
    gcloud container clusters get-credentials moringa-yolomy-cluster --zone us-east1-d
```
