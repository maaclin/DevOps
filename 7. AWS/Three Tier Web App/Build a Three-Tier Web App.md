<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Build a Three-Tier Web App

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-compute-threetier)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## Build a Three-Tier Web App

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-threetier_2b3c4d5e)

---

## Introducing Today's Project!

In this project, I will demonstrate a three tier web application using with S3, CloudFront, Lambda, API Gateway, and DynamoDB.



### Tools and concepts

In this project, we uploaded our webpages to S3 and delivered them using Cloudfront. Then, we created a Lambda function to fetch data from our DynamoDB table with some test data to practice writing serverless code. We created a Rest API which acts as a front door for our function and integrated the front end and backend of our site connecting our API Gateway endpoint to our table with our test data. 

### Project reflection

This project took me approximately 1.5 hours whilst writing documentation. This taught me the importance of the finicky nature of writing serverless code and any small error in code would make everything fail even extra punctuation. 

This project showcases my skills building a three tiered web application on AWS!

---

## Presentation tier

For the presentation tier, I will set up a bucket and upload a simple index.html file to your bucket and make our website accessible by enabling static website hosting on S3. Last, we'll set up CloudFront to deliver your website's content globally.

I accessed my delivered website by using the distribution domain name provided by Cloudfront after creating a new distribution. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-threetier_3a4b5c6d)

---

## Logic tier

For the logic tier, I will set up a Lambda function to get items from our DynamoDB table. 

The AWS Lambda function retrieves user data from a DynamoDB table by extracting a userId from the event's queryStringParameters, using the AWS SDK to send a GetCommand to fetch the corresponding item, and returning the item as a 200 status.

 If no item is found, it returns a 404 status code with a "no user data found" message, and if an error occurs, it logs the error and returns a 500 status code with an error message. 

The function is deployed and ready to be invoked after initializing a DynamoDB client configured for a specific AWS region.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-threetier_6a7b8c9d)

---

## Data tier

For the data tier, I will set up a DynamoDB table and add user data inside it for our Lambda function to retrieve data from. 

The partition key for my DynamoDB table is userId which I like to think of as a 'label' that you can use to group similar items.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-threetier_u1v2w3x4)

---

## Logic and Data tier

Once all three layers of my three-tier architecture are set up, the next step is to add some test data to our DynamoDB table and update our script.js file with JavaScript code to make an API request. then we will verify that the data is displayed on our website.

To test my API, I searched the invoke API url and added /users?userId=1. The results were the first item from our DynamoDB table  which is what we want so it has been correctly integrated. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-threetier_a112c3d5)

---

## Console Errors

The error in my distributed site was because our javascript file was not connected to our proudction api url but instead a placeholder. We will need to correct it to match our url. 

To resolve the error, I updated script.js by adding our URL and then reuploaded it into our S3 bucket.

I ran into a second error after updating script.js. This was an error with as we do not have CORS configured in our API gateway. This is a security protocol from our browser not allowing traffic between the frontend, our site and the backend, API Gateway. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-threetier_a1b2c3d5)

---

## Resolving CORS Errors

To resolve the CORS error, I first enabled CORS in our API Gateway resource and enabled the GET and OPTIONS methods. Then, I added our cloudfront address as the origin that can access the resource. 

I also updated my Lambda function because the CORS error indicated that the API Gateway was not configured to allow requests from my CloudFront URL. The changes I made were to include the Access-Control-Allow-Origin header in the Lambda function's response.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-threetier_1qthryj2)

---

## Fixed Solution

I verified the fixed connection between API Gateway and CloudFront by refreshing our domain name and querying for userId 1 and saw the data from my table displayed. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-compute-threetier_2b3c4d5e)

---

---
