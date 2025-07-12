<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Aurora Database with EC2

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-databases-aurora)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## Connect a Web App to Amazon Aurora

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-aurora_44443546)

---

## Introducing Today's Project!

### What is Amazon Aurora?

Aurora is a relational database management system (RDBMS) built for the cloud with full MySQL and PostgreSQL compatibility

### How I used Amazon Aurora in this project

We used Aurora in this project create a database to store and display data for our very own web application.

### One thing I didn't expect in this project was...

I didn't expect Aurora to be so expensive but as it is used for mass scales datasets it makes sense it would be priced high.

### This project took me...

This project was quick half hour on to the next!

---

## In the first part of my project...

### Creating an Aurora Cluster

A relational database is a type of database that organizes data into tables, which are collections of rows and columns.

Aurora is a good choice when we needed something large-scale, with peak performance and uptime. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-aurora_44443546)

---

## Halfway through I stopped!

I stopped creating my Aurora database because I realised I hadn't created my EC2 instance yet!

### Features of my EC2 instance

I created a new key pair for my EC2 instance because it is what we need to access our instance as it is like the login credentials to our virtual computer. 

When I created my EC2 instance, I took particular note of my Public IPv4 DNS and key pair name as they are both crucial for accessing our EC2 instance as if they were house and key. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-aurora_91b9fd1g)

---

## Then I could finish setting up my database

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-aurora_1fddb0b5)

A database cluster in Aurora is a group of database copies that work together so your data is always available.
Each cluster consists of a primary instance (where all write operations occur) and multiple read replicas as back-ups. If your database's primary instance fails, one of the replicas can be promoted to primary automatically.

---

---
