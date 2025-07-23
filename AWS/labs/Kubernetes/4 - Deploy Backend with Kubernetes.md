<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Deploy Backend with Kubernetes

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-compute-eks4)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## Deploy Backend with Kubernetes

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eks4_6cfb382f2)

---

## Introducing Today's Project!

In this project, I will set up the backend of an app for deployment and install kubectl then we will deploy the backend on a Kubernetes cluster.

### Tools and concepts

I used Kubernetes, ECR, kubectl to deploy the backend application using manifests. I used EKS and Kubernetes to manage and scale the application, ECR to store and manage our Docker container images and used kubectl to deploy the application by applying our manifests.   

### Project reflection

This project took me approximately an hour and half whilst writing documentation.

---

## Project Set Up

### Kubernetes cluster

To set up today's project, I launched a Kubernetes cluster. The cluster's role in this deployment is to orchestrate and manage the containerized backend application.

### Backend code

I retrieved backend code by cloning our Github repository. Pulling code is essential to this deployment because the repository contains the brain of the application where users requests will be processed and data is managed. 

### Container image

Once I cloned the backend code, I built a container image because we want to package our code with its counterparts to ensure the deployment is repeatable across all platforms. Without an image, it would be difficult for Kubernetes to deploy the application consistently across different environments.

I also pushed the container image to a container registry, which is Amazon ECR. ECR facilitates scaling for my deployment because my cluster can now pull the latest image in my repository on demand and ensures deployments stay consistent across all nodes. If we didnt use ECR , we would have to manually preload and update each node manually with every container change. 

---

## Manifest files

Kubernetes manifests are sets of instructions on how our application is run. Manifests are helpful because they configure our containers each time we deploy, reducing the risk of human error when deploying. This makes deployment simpler and consistent. 

A Deployment manifest manages details like the number of copies of your code that Kubernetes should run across your cluster, and which settings to apply (e.g. CPU limits, container image, or network settings). The container image URL in my Deployment manifest tells Kubernetes to pull the container from ECR. 

A Service resource in Kubernetes exposes your application, making it accessible from within or outside the cluster. My Service manifest configures the following: The name of the service as nextwork-flask-backend. It selects pods with the label app: nextwork-flask-backend to route traffic to. The type is set to NodePort, which exposes the service on each node's IP at a static port. The service listens on port 8080 to receive traffic. Traffic is then forwarded to the targetPort 8080 on the selected pods using the TCP protocol. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eks4_b01876554)

---

## Backend Deployment!

To deploy my backend application, I downloaded kubectl on the command line, used sudo to give me permissions to use kubectl and verified my install. Now, I can use kubectl apply to apply my deployment and service mainfest files. 

### kubectl

kubectl is a command line tool for interacting with Kubernetes resources. I need this tool to deploy our application and manage resources within the cluster. I can't use eksctl for the job as it is used for setting up and deleting EKS clusters and configuring its settings. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eks4_6cfb382f2)

---

## Verifying Deployment

My extension for this project is to use the EKS console to verify the deployment's progress. I had to set up IAM access policies because AWS permissions don’t automatically carry over to Kubernetes. I set up access by using the eksctl create iamidentitymapping command to grant my IAM user access to the Kubernetes cluster.

Once I gained access into my cluster's nodes, I discovered pods running inside each node. Pods represent a set of running containers in our cluster. Containers in a pod share the same network space and storage so they can communicate and share data more efficently. 

The EKS console shows you the events for each pod, where I could see started container nextwork-flask-backend. This validated that our backend as we can see a container, built from the container image our pod pulled, is now deployed and running at an internal IP address inside the cluster.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eks4_3b391f873)

---

---
