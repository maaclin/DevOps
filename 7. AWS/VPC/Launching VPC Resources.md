<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Launching VPC Resources

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-networks-ec2)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## Launching VPC Resources

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-ec2_8ee57662)

---

## Introducing Today's Project!

### What is Amazon VPC?

VPC is a service in AWS that lets you create a logically isolated virtual network in the cloud where you can launch AWS resources, like EC2 instances, in a controlled environment.

### How I used Amazon VPC in this project

We set up our very own VPC with private and public resources, explored the resource map and used the VPC and more function to streamline creating the process. 

### One thing I didn't expect in this project was...

I was thinking when creating the connections between the VPC and subnet, security group ect, it would be helpful if AWS had an offering where you could see this visually. Low and behold - resource maps. 

### This project took me...

This project took me around an hour whilst creating documentation. 

---

## Setting Up Direct VM Access

Directly accessing a virtual machine in our task means using SSH (Secure Shell) for Linux instances: Using a command like ssh -i <your-key.pem> ec2-user@<public-ip> to log into the instance’s command line.

### SSH is a key method for directly accessing a VM

SSH traffic means Secure Shell traffic. SSH, or Secure Shell, is the protocol used for secure access to a remote machine. All traffic is encrypted and the public and private keys must match ensuring only authorized users can access the instance.

### To enable direct access, I set up key pairs

Key pairs help engineers directly access their virtual machines like EC2 instances. They are composed of two parts a public key installed on the virtual machine and a private key which is downloaded and remains with the user. 

A private key's file format means how the key is stored and encoded on the local machine. My private key's file format was was .pem, which is a commonly used format for cryptographic keys.

---

## Launching a public server

I had to change my EC2 instance's networking settings by attaching it to the public VPC and subnet I created earlier and attaching the security group I am using for public resources. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-ec2_88727bef)

---

## Launching a private server

My private server has its own dedicated security group because instead of allowing traffic from anywhere I will configure it to only allow traffic from internal resources. 

My private server's security group's source is the public security group. This means only resources within the NextWork Public Security Group can communicate with my private server.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-ec2_4a9e8014)

---

## Speeding up VPC creation

I used an alternative way to set up an Amazon VPC. This time, I used VPC and more which allowed me to select all the settings simultaneously using one interface which is easier to use. 

A VPC resource map is is great as it highlights relationships between each connection. 

My new VPC has a CIDR block of 10.0.0.0/24. It is possible for my new VPC to have the same IPv4 CIDR block as my existing VPC because they are isolated from each other by default, unless connected there will be no conflicts. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-ec2_1cbb1b88)

---

## Speeding up VPC creation

### Tips for using the VPC resource map

When determining the number of public subnets in my VPC, I only had two options 0 or 2. This was because it follows AWS best practice ensuring redundancy across two avaliability zones. 

The set up page also offered to create NAT gateways, which are  essential because instances in private subnets using a NAT gateway do not need public IP addresses, enhancing security by keeping the instances' private IPs hidden.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-ec2_8ee57662)

---

---
