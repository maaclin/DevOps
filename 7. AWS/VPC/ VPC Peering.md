<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# VPC Peering

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-networks-peering)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## VPC Peering

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-peering_88727bef)

---

## Introducing Today's Project!

### What is Amazon VPC?

A VPC is a service that lets you provision a logically isolated section of the AWS Cloud where you can launch AWS resources in a virtual network that you define. 

### How I used Amazon VPC in this project

We selected our own IP address ranges, created subnets. We configured route tables and network gateways and creating private networks.

### One thing I didn't expect in this project was...

I didn't expect to have the series of errors encountered while trying to establish connectivity. 

### This project took me...

This project took approx 1 hour whilst writing up documentation.

---

## In the first part of my project...

### Step 1 - Set up my VPC

Here we will use the visual VPC resource map to create the two VPCs effortlessly.  

### Step 2 - Create a Peering Connection

Here we will set up a connection link between our VPCs using VPC peering.

### Step 3 - Update Route Tables

Now we are going to update route tables for our VPCs for inbound and outbound traffic. 



### Step 4 - Launch EC2 Instances

Launch an EC2 instance in each VPC, so we can use them to test our VPC peering connection later.

---

## Multi-VPC Architecture

I started my project by launching two VPCs with 1 public subnet each. 

The CIDR blocks for VPCs 1 and 2 are 10.1.0.0/16 and 10.2.0.0/16. These are unique because so the IP addresses of their resources don't overlap. Having overlapping IP addresses could cause routing conflicts and connectivity issues.

### I also launched 2 EC2 instances

I didn't set up key pairs for these EC2 instances as I will be using EC2 instance connect which manages our key pairs. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-peering_11111111)

---

## VPC Peering

A VPC peering connection allows us the transfer of data without going through the public internet between VPCs. 

VPCs would use peering connections to to route traffic between each other using private IP addresses

The difference between a Requester and an Accepter in a peering connection is that the requester must initiate and accepter accept the request for the connection to be met. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-peering_1cbb1b88)

---

## Updating route tables

After accepting a peering connection, my VPCs' route tables need to be updated because I need to add the destination CIDR block for each VPC so that data can be transferred amongst each other. 

My VPCs' new routes have a destination of 10.1.0.0/16 for VPC 2's route table and 10.2.0.0/16 for VPC 1's route table. The routes target was the peering connection.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-peering_4a9e8014)

---

## In the second part of my project...

### Step 5 - Use EC2 Instance Connect

Use EC2 Instance Connect to connect to our EC2 instances.

### Step 6 - Connect to EC2 Instance 1

Here we will use EC2 Instance Connect to connect to Instance 1.

### Step 7 - Test VPC Peering

Here we will get Instance 1 to send test messages to Instance 2.

---

## Troubleshooting Instance Connect

Next, I used EC2 Instance Connect to connect to our instance from the AWS console using SSH, without needing to manage SSH keys. This is a simpler way and more convient as it is on the management console. 

However, I encountered an error because the instance didn't have a public IPv4 address assigned. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-peering_7685490c)

---

## Elastic IP addresses

To resolve this, I allocated an Elastic IP address and associated it with the instance. Elastic IP address are static addresses which do not change after the instance changes state. 

Associating an Elastic IP address resolved the error because EC2 Instance connect will connect using the public internet by default. EC2 Instance Connect requires a public IP to establish a connection over the internet.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-peering_45663498)

---

## Troubleshooting ping issues

To test VPC peering, I ran the command ping 10.2.5.123, the private IP address for instance 2.

A successful ping test would validate my VPC peering connection because it will show there is a valid connection between the two if I can see data transfer. 

I had to update my second EC2 instance's security group because the connection was failing initally. I added a new rule that allowed ICMP traffic from instance 1 to instance 2. ICMP traffic is what is used for the ping command. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-peering_7a29d352)

---

---
