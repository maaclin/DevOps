# Networking Fundamentals 🌐

![AWS Networking Architecture](https://d2908q01vomqb2.cloudfront.net/77de68daecd823babbb58edb1c8e14d7106e83bb/2021/06/15/VPC-Network-Engineers-Part-1-2.png)

---

## Introduction

This repository documents my learning journey through AWS networking concepts and services. It contains practical examples, configurations, and hands-on projects that demonstrate core networking principles for cloud infrastructure and modern application architectures.

---

## Topics Covered 📚

### Core Networking Concepts
- **IP Addressing** - IPv4/IPv6 fundamentals and instance assignment
- **Subnetting** - Network segmentation and CIDR block management
- **Routing** - Traffic direction between networks and gateways
- **DNS Resolution** - Domain name system and traffic management
- **Security Layers** - Network-level protection and access control

### Amazon VPC (Virtual Private Cloud)
- **VPC Architecture** - Isolated network design and CIDR planning
- **Subnet Design** - Public vs private subnet configurations
- **Internet Gateway** - External connectivity and routing
- **NAT Gateway** - Outbound-only internet access for private resources
- **Route Tables** - Traffic flow control and destination mapping

### VPC Security
- **Security Groups** - Instance-level stateful firewalls
- **Network ACLs** - Subnet-level stateless access control
- **VPC Flow Logs** - Traffic monitoring and analysis
- **Layered Defense** - Multiple security control implementation
- **Least Privilege** - Minimal access principle application

### Advanced Networking Services
- **VPC Endpoints** - Private AWS service connectivity via AWS PrivateLink
- **Interface Endpoints** - ENI-based private service access
- **Gateway Endpoints** - S3 and DynamoDB direct connectivity
- **Route 53** - DNS service and intelligent routing policies
- **CloudFront CDN** - Content delivery and edge caching
- **Direct Connect** - Dedicated physical AWS connections

### Traffic Flow & Routing
- **DNS Resolution** - Recursive queries and authoritative responses
- **Geolocation Routing** - Location-based traffic direction
- **Latency-Based Routing** - Performance-optimized routing
- **Load Balancing** - Traffic distribution and health checks
- **API Gateway** - Microservices routing and management

---

## Project Completed 🛠️

### NGINX Website on AWS EC2: nginxcoderco.click
Complete web server deployment demonstrating core networking concepts:
- EC2 instance configuration with NGINX web server
- Route 53 DNS management for domain resolution
- Custom domain setup pointing to EC2 public IP
- Security Groups configuration for HTTP/HTTPS traffic
- Public subnet deployment with Internet Gateway routing
- Browser accessibility verification at new.nginxcoderco.click
- End-to-end DNS resolution testing and validation

---

## Key Skills Developed

- Designing secure and scalable network architectures
- Implementing proper subnet segmentation and routing
- Configuring multi-layered security controls
- Optimizing traffic flow and content delivery
- Troubleshooting network connectivity issues
- Managing DNS and global traffic distribution

---

## Practice Notes

Understanding these concepts requires hands-on practice with VPC creation, subnet configuration, and security group management. Focus on the differences between stateful and stateless controls, and practice routing scenarios in the AWS Free Tier environment.
