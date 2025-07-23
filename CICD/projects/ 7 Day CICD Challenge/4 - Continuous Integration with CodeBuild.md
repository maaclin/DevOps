<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Continuous Integration with CodeBuild

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-devops-codebuild-updated)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codebuild-updated_35588a47)

---

## Introducing Today's Project!

In this part of the projects I will be working with AWS CodeBuild to automate the build process for my web app.

### Key tools and concepts

Services I used were CodeBuild, CodeArtifact, EC2, Github and CodeConnections. Key concepts I learnt include; create and configuring a CodeBuild project from scratch, connecting your CodeBuild project to your GitHub repository using CodeConnections, build process using a buildspec.yml file and automating testing using CodeBuild.

### Project reflection

This project took me approximately 3 hours and was challenging again due to all the new services used. 

This project is part four of a series of DevOps projects where I'm building a CI/CD pipeline for the first time ever. 

---

## Setting up a CodeBuild Project

CodeBuild is a continuous integration service, which constantly check that everything works as expected by running tests and making sure new changes work properly. Engineering teams use it because you don't have to manually set up and manage any build servers yourself, and you only pay for the compute time you use for building your projects.

My CodeBuild project's source configuration means the location and type of repository where my source code and build instructions are stored and defines the provider and any necessary authentication or specific settings, such as the repo URL or branch. I selected this configuration based on where my code resides and how I want CodeBuild to retrieve it for building my project.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codebuild-updated_fewgrhte)

---

## Connecting CodeBuild with GitHub

There are multiple credential types for GitHub each with there own pros and cons. I used GitHub App because it is generally the simplest and most secure option. AWS manages the application and connection, reducing the need for you to handle tokens or keys directly.

CodeConnections helped us connect with GitHub using the secure bridge between AWS and your external code repositories.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codebuild-updated_a7c98e2d)

---

## CodeBuild Configurations

### Environment

My CodeBuild project's environment configuration is the setup of where my build executes, including the operating system, runtime and tools available during the build process. It includes settings like the provisioning model; such as on-demand; small, medium instances ect. I configured it this way to ensure compatibility with my project’s dependencies and to optimize build performance based on my workload needs.

### Artifacts

Build artifacts are the tangible outputs of your build process. They're what you'll actually deploy to your servers or distribute to users. My build process will create a build artifact that packages up everything a server could need to host our web app in one neat bundle. This bundle is called a WAR file and is stored in a S3 bucket. 

### Packaging

When setting up CodeBuild, package artifacts are stored in a WAR file similar to a ZIP file which will help with package management as files are all organised neatly and compressed. 

### Monitoring

For monitoring, I enabled CloudWatch Logs, which allows us to see all errors in detail recorded for troubleshooting. 

---

## buildspec.yml

My first build failed because I had not created my buildspec.yml in source code Github repo yet. A buildspec.yml file is needed because as this is what will automate the process. 

The first two phases in my buildspec.yml file installs Java and grants access to CodeArtifact. The third phase in my buildspec.yml file compiles the web app. The fourth phase in my buildspec.yml file will package it into a WAR file. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codebuild-updated_35588a47)

---

## Success!

My second build also failed, but with a different error due to incorrect IAM roles connected to CodeArtifact. I will fix the role to  now include the correct permissions. 

To resolve the second error, I connected my policy to my role to grant permissions. When I built my project again, I saw that my build now started successfully. 

To verify the build, I checked my S3 bucket to see if it the file had been successfully created. Seeing the artifact tells me that the build process was successful as I can see the expected output. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codebuild-updated_d9cc6191)

---

## Automating Testing

In a project extension, I'm practicing using tests to automatically run with every code change. This will catch bugs earlier, when they're cheaper to fix and ensure confidence in deployments. I added a simple test script that checks if there is a src folder and index.jsp file in my directory. 

To add the test script to the build process, I updated the buildspec file to include my new test script and then pushed the changes to Github. 

After pushing my code to GitHub, I successfully ran my build and could see in the CloudWatch logs the test ran and was successful. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codebuild-updated_sm-test-script-upload)

---

---
