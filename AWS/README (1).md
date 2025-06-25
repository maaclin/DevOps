<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Connect a GitHub Repo with AWS

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-devops-github)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

## Connect a GitHub Repo with AWS

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-github_dd9d254e)

---

## Introducing Today's Project!

In this project I will learn how to store your web application's code in a Git repository.





### Key tools and concepts

Services I used were Github, VS Code and EC2 instances. Key concepts I learnt include connecting a repo, access tokens and pushing new code simultaneously. 

### Project reflection

This project took me approximately 1 hour. I did not find it challenging as it was pretty straight forward!

This project met all my goals! 

This project is part two of a series of DevOps projects where I'm building a CI/CD pipeline!

---

## Git and GitHub

Git is often called a version control system since it tracks your changes by taking snapshots. I installed Git using the commands sudo dnf update -y and sudo dnf install git -y. You verify the install with git-- version.

Even though your code is on a cloud server like EC2, GitHub helps you use Git and see your file changes in a more user-friendly way. It's just like how using an IDE (VSCode) makes editing code easy.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-github_efaadbf7)

---

## My local repository

A Git repository are folders that contain all your project files and their entire version history. Hosting a repo in the cloud, like on GitHub, means you can also collaborate with other engineers and access your work from anywhere.

git init is a command that sets up the directory as a local Git repository which means changes are now tracked for version control.

After running git init, the response was a notice about naming your main branch master with 'main' or 'development' to differentiate from other branches. A branch in Git is where you can experiment safely without changing the master.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-github_7bf21bae)

---

## To push local changes to GitHub, I ran three commands

### git add

git remote add origin [YOUR GITHUB REPO LINK] was the first command I ran which linked local folder to the new repo I had created. git add . stages for all changes to be saved in the next version of the project. 




### git commit

git commit -m "Updated index.jsp with new content" saves the staged changes as a snapshot in your project’s history in a new version.  -m flag lets you leave a message describing what the commit is about for later  review.

### git push

git push -u origin master pushes your changes to origin which is our GitHub repo. 'master' shows it needs to be on the master branch and '-u' sets for the push to default to the origin with git push next time without defining. 

---

## Authentication

When I commit changes to GitHub, Git asks for my credentials to ensure I have the right to push any changes.

### Local Git identity

Git needs my name and email because it needs to author who made the change. This supports collaboration on team projects.

Running git log showed me a history of commits, which also mentions the commit author's name.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-github_9a27ee3b)

---

## GitHub tokens

GitHub authentication failed when I entered my password because I attempted to log in with my password and not my access token. 

A token is a safer form of using a password to connect to Github. 

I could set up a GitHub token by generating a code through developer tools and noting down the code as it is the only time it will be provided to me. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-github_fa11169d)

---

## Making changes again

I wanted to see Git working in action, so I changed a line of my code on VS Code. I couldn't see the changes in my GitHub repo initially because I had not pushed the changes yet. 

I finally saw the changes in my GitHub repo after pushing the git add . command. To see the changes in code, I pushed git diff --staged. Then finally I committed the push with git commit -m "Add new line to index.jsp"
git push. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-github_6becb2bc)

---

## Setting up a READMe file

As a finishing touch to my GitHub repository, I added a README file, which is documentation regarding the project. I used the command touch README.md to create this. 

My README is written in Markdown because it’s useful for docs that need to look clean and easy to read without complex software, making it a favourite for writing on platforms like GitHub.

My README file has 6 sections that outline what I achieved in my project as of yet and what I plan to achieve. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-github_c94976902)

---

---
