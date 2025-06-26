<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Create Kubernetes Manifests

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-compute-eks3)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## Create Kubernetes Manifests

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eks3_b01876555)

---

## Introducing Today's Project!

In this project, I will set up a deployment manifest that tells Kubernetes how to deploy our backend. Then, I will set up a service manifest that tells Kubernetes how to expose our backend to our users.

### Tools and concepts

I used Amazon EKS, eksctl to set up a Kubernetes cluster on AWS. Key concepts include using manifests to define deployments and services.

### Project reflection

This project is part of my DevOps roadmap.

This project took me approximately an hour whilst writing documentation. 

---

## Project Set Up

### Kubernetes cluster

To set up today's project, I launched a Kubernetes cluster. Steps I took to do this included creating an instance, updating permissions, downloading eksctl and creating our cluster using eksctl create cluster.

### Backend code

I retrieved the backend that I plan to deploy by cloning the nextwork repository on Github. The backend includes everything we need for our application, including files like app.py, Dockerfile, and requirements.txt.

### Container image

Once I cloned the backend code, I built a container image because we need an image to pull to use Kubernetes. I did this buy installing docker, adding us to the dockergroup and then used docker build -t nextwork-flask-backend . to build our image. 


I also pushed the container image to a container registry, so Kubernetes can pull our latest image in our repository on demand. To push the image to ECR, I followed the simple instructions on the ECR page on the console and used the commands prompted to me to push the image. 

---

## Manifest files

Kubernetes manifests are a set of instructions that tells Kubernetes how to run your app. Manifests are helpful as we can list which containers to run, how many copies to create and how much memory to allocate.

A Kubernetes deployment manages details like the how many copies of your app should run across your cluster, and which settings to apply (e.g. CPU limits, container image, or network settings).The container image URL in my Deployment manifest tells Kubernetes the name of the container, the container image to use and port used. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eks3_b01876554)

---

## Service Manifest

A Kubernetes Service exposes your application making it accessible to network traffic. You need a Service manifest to tell Kubernetes to create/update a service using details like which pods to route traffic to, the type of traffic it should handle and which ports should be used. 

In our case, the Service manifest we created sets up a Service that routes external traffic to port 8080 on pods labeled app: nextwork-flask-backend. This allows traffic from outside the cluste to reach our app!

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eks3_b01876555)

---

## Deployment Manifest

Annotating the Deployment manifest helped me understand the configuration of our deployment. I broke down each component and its purpose within the deployment process, further strengthing my knowledge. 

A notable line in the Deployment manifest is the number of replicas, which means the amount of pods created for the application. Pods are relevant to this because you can't deploy containers on their own; they must be inside a Pod.

The mainfests have many moving parts and after repeated use will get easier to navigate. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eks3_6aae73e71)

---

---
