<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Access S3 from a VPC

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-networks-s3)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## Access S3 from a VPC

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-s3_3e1e79a2)

---

## Introducing Today's Project!

### What is Amazon VPC?

Amazon VPC enables you to launch AWS resources into an isolated virtual network that you've defined. 

### How I used Amazon VPC in this project

Today, we used VPCs to create a private network for launching an EC2 instance and to connect to S3. We viewed the contents of our buckets securely from a private network environment. 

### One thing I didn't expect in this project was...

I thought previously that a user with admin access should have full access over resources. Admin access typically applies to the AWS Management Console, but programmatic interactions require an Access Key ID and Secret Access Key for authentication.

### This project took me...

This project took me approximately an hour whilst writing up documentation.

---

## In the first part of my project...

### Step 1 - Architecture set up

We will create a VPC from scratch and launch an EC2 instance into our VPC.

### Step 2 - Connect to my EC2 instance

Now we will connect the instance to the internet using EC2 instance connect. 

### Step 3 - Set up access keys

Now, we will grant our EC2 instance access to our AWS environment.

---

## Architecture set up

I started my project by launching a VPC with one public subnet and an EC2 instance inside this VPC with a public IPv4 address and security group rule to allow ssh traffic as we plan on using EC2 instance connect later. 

Here I've created the s3 bucket with the unique name and added some images for us to try and locate later.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-s3_4334d777)

---

## Running CLI commands

AWS CLI is a used to control AWS services directly from the command line, i.e., your terminal.

The first command I ran was aws s3 ls. This command is used to list all s3 buckets in my account. The command fails as we have not entered our access key.

The second command I ran was aws configure. This command is used to provide credentials which will allows us to use the CLI. We have been authenticated whilst logging into the console but not yet with the CLI. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-s3_e7fa8776)

---

## Access keys

### Credentials

To set up my EC2 instance to interact with my AWS environment, I configured the access key id, secret access key, region name and output format.

Access keys are credentials for applications and other servers to communicate with AWS services and resources. 

Secret access keys are provided once and pairs with your access key ID. You need both to access services. 

### Best practice

Although I'm using access keys in this project, a best practice alternative is to use typically the recommended way is to create an IAM role with the necessary permissions and then attaching that role to your EC2 instance.

---

## In the second part of my project...

### Step 4 - Set up an S3 bucket

Now, we'll create a bucket in Amazon S3. After creating this bucket, we'll learn how to access it from our EC2 instance and check what objects are in the bucket.

### Step 5 - Connecting to my S3 bucket

Now, we'll connect our S3 bucket to our EC2 instance. 

---

## Connecting to my S3 bucket

The first command I ran was aws s3 ls. This command is used to list all s3 buckets in my account. The command fails as we have not entered our access key.

When I ran the command aws s3 ls again, the terminal responded with alist of all my current buckets. This indicated the connection was successful. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-s3_4334d778)

---

## Connecting to my S3 bucket

Another CLI command I ran was aws s3 ls s3://nextwork-vpc-project-maaclin, which returned the objects inside the bucket. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-s3_4334d779)

---

## Uploading objects to S3

To upload a new file to my bucket, I first ran the command sudo touch /tmp/test.txt. This command created a file name test.txt in the /tmp folder. 

The second command I ran was aws s3 cp /tmp/test.txt s3://nextwork-vpc-project-maaclin. This command will copy the file from /tmp to our s3 bucket. 

The third command I ran was aws s3 ls s3://nextwork-vpc-project-maaclin which validated that the file successfully copied over as I can now see it in my list. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-s3_3e1e79a2)

---

---
