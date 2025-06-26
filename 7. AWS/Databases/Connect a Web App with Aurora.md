<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Connect a Web App with Aurora

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-databases-webapp)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## Connect a Web App to Amazon Aurora

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-webapp_1709b26b)

---

## Introducing Today's Project!

### What is Amazon Aurora?

Amazon Aurora is a relational database offering which is specialised for mass datasets and handling high perfomance use cases. 

### How I used Amazon Aurora in this project

We used Aurora to connect to a web app, entering through our browser and seeing updates in the backend database. 

### One thing I didn't expect in this project was...

I had some trouble creating my web application after making the SamplePage.php file but after watching back on the walkthrough on the project I was able to work backwards and fix my fault in my code. 

### This project took me...

This project took an hour and half including time for troubleshooting. 

---

## Creating a Web App

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-webapp_b7999168)

To connect to my EC2 instance, I connected my key pair from my local machine by SSH.

To help me create my web app, I installed a whole bunch of stuff needed to run your web app. In particular an Apache web server, PHP, pages.php-mysqli, MariaDB. Then I started the basic version of our web app with the following command: sudo systemctl start httpd
and accessed my public ipv4 dns and saw success as the page showed 'it works'. 

---

## Connecting my Web App to Aurora

I set up my EC2 instance's connection details to my database by creating a new folder and file in your EC2 instance to connect to our Aurora database. We made sure the permissions were correct using chown and created a file using nano called dbinfo.inc which stores our connection details. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-webapp_1709b25b)

---

## My Web App Upgrade

Next, I upgraded my web app by creating a sample page in the /html folder using nano, granting permissions to the folder and then checked my web server successfully connects by opening my web browser. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-webapp_2709b25b)

---

## Testing my Web App

To make sure my web app was working correctly, we downloaded MySQL CLI that lets us run SQL queries in the command line. We ran queries that selected all data from a table on our database and verified that contains through the web app. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-databases-webapp_1409z22b)

---

---
