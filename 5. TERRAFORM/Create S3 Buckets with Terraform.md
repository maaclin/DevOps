<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Create S3 Buckets with Terraform

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-devops-terraform1)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-terraform1_9i0j1k2l)

---

## Introducing Today's Project!

In this project, I will demonstrate install and configure Terraform and configure our AWS credentials in the terminal.
We will create and manage S3 buckets with Terraform and upload files to S3.

### Tools and concepts

Services I used were Terraform, CLI and S3. The key concept of this task was automating the creation of resources using Terraform.

### Project reflection

This project took me approximately 1 hour whilst writing documentation. Terraform has a steep learning curve when getting to grips with new commands and processes but helps automate and repeat tasks effortlessly. 

This task is the first in my collection of Terraform projects. 

---

## Introducing Terraform

Terraform is a tool that helps you build and manage your cloud infrastructure using code.

Instead of setting up resources manually in the AWS console or CLI, you write a script that tells Terraform exactly what you want in your cloud infrastructure, like servers, databases, and networks.

Terraform is one of the most popular tools used for infrastructure as code (IaC), which is setting up infrastructure through code instead of using the console manually. 

Terraform uses configuration files to define and manage infrastructure. main.tf is a key file in a terraform project as it is the main hub for the blueprint of our resources. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-terraform1_9i0j1k2l)

---

## Configuration files

The configuration is structured in blocks to segment instructions based on which plugin and resource is needed and their associated policies. The advantage of doing this is it makes it easier to read, manage, and adjust things separately without affecting the rest of your infrastructure.

### My main.tf configuration has three blocks

The first block indicates the plugin we are deploying, AWS. The second block provisions the resource we are using which is S3. The third block manages the policies within S3, in our case blocking public access to our bucket. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-terraform1_ljvh9876)

---

## Customizing my S3 Bucket

For my project extension, I visited the official Terraform documentation to read documentation on AWS. The documentation shows us setup instructions, descriptions of each available resource, best practice tips and examples, and parameters for customization. This is basically a manual on how to use terraform for each resource!

I chose to customise my bucket by adding a dev tag so we can easily distinguish our development bucket from production buckets, which is especially useful in larger environments. When I launch my bucket, I can verify my customization by checking for the dev tag. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-terraform1_ffe757cd3)

---

## Terraform commands

Terraform init is the first command you run for a new Terraform project. It sets up your project by downloading necessary plugins, creating a lock file which records which versions are used to ensure consistency across environments and stores a record of our setup. 

Next, I ran 'terraform plan' to create an execution plan, showing what changes will be made based on our config files. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-terraform1_3g4h5i6j)

---

## AWS CLI and Access Keys

When I tried to plan my Terraform configuration, I received an error message that says operation error : getcalleridentity because Terraform does not have the permissions to use our AWS account yet. 

To resolve my error, first I installed AWS CLI, which is the interface for us to manage our AWS services directly from the terminal. In this project, the CLI is used to enable Terraform to create AWS resources from our computer.

I set up AWS access keys to allow Terraform to authenticate with AWS and manage resources on my behalf. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-terraform1_7j8k9l0m)

---

## Lanching the S3 Bucket

I ran 'terraform apply' to push the changes to AWS after checking through the plan and verifying the configuration. Running 'terraform apply' will affect my AWS account by creating the S3 bucket. 

The sequence of running terraform init, plan, and apply is crucial because it methodically ensures in each stage you are verifying your build is correct and risking potentials errors. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-terraform1_1q2w3e4r)

---

## Uploading an S3 Object

I created a new resource block to set up storing an image in our S3 bucket named image.png and telling terraform where to find the file.

We need to run terraform apply again because we need to push the new changes to Terraform as we have changed the configuration file. 

To validate that I've updated my configuration successfully, I checked my bucket and can see the image has successfully downloaded 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-terraform1_9o0p1a2s)

---

---
