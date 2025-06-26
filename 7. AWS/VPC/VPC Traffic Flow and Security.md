<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# VPC Traffic Flow and Security

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-networks-security)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## VPC Traffic Flow and Security

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-security_92b0b0b4)

---

## Introducing Today's Project!

### What is Amazon VPC?

Amazon VPC is a service that lets you create a logically isolated virtual network in the AWS cloud, allowing you to control your network environment, including IP addresses, subnets, and routing, which is useful for enhancing security and managing resources efficiently.

### How I used Amazon VPC in this project

We set up our very own VPC with route tables, security groups and network ACLs.

### One thing I didn't expect in this project was...

I had covered networking fundementals initally so I had the basics covered but had fun consildating my knowledge. 

### This project took me...

This project took approximately 45 mins. 

---

## Route tables

A route table is a table of rules, called routes, that decide where the data in your network should go.

Routes tables are needed to make a subnet public because subnets need to be linked to a route table because the table tells the data where to travel, in this case the public internet. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-security_0a07b191)

---

## Route destination and target

Routes are defined by their destination and target, which means the destination IP address range and target is the route it will take to send the data for instance - igw-x: traffic is routed to the internet via the Internet Gateway and local: traffic stays within the VPC, allowing internal communication between resources.

The route in my route table that directed internet-bound traffic to my internet gateway had a destination of 0.0.0.0 and a target of igw-0424... 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-security_0a07b191)

---

## Security groups

Security groups allow you to federate access to resources. 

### Inbound vs Outbound rules

Inbound rules control the data that enter your resource. I  configured an inbound rule that allowed any IP address to access my resource can be risky, exposing your server to potential threats from any location

Outbound rules are the inverse of inbound rules manage how the server interacts with the internet. By default, my security group's outbound rule also allows any IP address 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-security_92b0b0b4)

---

## Network ACLs

Network ACLs are responsible for inspecting and managing these data packets as they enter and exit your VPC's subnets, making sure only authorized data moves in and out.

### Security groups vs. network ACLs

Security groups allow you to control inbound and outbound traffic at the instance level, while network ACLs offer similar capabilities at the VPC subnet level.

---

## Default vs Custom Network ACLs

### Similar to security groups, network ACLs use inbound and outbound rules

An ACL allows all inbound and outbound traffic in a VPC. This means that any traffic, regardless of source or destination is permitted.

In contrast, a custom ACL’s inbound and outbound rules are automatically set to deny all traffic until it has been configured otherwise. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-security_4faeb056)

---

## Tracking VPC Resources

---

---
