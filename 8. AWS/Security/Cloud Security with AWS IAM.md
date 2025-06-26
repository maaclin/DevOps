<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Cloud Security with AWS IAM

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-security-iam)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-iam_1c864649)

---

## Introducing Today's Project!

In this project, we'll be using the AWS IAM service to control who is authenticated (signed in) and authorized (has permissions) in your AWS console.

### Tools and concepts

Services I used were EC2 and IAM. Key concepts I learnt include IAM policies, EC2 instance states and group policies. 

### Project reflection

This project took me approximately 30 mins. It was most rewarding to consilidate previous knowledge. 

---

## Tags

Tags are organisation tools that let us label our resources. They are helpful for grouping resources, cost allocation and applying policies. 

The tag I’ve used on my EC2 instances is called env. The value I’ve assigned for my instances are development and production. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-iam_2e0e5a5d)

---

## IAM Policies

IAM Policies are rules that provide granular permissions to a user and highlights when they should and should not be able to use them. 

### The policy I set up

For this project, I’ve set up a policy using the JSON. 

I’ve created a policy that allows the user to complete the task needed and denys the user from deleting tags and creating tags. 

### When creating a JSON policy, you have to define its Effect, Action and Resource.

The Effect, Action, and Resource attributes of a JSON policy means Effect = change in rule to either allow or deny; Action: list of actions the policy allows and denies; Resource; which resources this applies to. 

---

## My JSON Policy

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-iam_1c864649)

---

## Account Alias

An account alias is a easy name to login to your account instead of the long number which is easy to forget. 

Creating an account alias took me seconds. Now, my new AWS console sign-in URL is maaclin99.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-iam_0eb4439b)

---

## IAM Users and User Groups

### Users

IAM users are users who can access resources in the AWS account. 

### User Groups

IAM user groups are collections of users for easier user management who will inherit the same permissions. 

I attached the policy I created to this user group, which means all will now inherit the new rules. 

---

## Logging in as an IAM User

The first way is email invitation with temporary password and the second is manual sharing of credentials. 

Once I logged in as my IAM user, I noticed he does not have the same acess as me. This was because the group he is attached to does not have the same permissions as me. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-iam_6f2ab446)

---

## Testing IAM Policies

I tested my JSON IAM policy by attempting to stop both the development and production instances. 

### Stopping the production instance

When I tried to stop the production instance we were met with an error because our production instance is tagged with the production label which is not included in the interns policy.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-iam_0e7a9d6a)

---

## Testing IAM Policies

### Stopping the development instance

Next, when I tried to stop the development instance we successfully saw the instance state change to stopping. This was because our permission policy allows interns to stop the development instance. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-iam_1811801c)

---

## The IAM Policy Simulator

### How I used the simulator

---

---
