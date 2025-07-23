<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Visualize a Relational Database

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-databases-rds)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## Visualise a Relational Database

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-rds_1fddb0b5)

---

## Introducing Today's Project!

### What is Amazon RDS?

Amazon RDS is a managed cloud database service that simplifies setting up, operating, and scaling relational databases in the AWS Cloud

### How I used Amazon RDS in this project

We used RDS to create a relational database instance populated it using MySQL workbench and made it publicly accessible. Then, we connected workbench through the VPC. We configured security groups for both our RDS instance and Quicksight to make sure our data stayed secure and made it not publicly accessible. Once everything had been connected through a VPC Dataset in Quicksight we made a dashboard visualising salaries amongst different job roles. 

### One thing I didn't expect in this project was...

I didn't expect there to be so much moving parts but I enjoyed attempting to wrap my head around Quicksight. 

### This project took me...

This project took 2 hours as I was carefully creating documentation whilst completing the task. 

---

## In the first part of my project...

### Creating a Relational Database

I created my relational database by navigating to RDS, selecting databases and creating a MySQL database which is supported under the free tier. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-rds_43343546)

---

## Understanding Relational Databases

A relational database is a type of database that organizes data into tables, which are collections of rows and columns. 

### MySQL vs SQL

The difference between MySQL and SQL is that MySQL is software used to create, manage, and interact with relational databases but is only one of many options for using SQL to manage relational data. SQL is a programming language used in relational databases.

---

## Populating my RDS instance

The first thing I did was make my RDS instance public because I want to connect using MySQL workbench.

I had to update the default security group for my RDS schema because I needed to allow outbound traffic from my local machine so I could access the database through MySQL workbench. This is a general practice of good security as now only my local machine can access the database. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-rds_91b9fd1g)

---

## Using MySQL Workbench

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-rds_1fddb0b5)

To populate my database I created a table with all the new hire information. Then, I ran query which showed all the data to ensure I successfully corrected it. It listed all the employee information and I then created another query which would add department locations by city and name. 

---

## Connecting QuickSight and RDS

To connect my RDS instance to QuickSight I created an account and selected datasets, selected my database and filled out the values to validate my connection. 

This solution is risky because anyone can connect to the database as I set it previously to 0.0.0.0/0. 

### A better strategy

'First, I made a new security group so that we can put QuickSight in a security group and our RDS in a Security Group, then let our RDS security accept requests from the QuickSight security group only.

I connected my new security group to QuickSight by updating the permissions on the role by adding an inline policy and updating the JSON file. 

---

## Now to secure my RDS instance

To make my RDS instance secure I closed public connections and connected it to a new security group. Then, I added inbound rules to allow QuickSight in and it will now be connected to our instance. 

I made sure that my RDS instance could be accessed from QuickSight by adding the security group to my instance now allowing inbound traffic from Quicksight. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-rds_1709b26b)

---

## Adding RDS as a data source for QuickSight

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-rds_1709b29b)

This data source is different from my initial data source because the connection type is no longer public but instead to the VPC I set it to earlier. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-rds_1709b30b)

---

---
