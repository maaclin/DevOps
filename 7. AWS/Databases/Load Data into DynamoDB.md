<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Load Data into DynamoDB

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-databases-dynamodb)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## Load Data into a DynamoDB Table

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-dynamodb_b481c730)

---

## Introducing Today's Project!

### What is Amazon DynamoDB?

Amazon DynamoDB is a fully managed NoSQL database service that provides high-performance, scalable storage for key-value and document data with low-latency access. It’s useful for real-time applications, offering automatic scaling, high availability, and a flexible, schemaless data model.

### How I used Amazon DynamoDB in this project

We create tables using the CLI and added a new attribute and updated the data in DynamoDB.





### One thing I didn't expect in this project was...

I have not used the CLI before so it took some time getting around it but wasn't too hard. 

### This project took me...

This project was quick took me 45 mins watching along the walkthrough with Natasha in bits I got stuck. 

---

## Create a DynamoDB table

Data in a DynamoDB table is organized as items with flexible attributes, uniquely identified by a primary key.

In DynamoDB, an attribute is like a piece of data about an item. In this case, our item is Nikko and the attribute is the number of projects Nikko completed.


![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-dynamodb_a3cefee0)

---

## Read and Write Capacity

Read capacity units (RCUs) and write capacity units (WCUs) are metrics used in Amazon DynamoDB’s to measure and manage the throughput for read and write operations.

The Free Tier for DynamoDB gives you 25GB of data storage, plus 25 Write and 25 Read Capacity Units (WCU, RCU). This is enough to handle 200M requests per month... all for free.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-dynamodb_ef47dd8f)

---

## Using CLI and CloudShell

AWS CloudShell is shell in your AWS Management Console and is the place to run your code! 

AWS CLI (Command Line Interface) is a software that lets you create, delete and update AWS resources with commands instead of clicking through your console.

I ran a CLI command in AWS CloudShell that includes commands to create four new tables in AWS DynamoDB, each with specific attributes and settings.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-dynamodb_81e0258b)

---

## Loading Data with CLI

I ran a CLI command in AWS CloudShell that loads the data of all four files into DynamoDB using AWS CLI's.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-dynamodb_791c600b)

---

## Observing Item Attributes

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-dynamodb_b481c731)

I checked a ContentCatalog item, which had the following attributes: 

I checked another ContentCatalog item, which had a different set of attributes as every single item can have their own set of attributes. This is the whole point of DynamoDB!

---

## Benefits of DynamoDB

A benefit of DynamoDB over relational databases is flexibility, because its schemaless design allows items in a table to have varying attributes without a predefined structure.

Another benefit over relational databases is speed, because  the flexibility enables rapid adaptation to changing data needs.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-dynamodb_b481c730)

---

---
