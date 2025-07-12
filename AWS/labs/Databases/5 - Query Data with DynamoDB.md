<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Query Data with DynamoDB

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-databases-query)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## Query Data with DynamoDB

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-query_733d9399)

---

## Introducing Today's Project!

### What is Amazon DynamoDB?

Amazon DynamoDB is a nonrelational database service stored in tables where data is data is organised using attributes and items. 

### How I used Amazon DynamoDB in this project

In the todays project we used DynamoDB to create and load tables using the GUI and CLI, ran queries and ran a transaction which allowed us to run multiple operations as one to manage related data.  

### One thing I didn't expect in this project was...

Using the CLI was a bit of a steep learning curve but after enough practice it made sense nevertheless!

### This project took me...

This project took me an hour including demo and documentation. 

---

## Querying DynamoDB Tables

A partition key is a unique attribute in Amazon DynamoDB that determines the partition where an item is stored.

A sort key is an optional attribute in Amazon DynamoDB that, when combined with a partition key, enables sorting and range queries for items within the same partition.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-query_d105b0b0)

---

## Limits of Using DynamoDB

I ran into an error when I queried for usernames I did not include a PK. This was because you have to use a PK to query items. 

Insights we could extract from our Comment table includes all comments left on posts. Insights we can't easily extract from the Comment table includes all comments made my a specific user. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-query_cb3e260c)

---

## Running Queries with CLI

A query I ran in CloudShell was dynamdodb-get-item. This query will grab the item from the table with the PK instructed in the command. 

Query options I could add to my query are: consistent read, projection expression which only returns certain attributes and the consumed capacity. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-query_733d9399)

---

## Transactions

A transaction is a group of operations that are bundled together and get executed as one. All operations must process succesfully to be completed. 

I ran a transaction using the CLI using the TRANSACTION command. This transaction did two things it created a new entry in the comment table with Connors comment and then reflected a comment in the event field on the forum table.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-query_2f65f83e)

---

---
