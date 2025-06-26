<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Secure Secrets with Secrets Manager

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-security-secretsmanager)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-secretsmanager_r7s8t9u0)

---

## Introducing Today's Project!

In this project, we're going to learn how to use AWS Secrets Manager to securely store and retrieve secrets.

### Tools and concepts

Services I used were AWS Secrets Manager and Github. We learnt in this to task the importance of masking sensitive credentials in our files posted to public repositories on Github. 

### Project reflection

This project took me approximately an hour. This is an important mini project as publishing on Github is a key part of an engineers day to day and not securing data properly can be a major security risk. 

This task is a part of my AWS roadmap.

---

## Hardcoding credentials

In this project, a sample web app is exposing our access key id and secret access key. It is unsafe to harcode credentials because this is a major security risk as anyone can access your keys once you publish your github repo. 

I've set up the initial configuration with test credentials as this is safer than exposing our account to security risks with real keys. If someone had your keys, they could use all your AWS services, potentially racking up large bills or accessing sensitive data in your account.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-secretsmanager_j2k3l4m5)

---

## Using my own AWS credentials

---

## Pushing Insecure Code to GitHub

Once I updated the web app code with credentials, I forked the repository because we want our changes to be showcased to the public. A fork is different from a clone as a fork can be public and a clone is downloaded onto your local computer. 

To connect my local repository to the forked repository, I used git init to start tracking changes in my project and use git remote add origin fork-url to create a new remote connection to our repository. 

Then I used git add and git commit to stage all changes then commit them to our forked repo. Finally, git push -u origin main uploads the commits to our remote repository named origin on the main branch. 

The -u flag sets a connection between the main on both our remote and local branch so we do not need to specify in the future and can simply use git push and git pull. 

GitHub blocked my push because it detected secret keys in our repo change. This is a good security feature because if you overlooked redacting your keys and uploaded, Github provides an extra level of protection before accidentally uploading publicly. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-secretsmanager_o2p3q4r5)

---

## Secrets Manager

Secrets Manager is a vault for our secret keys saved securely on AWS. I'm using it to store our secret keys for our AWS credentials. Other common use cases include Database credentials, OAuth tokens and API keys. 

Another feature in Secrets Manager is secret rotation and is the process of automatically changing your secrets on a regular schedule. This is a security best practice because it reduces the risk of compromised credentials.

Secrets Manager provides sample code in various languages, like python, javascript, ruby ect to help integrate into whichever code they are using. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-secretsmanager_h2i3j4k5)

---

## Updating the web app code

I updated the config.py file to retrieve credentials from Secrets Manager by replacing the entire file content with the sample code provided by AWS Secrets Manager.

I also added code to config.py to extract the credentials from the retrieved secret. This is important because the get_secret() function retrieves the entire secret, so I assigned seperate values for value. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-secretsmanager_v0w1x2y3)

---

## Rebasing the repository

Git rebasing is a process of rewriting the commit history of a branch. I used it to remove a commit that contained hardcoded AWS credentials from the project's history.

A merge conflict occurred during rebasing because when Git detects conflicting changes in a file, it adds special markers to show you exactly where the conflicts are, I resolved the merge conflict by deleting those conflicts. 

Once the merge conflict was resolved, I verified it was out of our repository on Github by checking our config file in our public fork. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-secretsmanager_t5u6v7w8)

---

---
