<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Deploy an App with Docker

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-compute-eb)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eb_c4df13c84)

---

## Introducing Today's Project!

### What is Docker?

Docker is a tool that helps you create, manage, and deploy containers efficiently. Docker Desktop is a program that makes it easy to work with Docker in a user-friendly way.

### One thing I didn't expect...

The Docker Desktop app makes managing containers easy and less daunting than using the terminal. There is a steep learning curve but once mastered is a crucial tool in CI/CD pipelines. 

### This project took me...

This project took an hour whilst writing up documentation. 

---

## Understanding Containers and Docker

### Containers

Containers are packages that bundle an application with all its dependencies. They are useful because they solve the "it works on my machine" problem by ensuring that an application runs consistently across different environments.

A container image is a template of the configuration of the container. 

### Docker

Docker is a software application that helps us create, manage, and deploy these containers efficiently.

The Docker daemon is the background process that manages containers on our computers. It takes the commands given through the terminal or application and does all the work for us. 

---

## Running an Nginx Image

Nginx is a web server which means it serves web pages to people on the internet. Ngnix is often used as a proxy server which means it can be used to forward requets from the internet to other servers to balance the load or handle more users. 

The command I ran to start a new container was docker run -d -p 80:80 nginx. Docker run starts a new container, we're using ngnix the pre exisiting container image and starting it in detached mode -d to port 80 on the host machine and port 80 in the container. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eb_6245f5bb10)

---

## Creating a Custom Image

A Dockerfile is a document with all the instructions for building your Docker image. Docker would read a Dockerfile to understand how to set up your application's environment and which software packages it should install.

My Dockerfile tells Docker three things - 

- From nginx:latest - image starts as a copy of the latest ngnix image. 
- COPY index.html /usr/share/nginx/html/ - replaces the defailt HTML with our own custom html file 
- EXPOSE 80 means you want the container to receive web traffic through port 80

The command I used to build a custom image with my Dockerfile was docker build -t my-web-app. This names our container image nextwork-flask-backend, and the . tells Docker to find the Dockerfile in the current directory.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eb_4c741d1913)

---

## Running My Custom Image

There was an error when I ran my custom image because there was a conflict as both containers was using port 80. I stopped the previous default container and connected to port 80 and successfully connected. 

In this example, the container image is the blueprint that tells Docker the configuration of our code. The container is the software created from our image and runs the web server displaying our index.html page. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eb_74b5c3d619)

---

## Elastic Beanstalk

AWS Elastic Beanstalk is a service that makes it easy to deploy cloud applications without worrying about the underlying infrastructure.

Deploying my custom image with Elastic Beanstalk took me 5 minutes to start up and successfully displays the new message I updated in my index.html. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eb_26d5573b23)

---

## Deploying App Updates

To learn how to deploy app updates with Elastic Beanstalk, I updated my app by changing the message on my site and adding an image to the file. I verfied those changes by accessing the webpage on my browser and can see the new updated page. 

My app updates didn't show up in my live environment immediately because I had not pushed them to Elastic Beanstalk yet they were still on the local machine. To deploy my changes, I only had to upload and deploy the new zip file. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-eb_5b7034684)

---

---
