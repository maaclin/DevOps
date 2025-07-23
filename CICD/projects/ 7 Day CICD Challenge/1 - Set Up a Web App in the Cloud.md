<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Set Up a Web App in the Cloud

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-devops-vscode)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## Set Up a Web App Using AWS and VS Code

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-vscode_7a1de541)

---

## Introducing Today's Project!

Today, I will learn the basics of building a web app using AWS and VS Code. This will lay the foundation this challenge and will allow me to explore setting up a remote SSH connection for the first time. 

### Key tools and concepts

Services I used were Amazon EC2 and VS Code. Key concepts I learnt include SSH connection, using IDEs, editing an index.json file and using key pairs. 

### Project reflection

I enjoyed comparing an IDE with the terminal to navigate through folders and to try edit a file. However, I think IDE was a clear winner because of the ease of access. 

This project took me a little over 2 hours following the live tutorial. I found it challenging as it was my first attempt using VS Code and SSH into my instance but I learnt alot and will try next to replicate it with my own site data. 

This project is part one of a series of DevOps projects where I'm building a CI/CD pipeline!

---

## Launching an EC2 instance

We need to launch an EC2 instance to host the web application on the cloud. 

### I also enabled SSH

Secure Shell is a protocol used to make sure only authorized users can access a remote server. SSH verifies you have the correct private key that matches the public key on the server.

SSH is also a type of network traffic. Once authorized, it'll set up a secure encrypted connection between you and EC2.

### Key pairs

A key pair lets you securely access your EC2 instance.
It's made of two halves: a public key that AWS keeps, and a private key that you download.

Once I set up my key pair, AWS automatically downloaded my keys in a .pem file which i stored safely in my DevOps folder. 

---

## Set up VS Code

VS Code is a Microsoft tool used to write, test, and deploy code efficiently and I will be integrating it with AWS-specific extensions.

I installed VS Code to edit and navigate within the code of my web application. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-vscode_53d05e68)

---

## My first terminal commands

Terminal is where you send instructions for your computer to complete tasks. like sending text messages to your computer's operating system to tell it what to do. The first command I ran was cd ~/Desktop/IT/DevOps. cd ~/ is a linux command used to locate folders on your PC. 


I also updated my private key's permissions by running chmod 400 nextwork-keypair.pem. Using '400' makes it readable only by you (the owner) and restricts access for everyone else.


![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-vscode_9328ada1)

---

## SSH connection to EC2 instance

To connect to my EC2 instance, I ran the command, ssh -i [PATH TO YOUR .PEM FILE] ec2-user@[YOUR PUBLIC IPV4 DNS]. This resulted in me connecting to my instance and the bird icon emerging. You must ensure you get the path correct or you will keep returning no such file or directory error shown in screenshot.  

### This command required an IPv4 address

A Public IPv4 DNS is the public address for your EC2 server that the internet uses to find and connect to it.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-vscode_e3069dca)

---

## Maven & Java

Apache Maven is a tool that helps developers build and organize Java software projects. It's also a package manager, which means it automatically download any external pieces of code your project depends on.

We'll use Maven later on to help us set up all the necessary web files to create a web app structure.







Java is a popular programming language used to build different types of applications, from mobile apps to large enterprise systems.

Maven, which we just downloaded, is a tool that needs Java to operate. So if we don't install Java, we won't be able to use Maven.

---

## Create the Application

I generated a Java web app using the command - 
{ mvn archetype:generate \
   -DgroupId=com.nextwork.app \
   -DartifactId=nextwork-web-project \
   -DarchetypeArtifactId=maven-archetype-webapp \ DinteractiveMode=false }

1) mvn archetype:generate command specifically tells Maven to create a new project from a template.

2) DartifactId... - names your project

3) DarchetypeArtifactId... - specificies your creating a web app

3)DinteractiveMode=false... - automates installation

I installed Remote SSH so we can now connect VS Code to our EC2 instance. This is different from connecting our terminal to VS Code. 

Configuration details required to set up a remote connection include host, hostname, identity file and user.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-vscode_2939cf01)

---

## Create the Application

Using VS Code's file explorer, I could see the entire contents of my web application easily and can navigate through. 

Two of the project folders created by Maven are src and webapp. Src is the parent folder of all the source code of the web app and webapp contains all the visual elements. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-vscode_45f91fd7)

---

## Using Remote - SSH

index.jsp is a file used in Java web apps. It's similar to an HTML file because it contains markup to display web pages. It can also include Java code, which lets it generate dynamic content.

This means content can change depending on things like user input or data from a database. Social media apps are great examples of web apps because the content you see is always changing, updating and personalised to you. HTML files are static and can’t include Java code. 

That's why it's so important to install Java in your EC2 instance - so you can run the Java code in your web app!

I edited index.jsp by changing Hello World to Hello Yossief and added 'This is my NextWork web application working!'. This was simple to do with my previous knowledge of basic html. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-vscode_7a1de541)

---

## Using nano

An alternative to using IDEs is in within the terminal itself. To edit index.jsp, I navigated to the file using cd, until i reached index.jsp and used nano to edit the file. 

Compared to using an IDE this was much more work and prone to confusion for a beginner as myself and brought unnecessary workload to a simple task that could be completed using an IDE.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-vscode_a3324ad41)

---

---
