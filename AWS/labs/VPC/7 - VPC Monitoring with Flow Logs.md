<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# VPC Monitoring with Flow Logs

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-networks-monitoring)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## VPC Monitoring with Flow Logs

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-monitoring_3e1e79a1)

---

## Introducing Today's Project!

### What is Amazon VPC?

VPC is a service that lets you provision a logically isolated section of the AWS Cloud where you can launch AWS resources in a virtual network that you define.

### How I used Amazon VPC in this project

I created two seperate isolated VPCs and configured them to be unique. Then, I created a public subnet in each VPC to ensure the instances would be accessible to the internet and allowed the instances in each to communicate with each other using VPC peering. Last, we used VPC Flow logs to monitor traffic within the VPCs and analysed those logs using Cloudwatch log insights to run queries on the data to gain more detail about network activity. 

### One thing I didn't expect in this project was...

I didn't expect Cloudwatch to have an offering where you could query your logs with sample queries for most used requests. Extremely helpful and easy to use. 

### This project took me...

This project took me approximately an 1hour whilst writing up documentation. 

---

## In the first part of my project...

### Step 1 - Set up VPCs

We will now create two VPCs using the wizard. 

### Step 2 - Launch EC2 instances

Launch an EC2 instance in each VPC, so we can use them to test our VPC peering connection later.

### Step 3 - Set up Logs

Here we will set up a way to track all inbound and outbound network traffic and set up a space that stores all of these records.

### Step 4 - Set IAM permissions for Logs

Now, we will give VPC Flow Logs the permission to write logs and send them to CloudWatch and finish setting up your subnet's flow log.

---

## Multi-VPC Architecture

I started my project by launching two VPCs with one public subnet each. 

The CIDR blocks for VPCs 1 and 2 are 10.1.0.0/16 and 10.2.0.0/16.  They have to be unique so that the IP addresses of their resources don't overlap and have conflicts. 

### I also launched EC2 instances in each subnet

My EC2 instances' security groups allow traffic from EC2 Instance Connect and ICMP traffic. This is because we are going to connect using Instance Connect and ping to test connectivity. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-monitoring_e7fa8775)

---

## Logs

Logs record everything that happens, from users logging in to errors popping up.

Log groups are a collection of logs from a resource region-specific.

### I also set up a flow log for VPC 1

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-monitoring_e8398869)

---

## IAM Policy and Roles

I created an IAM policy because VPC Flow Logs, by default, don't have the permission to record logs and store them in your CloudWatch log group.

I also created an IAM role to attach the policy giving VPC Logs the permission to write logs and send them to Cloudwatch. 

A custom trust policy are used to very narrowly define who can use a role. Not to be confused with policies that help you define the actions a user/service can or cannot do.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-monitoring_4334d777)

---

## In the second part of my project...

### Step 5 - Ping testing and troubleshooting

Now we'll generate some network traffic and see whether our flow logs can pick up on them.

### Step 6 - Set up a peering connection

Now we will set up a connection link between our VPCs using VPC peering. 



### Step 7 - Analyze flow logs

We will review the flow logs recorded aboout VPC 1's public subnet and analyse the flow logs to get some tasty insights. 

---

## Connectivity troubleshooting

My first ping test between my EC2 instances had no replies, which means there is a connection error. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-monitoring_99d4ba42)

I could receive ping replies if I ran the ping test using the other instance's public IP address, which means the instances can communicate with each othe if traffic goes across the public internet!

---

## Connectivity troubleshooting

Looking at VPC 1's route table, I identified that the ping test with Instance 2's private address failed because there is no VPC peering connection to allow the private addresses to communicate with each other. 

### To solve this, I set up a peering connection between my VPCs

I also updated both VPCs' route tables so that there is a route with the VPC peering connection. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-monitoring_7316a13d)

---

## Connectivity troubleshooting

I received ping replies from Instance 2's private IP address. This means I have successfully resolved the connectivity issue. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-monitoring_4ec7821f)

---

## Analyzing flow logs

Flow logs tell us all traffic sent from one IP address to another, which protocol used, packet transfer, ports used, timestamp, and whether the traffic was allowed or denied. 

For example, the flow log I've captured shows a log - 2 354918400698 eni-0bd1344678b35854b 4.4.66.84 10.1.12.3 56456 22 6 11 1672 1745701997 1745702075 ACCEPT OK. This tells us 1672 bytes were transferred successfully from IP Address 4.4.66.84 to 10.1.12.3 using TCP protocol (6) with 11 packets transferred. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-monitoring_d116818e)

---

## Logs Insights

Logs Insights is a CloudWatch feature that analyzes your logs. In Log Insights, you use queries to filter, process and combine data to help you troubleshoot problems 

I ran the query -
stats sum(bytes) as bytesTransferred by srcAddr, dstAddr
| sort bytesTransferred desc
| limit 10. 

This query returns the top 10 byte transfers by source and destination IP addresses.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-monitoring_3e1e79a1)

---

---
