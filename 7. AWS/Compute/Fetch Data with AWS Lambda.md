<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Fetch Data with AWS Lambda

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-compute-lambda)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## Fetch Data with AWS Lambda

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-lambda_p9thryj2)

---

## Introducing Today's Project!

In this project, I will demonstrate how to use a serverless AWS Lambda function to retrieve data from a DynamoDB table.  

### Tools and concepts

Services I used were Lambda functions, DynamoDB table and permission policies.

### Project reflection

This project took me approximately an hour and was a good refresher to my previous knowledge on functions. 

This project is part of a wider range of projects for my AWS roadmap. 

---

## Project Setup

To set up my project, I created a database using DynamoDB, named it userdata and added a partition key named userID which is how data is organised.

In my DynamoDB table, I added a sample user with a userId of 1, a name of Test User, and an email of test@example.com. DynamoDB is schemaless, which means you can add attributes as you need, and every item in your database can have a different set of attributes.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-lambda_a112c3d5)

### AWS Lambda

AWS Lambda is a service that lets you run code without needing to manage any computers/servers. I'm using Lambda in this project to retrieve table items on demand. 

---

## AWS Lambda Function

My Lambda function has an execution role, which is an IAM role for our function. The role grants basic permissions for writing logs to CloudWatch. 

My Lambda function will take a userId as input. It will then grab the corresponding data from the UserData table in DynamoDB and return the data. 

The code uses AWS SDK, which is is a set of tools that let developers build apps that interact with AWS. My code uses SDK to use pre-written functions for communicating with DynamoDB and getting data from a table. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-lambda_a1b2c3d5)

---

## Function Testing

To test whether my Lambda function works, I created a test which searches for item 1 of userID. The test is written in JSON. If the test is successful, I'd see the retrieved item from my table. 

The test displayed a 'success' message, simply meaning the function itself could run but the function's response failed as it does not have permissions to access our DynamoDB table. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-lambda_u1v2w3x4)

---

## Function Permissions

To resolve the AccessDenied error I need to attach a policy to our Retrieve User Data role which allows us to access the DynamoDB table. 

There were four DynamoDB permission policies I could choose from, but I didn't pick because they either gave me too much or less permissions needed for this task. 

I chose AmazonDynamoDBReadOnlyAccess as it was the right choice because it would allow me to complete the getitem function whilst following the rule of least privilege. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-lambda_3ethryj2)

---

## Final Testing and Reflection

To validate my new permission settings, I ran the test for userId again and the results showed me the correct response for that item in our DynamoDB table. 

Web apps are a popular use case of using Lambda and DynamoDB. For example, I could create a table of routes assigned to drivers and create a function that organises the delivery of those routes using an external API. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-lambda_p9thryj2)

---

## Enahancing Security

---

---
