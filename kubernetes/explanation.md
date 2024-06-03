# Kubernetes Deployment

we deploy the YOLO web application on google Kubernetes cluster.

## Breakdown of Deployment Steps

1. **Namespace Creation**: We start by creating a Kubernetes Namespace named "moringa-containerization" to isolate the resources of our application from other applications running in the cluster. This helps in organizing and managing resources effectively.

2. **Persistent Volume and Persistent Volume Claim for MongoDB**: Next, we define PersistentVolume (PV) and PersistentVolumeClaim (PVC) resources for MongoDB to provide persistent storage. This ensures that MongoDB data persists even if the pod is restarted or rescheduled.

3. **StatefulSet for MongoDB**: We then create a StatefulSet resource for MongoDB to manage the deployment and scaling of MongoDB pods. StatefulSet ensures stable and unique network identifiers for MongoDB pods, making it suitable for stateful applications like databases, with unique identities and persistent storage.

4. **Backend Deployment**: Then, we define Deployment resources for the backend application. Deployments manage the lifecycle of application pods, ensuring that the desired number of replicas are running and handling updates and rollbacks gracefully, specifying the container image, environment variables, and port configurations.

5. **Client Deployment**: Then, we define Deployment resources for the frontend / client application, specifying the container image, environment variables, and port configurations.

6. **Services to Expose the Pods**: We finally create Service resources for the backend and client to expose the application pods internally within the cluster. Services enable communication between different parts of the application and allow external access if configured with appropriate types.

## Explanation of Kubernetes Manifests files

# Deployments

- **/deployments/backend-deployment.yaml**: Defines a Deployment resource for the backend application. It specifies the number of replicas, the container image to use, environment variables, and port configurations.

- **/deployments/client-deployment.yaml**: Defines a Deployment resource for the frontend / client application. It specifies the number of replicas, the container image to use, environment variables, and port configurations.

## Services

- **/services/backend-service.yaml**: Defines a Service resource to expose the backend application internally within the cluster. It uses a LoadBalancer type service to provide internal access.

- **/services/client-service.yaml**: Defines a Service resource to expose the client application internally within the cluster. Again, it uses a LoadBalancer type service to provide external access.

## Persistent Volume

- **mongo-persistent-volume.yaml** and **mongo-persistent-volume-claim.yaml**: Define PersistentVolume and PersistentVolumeClaim resources for MongoDB to ensure persistent storage.

## StatefulSet

- **mongo-statefulset.yaml**: Defines a StatefulSet resource for MongoDB to manage the deployment and scaling of MongoDB pods. It includes volumeClaimTemplates to ensure persistent storage for each MongoDB pod.

## Accessing the Application

### Frontend Client

The client application is hosted on: [http://34.73.250.153/](http://34.73.250.153/) .
