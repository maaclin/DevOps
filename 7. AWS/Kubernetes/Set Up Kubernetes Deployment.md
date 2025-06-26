<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Set Up Kubernetes Deployment

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-compute-eks2)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## Set Up Kubernetes Deployment

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eks2_45e6c3de5)

---

## Introducing Today's Project!

In this project we will clone an applications backend from GitHub and prepare it for deployment with Kubernetes.

### Tools and concepts

I used Amazon EKS, Git, Docker and Kubernetes to clone a repository, package in a container using Docker, save onto ECR to then be pulled by EKS. We then went into the backend files to get a better understanding on how it all really works. 

### Project reflection

This project took me approximately an hour and half whilst writing up documentation. It was interesting to try grasp an understanding of how the backend truly works. 

Something new that I learnt from this experience was the what made up a Dockerfile and how each files instructions will play out

---

## What I'm deploying

To set up today's project, I launched a Kubernetes cluster. Steps I took to do this included creating an EC2 instance, modifying IAM role to allow instance to interact with other AWS services. Then, i installed eksctl and verfied the version. Last of all, I use eksctl create cluster command to create our cluster. 

### I'm deploying an app's backend

Next, I retrieved the backend that I plan to deploy. An app's backend is where user requests and data are processed, stored and retrieved. I retrieved backend code by installing git; sudo dnf update
sudo dnf install git -y, signing into my github account and cloning the applications repository. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eks2_1ebb86c71)

---

## Building a container image

Once I cloned the backend code, my next step is to build a container image of the backend. This lets Kubernetes set up multiple, identical containers so our application runs consistently across different environments. Docker will create this container following the instructions set in the Dockerfile. 

When I tried to build a Docker image of the backend, I ran into a permissions error because my ec2-user does not have adminstrative access to use Docker.

To solve the permissions error, I used the command sudo usermod -a -G docker ec2-user to add ec2 user to the docker group. The Docker group is a group in Linux systems that gives users the permission to run Docker commands.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eks2_45e6c3de5)

---

## Container Registry

I'm using Amazon ECR in this project to save our container image for Kuberentes to pull the image to deploy our app. ECR is a good choice for the job because it is an Amazon service that will work with EKS seamlessly. 

Container registries like Amazon ECR are great for Kubernetes deployment because can pull whatever is the latest image in your repository on demand, which makes deployments stay consistent across all nodes automatically. If we didn't use ECR, we would have to update each node manually with every change to our container image. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eks2_l2m3n4o5)

---

## EXTRA: Backend Explained

After reviewing the app's backend code, I've learnt that it is a Flask Python application designed to serve as a web API. It handles HTTP requests where it processes a topic provided in the URL. The backend uses the SearchContents class to extract then query the Hacker News Search API for relevant content. These results are then formatted in JSON and sent back to the user.

### Unpacking three key backend files

The requirements.txt file lists all the dependencies for our application to run with the version it was built on. This ensures there are not any conflicts with the build due to updates in plugins. We used;
- Flask, the web framework to build the code. 
- Flaskrest-x, an API to make requests to our backend. 
- Requests library is used to get data from the Hacker News API.
- Werkzeug, helps Flask redirect requests from backend to correct functions in app.py 

The Dockerfile gives Docker instructions on necessary dependencies, copies the application code, and sets up the commands a container needs to run to start our Flask app. Key commands in this Dockerfile include:
- FROM python:3.9-alpine, sets up environment 
- LABEL Author, adds author metadata
- COPY requirements.txt requirements.txt , copies requirements.txt from local machine to container directory
- RUN pip3 intall -r requirements.txt - installs the dependencies listed in the file
- COPY . . copies all files from current directory to into /app directory in the container
- CMD ["python3", "app.py"] command python3 app.py will start our application

The app.py file contains the all the app configuration and routing. The file listens for requests at /contents/<topic>, searches Hacker News for that topic, and returns a tidy list of results in JSON format.

---

---
