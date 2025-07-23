<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Website Delivery with CloudFront

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-networks-cloudfront)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## Website Delivery with CloudFront

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-cloudfront_1dddddwe)

---

## Introducing Today's Project!

In this project, I will demonstrate using Cloudfront for website delivery for delivering content quickly and efficiently around the world.

### Tools and concepts

Services I used were CloudFront and S3. Key concepts I learnt include content delivery network (CDN), caching, latency, S3 bucket policy and OACs. 

### Project reflection

This project took me approximately an hour whilst writing up documentation. 

This is part of my AWS project roadmap collection. 

---

## Set Up S3 and Website Files

I started the project by creating an S3 bucket to store my website files. I can't use CloudFront for this task because it is a content delivery network used for speeding the distribution of content but doesn't actually store the original files. 

The three files that make up my website are index.html, which is the main file that organises the text, pictures and everything else that makes up the webpage. style.css, which dictates the visual apperance of the website and script.js, which is a JavaScript file that adds interactivity to the website, for instance like clicking a button or submitting a form. 

I validated that my website files work by opening them in the browser to see their content.  

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-cloudfront_qgo7wcd3)

---

## Exploring Amazon CloudFront

Amazon CloudFront is a content delivery network, which means it speeds up distribution of web content by caching, a temporary storage location that can be accessed more quickly. Businesses and developers use CloudFront because content is delivered with the best possible performance as the website content is cached across multiple servers around the world and is routed to the location that provides the lowest latency. 

To use Amazon CloudFront, you set up distributions, which are a set of instructions that are used to distribute content. I set up a distribution for our S3 bucket containing our webpages. The origin specifies where the content is stored. 

The default root object is the file that CloudFront should serve when someone visits the root URL of your website.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-cloudfront_qgo7wcdt)

---

## Handling Access Issues

When I tried visiting my distributed website, I ran into an access denied error because we haven't given CloudFront permission to access our S3 bucket yet.

My distribution's origin access settings were Public. This caused the access denied error because the Public origin access setting requires for the bucket to be public to work and our objects in our bucket are private by default. 

To resolve the error, I set up origin access control (OAC). OAC enables CloudFront to securely access an S3 bucket while keeping the bucket private from direct public access. It uses an origin access identity (OAI), which is granted permissions in the S3 bucket policy, similar to how IAM policies assign permissions to specific users or roles.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-cloudfront_egrhntyu)

---

## Updating S3 Permissions

Once I set up my OAC, I still needed to update my bucket policy to allow  Cloudfront to get objects from our S3 bucket. 

Creating an OAC automatically gives me a policy I could copy, which grants permissions for our S3 bucket to get objects from.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-networks-cloudfront_eg98ntyu)

---

## S3 vs CloudFront for Hosting

For my project extension, I'm comparing CloudFront and S3 website hosting. I initially had an error with static website hosting because currently my bucket blocks all public access. 

I tried resolving this by enabling public access thinking unchecking Block all public access would grant permission to access the objects. Instead, it simply stops blocking all public access attempts. I still ran into an error because there is not a bucket policy allowing traffic. 

I could finally see my S3 hosted website when I refreshed my page as the bucket policy had been updated to explicitly grant permissions to anyone on the internet to read the files in the bucket.

Compared to the permission settings for my CloudFront distribution, using S3 meant I had to make the bucket and its objects publicly accessible to serve the website directly. In contrast, with CloudFront, I could use Origin Access Control (OAC) to grant CloudFront permission to access the S3 bucket while keeping the bucket itself private, which is more secure.

---

## S3 vs CloudFront Load Times

---

---
