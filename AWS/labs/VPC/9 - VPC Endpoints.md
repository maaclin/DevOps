<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# VPC Endpoints

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-networks-endpoints)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## VPC Endpoints

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-endpoints_09bcaa8a)

---

## Introducing Today's Project!

### What is Amazon VPC?

Amazon VPC enables you to launch AWS resources into an isolated virtual network that you've defined. 

### How I used Amazon VPC in this project

Today, we used VPCs to create an endpoint to connect privately an EC2 instance and S3. We also restricted access to the S3 bucket, allowing only traffic originating from the VPC endpoint.

### One thing I didn't expect in this project was...

I didn't expect whilst configuring the endpoint that it would block our access through the console, proving how robust security with endpoints really can be. 

### This project took me...

This project took me approximately an hour whilst writing up documentation.

---

## In the first part of my project...

### Step 1 - Architecture set up

Here we will create a VPC from scratch and launch an EC2 instance, which I will connect to using EC2 Instance Connect later. We'll also set up a S3 bucket. 

### Step 2 - Connect to EC2 instance

In this step, we're gonna connect to our EC2 instance and try access S3 through the public internet!

### Step 3 - Set up access keys

In this step we will give our EC2 instance access to our AWS environment.

### Step 4 - Interact with S3 bucket

Now, we will try use our EC2 instance to access our S3 bucket.

---

## Architecture set up

I started my project by launching a public subnet within my VPC and booted up an instance inside the subnet. 

I also set up a S3 bucket containing some .png files for us to locate through our instance later. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-endpoints_4334d777)

---

## Access keys

### Credentials

To set up my EC2 instance to interact with my AWS environment, I configured my access key id, secret access key, default region and output format. 

Access keys are are credentials for your applications and other servers to log into AWS and talk to your AWS services/resources.

The secret access key is the password that pairs with your access key ID. You need both to access AWS services.



### Best practice

Although I'm using access keys in this project, a best practice alternative is to create an IAM role with the necessary permissions and then attach that role to your EC2 instance.

---

## Connecting to my S3 bucket

The command I ran was aws s3 ls. This command is used to list our s3 buckets attached to our account. 

The terminal responded with all buckets associated to my account. This indicated that the access keys I set up successfully worked. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-endpoints_4334d778)

---

## Connecting to my S3 bucket

'I also tested the command aws s3 ls s3://nextwork-vpc-endpoints-maaclin which returned the .png files I saved into the bucket earlier. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-endpoints_4334d779)

---

## Uploading objects to S3

To upload a new file to my bucket, I first ran the command sudo touch /tmp/nextwork.txt. This command created a file named nextwork.txt in the /tmp folder. 

The second command I ran was aws s3 cp /tmp/nextwork.txt s3://nextwork-vpc-endpoints-maaclin. This command will copy the file from /tmp to our s3 bucket. 

The third command I ran was aws s3 ls s3://nextwork-vpc-endpoints-maaclin which validated that the file successfully copied over as I can now see it in my list. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-endpoints_3e1e79a2)

---

## In the second part of my project...

### Step 5 - Set up a Gateway

Here we will bring in a VPC endpoint as our instance is connected to our bucket through the public internet.

This isn't the most secure way to communicate - external threats and attacks can easily intercept your commands and get access to your AWS environment or sensitive data.

### Step 6 - Bucket policies

Here we will limit our S3 bucket access to only traffic from our endpoint.

### Step 7 - Update route tables

Now, we wiil test our VPC endpoint set up to see if we have configured it correctly. 

### Step 8 - Validate endpoint conection

To validate our work, I will get our EC2 instance to interact with our S3 bucket one last time.

---

## Setting up a Gateway

I set up an S3 Gateway, which simply adds a route to your VPC route table that directs traffic bound for S3 to head straight for the Gateway instead of the internet.

### What are endpoints?

An endpoint in AWS is a service that allows private connections between your VPC and other AWS services without needing the traffic to go over the internet.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-endpoints_09bcaa8a)

---

## Bucket policies

A bucket policy is a type of IAM policy designed for setting access permissions to an S3 bucket.

My bucket policy will only allow traffic coming from our VPC endpoint to gain access to our S3 bucket!

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-endpoints_7316a13d)

---

## Bucket policies

Right after saving my bucket policy, my S3 bucket page showed 'denied access' warnings. This was because I am on the console and not connecting through the endpoint. 

I also had to update my route table because our route table doesn't have a route that directs traffic bound for S3 to our VPC endpoint. That is why we came across the error earlier as the endpoint had not been added so it was still trying to access through public internet, which we had created a policy to not allow. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-endpoints_4ec7821f)

---

## Route table updates

To update my route table, I navigated to endpoints in the VPC dashboard and modified the route table to include our endpoint connection. 

After updating my public subnet's route table, my terminal could return the contents of my S3 bucket successfully. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-endpoints_d116818e)

---

## Endpoint policies

An endpoint policy allows for granular configuration of access to AWS services. For example, you can write a policy that gives your endpoint read access only to S3 buckets, so the permission to upload objects is denied.

I updated my endpoint's policy by changing the Effect in my policy from Allow to Deny. I could see the effect of this right away, because when running the command to see the contents of my bucket again I had the same error as earlier. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-endpoints_3e1e79a3)

---

---
