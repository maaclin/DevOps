<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# APIs with Lambda + API Gateway

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-compute-api)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-api_c9d0e1f2)

---

## Introducing Today's Project!

In this project, I will build an API without having to manage traditional servers using AWS Lambda and Amazon API Gateway.

### Tools and concepts

Services I used were Lambda functions and API Gateway. Key concepts I learnt include creating Lambda functions, methods, creating APIs and managing them in the gateway and publishing documentation. 

### Project reflection

'This project took me approximately an hour whilst writing documentation. 

This project is part of wider collection of Compute projects on my AWS roadmap. 

---

## Lambda functions

AWS Lambda is a service that allows you to run code without needing to manage any computers/servers. I'm using Lambda in this project to add our function's code next.

The code I added to my function will set up a Lambda function that retrieves data from a DynamoDB table. It searches for specific user data based on a userId and returns that data.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-api_a1b2c3d5)

---

## API Gateway

APIs allow communication between different systems. There are different types of APIs which use different methods to interact with resources. My API is UserRequestAPI and it will be let users access the function. 

Amazon API Gateway is an AWS service that makes it easy for developers to create, publish, maintain, monitor, and secure APIs at any scale.

When a user makes a request, the API Gateway acts as the "front door" to the Lambda function. The API Gateway receives requests and then forwards them to Lambda functions for processing.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-api_m3n4o5p6)

---

## API Resources and Methods

API resources are individual endpoints within your API that handle different parts of its functionality.

Each resource consists of methods which define what are you doing with the resource, i.e. GET to retrieve data, POST to add ect. 

I created a GET method for the /users resource which is designed to connect to my Lambda function. API Gateway will pass that request to Lambda, who will retrieve user data from a DyanmoDB table. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-api_c9d0e1f2)

---

## API Deployment

When you deploy an API, you deploy it to a specific stage. A stage is a snapshot of your API at a specific point in time. This allows multiple teams to test and add features without affecting the main version. I deployed to a new stage and named it prod to emulate the production stage. 

To visit my API, I visited my invoke url in my browser. The API displayed an error because I have not set up my DynamoDB table yet, which I will do in the next step of this project. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-api_3ethryj2)

---

## API Documentation

API documentation is a detailed description of an API's functionality, including its endpoints (e.g. /users), methods (e.g. GET), parameters (e.g. userId), and responses (e.g. errors or success response).

Good documentation is crucial for developers to understand how to use the API correctly and efficiently.

Once I prepared my documentation, I can publish it to the prod stage I created earlier. You have to publish your API to a specific stage because you want to keep documentation consistent with the version of your API.

My published and downloaded documentation showed me the additional API settings specific to API Gateway, including the documentation I added in the API Gateway console.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-api_z9a0b1c2)

---

---
