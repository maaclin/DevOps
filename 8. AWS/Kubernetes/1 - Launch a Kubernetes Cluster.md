<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Launch a Kubernetes Cluster

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-compute-eks1)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## Launch a Kubernetes Cluster

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eks1_e5f6g7h8)

---

## Introducing Today's Project!

In this project, I will deploy our first Kubernetes cluster, learning what it does and its real world applications. 



### What is Amazon EKS?

Amazon EKS (Elastic Kubernetes Service) is a managed Kubernetes service that makes it easier to run Kubernetes on AWS without needing to install, operate, and maintain your own Kubernetes control plane.

### One thing I didn't expect

I didn't expect there to be so many moving parts with the creation of the cluster but with time should be mastered. 

### This project took me...

This project took an hour whilst writing up documentation. 

---

## What is Kubernetes?

Kubernetes is a container orchestration platform, ensuring containers are running smoothly across our servers. Companies and developers use Kubernetes to offload the manual checking of containers deployed to focus on application development. 

I used eksctl to create an EKS cluster. The create cluster command I ran defined the configuration for the Kubernetes cluster. 

I initially ran into two errors while using eksctl. The first one was because an error using eksctl as it had not been downloaded yet. The second one was because our instance did not have permissions to create an EKS cluster in our account.

In conclusion, we used eksctl to create an EKS cluster, which simplifies the process of setting up a Kubernetes cluster on AWS.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eks1_ff9bfc221)

---

## eksctl and CloudFormation

CloudFormation helped create my EKS cluster because eksctl uses CloudFormation to create the cluster. It created VPC resources because these resources set up a private, secure network for your containers to connect with each other and the internet while keeping your app private. 

There was also a second CloudFormation stack for our node group, which is a group of EC2 instances that will run our containers. 

A cluster is made up of nodes and the control plane; which decides on the actions of the nodes. Node groups let you manage multiple nodes more easily by grouping them together, so you can control settings like instance type and resource limits for the whole group instead of adjusting each node individually.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eks1_w3e4r5t6)

---

## The EKS console

I had to create an IAM access entry in order to connect my IAM Admin user with Kubernetes’ Role-Based Access Control (RBAC) An access entry is how you link your user to Kubernetes management system in turn allowing you to interact with nodes in the EKS cluster. 

It took around 20 minutes to create my cluster. Since I'll create this cluster again in the next project of this series, maybe this process could be sped up if I use a more powerful instance and automated the creation process with scripts. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eks1_e5f6g7h8)

---

## EXTRA: Deleting nodes

---

---
