<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Deploy an App Across Accounts

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-compute-ecr)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-ecr_3e91948719)

---

## Introducing Today's Project!

This is a multiplayer project working with another engineer to create a cross account deployment of a web application. 

### What is Amazon ECR?

Amazon ECR (Elastic Container Registry) is a fully managed container registry that makes it easy to store, manage, and deploy container images. In this project, I used Amazon ECR to store the Docker image that I built, which allowed my project buddy to pull and deploy it.

### One thing I didn't expect...

This project goes to prove how important communication amongst engineers is pivotal for any attempt of having a working application. 

### This project took me...

This project took me and my partner an hour whilst writing up documentation. 

---

## Creating a Docker Image

First, we set up our Dockerfile which is a set of instructions given to create an image, which will be used to create a container with our web app. Then, we created an index.html page to display our message to our partner. 

To create our Dockerfile we populated it with two sets of instructions where we have stated FROM nginx:latest - which means we want our image based on the latest nginx image published on the Docker registry. We also want to COPY index.html /usr/share/nginx/html/ - which will allow us to serve our custom web app through the nginx server.

### I also set up an ECR repository

ECR stands for Elastic Container Registry and is a fully managed container registry that makes it easy for you to store, manage, and deploy your container images. It is important as it allows us to share our images with our team members. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-ecr_e7f8g9h0)

---

## Set Up AWS CLI Access

### AWS CLI can let me run ECR commands

The CLI asked for my credentials because even though I am logged into the management console, the CLI is seperate and needs an additional authentication method and using an access key is one of the fastest ways of doing it. 

To enable CLI access, I set up a new IAM user with the permission full access for ECR only to follow the rule of least privilege. I also set up an access key for this user, which means I can authenticate through the CLI.

To pass my credentials to the AWS CLI, I ran the command aws configure and had to provide my access ID, key, region and default output.  

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-ecr_4aa3e4fe6)

---

## Pushing My Image to ECR

Push commands are the commands used to authenticate and push an image to our repository. 

### There are three main push commands

To authenticate Docker with my ECR repo, I used the command aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin x.dkr.ecr.eu-west-2.amazonaws.com. This will retrieve an authentication token and authenticate our Docker client to our registry.

To push my container image, I ran the command docker push x.dkr.ecr.eu-west-2.amazonaws.com/nextwork/cross-account-docker-app:latest.  Pushing is the action of uploading our image to our registry. 

When I built my image, I tagged it with the label latest. This is is a commonly used tag to represent the most recent version. This allows everyone that uses the image to know this is the most up to date iteration of the image. 

---

## Resolving Permission Issues

When I tried pulling my project buddy's container image for the first time, I saw the error 403 Forbidden. This was because repositories on ECR are private by default, we have not shared access with each other yet. 

To resolve each other's permission errors, my buddy and I edited the policy JSON to include my partners user ARN and permissions to pull the image from my repository. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-ecr_74b90da414)

---

## Deploying the App

We created an Elastic Beanstalk application and configured it to deploy our project buddy's Docker image by zipping and uploading the json file and chose the configuration options for our application.

While setting up for deployment, I created a new role for. The role has the permission to ECR. I also gave Elastic Beanstalk access to ECR too by attaching our ECR policy to our Beanstalk role. 

The Dockerrun.aws.json file is an Elastic Beanstalk specific file designed to be simple and focuses only on the deployment of our app.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-ecr_70ed85fa3)

---

## Resolving Deployment Issues

When I visited by environment's domain, I initially saw an error. This was because my partner's ECR repository allows access for my ECR-Access IAM user, but Elastic Beanstalk and EC2 instances aren't using the ECR-Access role to deploy our app.

To fix the permissions error, we changed the ARN on the permission policy so now finally Elastic Beanstalk could have sufficent permissions. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-ecr_74b90da411)

---

---
