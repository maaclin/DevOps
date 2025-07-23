<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Infrastructure as Code with CloudFormation

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-devops-cloudformation-updated)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-cloudformation-updated_bd8b836b)

---

## Introducing Today's Project!

In this project, I will demonstrate generating a CloudFormation template and then we will watch our template generate new resources in our account!

### Key tools and concepts

Services I used in the project were Cloudformation, CodeDeploy, CodeBuild, CodeArtifact, IAM, EC2 and S3.  I gained practical experience in automating infrastructure deployment, managing resources as code, and troubleshooting common deployment issues.

### Project reflection

This project took me approximately 2 hours whilst writing documentation and trying to figure out countless errors. 

This project is part six of a series of DevOps projects where I'm building a CI/CD pipeline!

---

## Generating a CloudFormation Template

The IaC Generator is that helps writing templates much faster. It works in a three-step process where it scans all resources in our account,  discovers all your resources and generates the code for the resources you want to put in a CloudFormation template. This means you won't have to write code from scratch.

A CloudFormation template is a code file that defines your AWS infrastructure. The template allows you to describe all the AWS resources you need, such as EC2 instances, S3 buckets, and more, in a structured format. CloudFormation then uses this template to provision and manage those resources in your AWS account. 

The resources I couldn’t add to my template were our CodeBuild project and CodeDeploy deployment group because they require further configuration and security permissions that our generator cannot handle. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-cloudformation-updated_0495b046)

---

## Template Testing

Before testing my template, I have to ensure I have deleted all my resources because when the template creates new ones there will be conflicts with the old unless I have removed them all. 

I tested my template by uploading our .yaml file and creating a new stack for a new build. The result of my first test was a failed build as CloudFormation is creating IAM roles and attaching policies to it at the same time which will create an error as there is no delay to allow the role to be created first.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-cloudformation-updated_f56730fd)

---

## DependsOn

To resolve the error, I added DependsOn attribute which will mean the creation of the role will trigger the policy creation. 

The DependsOn line was added to four different IAM parts of my template and now will wait for the role to be created first and for the codeartifact policy now it will wait for the ec2 instance profile to be created first. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-cloudformation-updated_f0df8018)

---

## Circular Dependencies

I gave my CloudFormation template another test! But this time we came across a circular dependency error where our template is stuck in a loop as each part is essentially waiting for the other to be created resulting in an infinite loop. 

To fix this error, I removed the reference to the managedpolicyarns in the configuration as they were creating the dependency error. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-cloudformation-updated_e6fd85ed)

---

## Manual Additions

---

## Success!

I could verify all the deployed resources by visiting the resources pane in our stack. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-cloudformation-updated_bd8b836b)

---

---
