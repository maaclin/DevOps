<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Testing VPC Connectivity

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-networks-connectivity)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## Testing VPC Connectivity

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-connectivity_8ee57662)

---

## Introducing Today's Project!

### What is Amazon VPC?

Amazon VPC allows you to create a logically isolated section of the AWS Cloud where you can launch AWS resources in a virtual network that you define.

### How I used Amazon VPC in this project

I configured network ACLs and security groups to control inbound and outbound traffic, ensuring only necessary traffic was allowed. Then, I launched EC2 instances in the public and private subnets, simulating a real-world application architecture where some resources are publicly accessible and others are kept private for security reasons. We also tested network connectivity between instances in different subnets and to the internet, validating that the VPC was correctly configured.



### One thing I didn't expect in this project was...

I enjoyed using EC2 connect for the first time as I struggled to use it previously before the project but now understand I had the network configuration wrong. 

### This project took me...

This project took me an hour whilst writing up documentation. 

---

## Connecting to an EC2 Instance

Connectivity means we are establishing a SSH connection to our instance. 

My first connectivity test was whether I could connect to my public server and failed so I will need to review my security settings. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-connectivity_88727bef)

---

## EC2 Instance Connect

I connected to my EC2 instance using EC2 Instance Connect, which is an AWS SSH Client in the console instead of using the terminal or vscode. 

My first attempt at getting direct access to my public server resulted in an error, because I did not have an inbound rule allowing SSH traffic. 

I fixed this error by adding the SSH inbound rule and setting it to allow all IP addresses.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-connectivity_1cbb1b88)

---

## Connectivity Between Servers

Ping is a commanad used to test the connectivity of servers.  I used ping to test the connectivity between our public and private server. 

The ping command I ran was ping 10.0.1.89 which was the ip address for our private server. 

The first ping returned a packet loss output. This meant there was an issue with our network configuration as we know the instance is up and running. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-connectivity_defghijk)

---

## Troubleshooting Connectivity

To resolve this, I edited the NextWork Private NACL to add a new inbound rule allowing All ICMP - IPv4 traffic from the public subnet's IPv4 CIDR block. I added the same rule for the private network ACL's outbound rules.

Additionally, I noticed that the private server's security group did not allow ICMP traffic. Therefore, I created a new inbound security group rule for the NextWork Private Security Group, allowing All ICMP - IPv4 traffic from the NextWork Public Security Group.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-connectivity_4a9e8014)

---

## Connectivity to the Internet

Just like ping, curl is a tool to test connectivity in a network. Where ping checks if one computer can contact another (and how long messages take to travel back and forwth), curl is used to transfer data to or from a server.

I used curl to test the connectivity between my Public Server instance and the internet. It sends HTTP requests to a specified URL and displays the response, which can be the content of a website or other data.

### Ping vs Curl

Ping and curl are different because ping is primarily used to test whether a host is reachable and time for messages sent from one machine to another. This is useful for verifying network connectivity. curl, on the other hand, is a tool used to transfer data to or from a server.

---

## Connectivity to the Internet

The successful curl command I ran was curl https://learn.nextwork.org/projects/aws-host-a-website-on-s3, which returned a large amount of HTML data. This indicated that my Public Server was able to successfully fetch the HTML content of the NextWork web app, confirming internet access.



![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-connectivity_8ee57662)

---

---
