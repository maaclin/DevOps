<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Creating a Private Subnet

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-networks-private)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## Creating a Private Subnet

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-private_afe1fdbd)

---

## Introducing Today's Project!

### What is Amazon VPC?

Amazon VPC lets you provision a logically isolated section of the AWS Cloud where you can launch AWS resources in a virtual network that you define. It is useful as you can control, secure and customize your own isolated part of the cloud. 

### How I used Amazon VPC in this project

In this task, we created our own VPC, route tables, ACLs, created a public and private subnet and set up the security groups for our resources. 

### One thing I didn't expect in this project was...

This was my first time setting up the infrastructure surrounding subnets so was fun seeing how everything works practically after studying networking theory. 

### This project took me...

This project took me an hour whilst writing up documentation. 

---

## Private vs Public Subnets

The difference between public and private subnets is that public subnets should allow the flow of traffic between resource and public internet whilst private subnets allow traffic between internal resources. 

Having private subnets are useful because if you have a resource that holds sensitive data that you do not want connected to the public internet e.g database including customer details, you now have a private enclosure for that data. 

My private and public subnets cannot have the same CIDR blocks as the range must be different to ensure traffic is routed correctly and there are no conflicts.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-private_afe1fdbd)

---

## A dedicated route table

By default, my private subnet is associated with the public route table by default. 

I had to set up a new route table because I want to route traffic through the private route table which does not connect to the public internet. 

My private subnet's dedicated route table only has one inbound and one outbound rule that allows traffic from another internal resource.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-private_b4b904b5)

---

## A new network ACL

By default, my private subnet is associated with the default network ACL since I haven't set up an explicit association between our private subnet and another network ACL.

I set up a dedicated network ACL for my private subnet because I will later change the inbound/outbound rules to be strictly for my resources. 

My new network ACL has two simple rules - deny all inbound and outbound traffic. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-private_1ed2cb07)

---

---
