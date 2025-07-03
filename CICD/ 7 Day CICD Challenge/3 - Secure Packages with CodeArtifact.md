<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Secure Packages with CodeArtifact

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-devops-codeartifact-updated)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codeartifact-updated_1d79e699)

---

## Introducing Today's Project!

When building apps, you don't create everything from scratch. Instead, you often use pre-made "packages" (chunks of code) that other developers have already created. CodeArtifact is an artifact repository, which means you use it to store all of your app's packages in one place.

### Key tools and concepts

Services I used were AWS CodeArtifact, Amazon EC2, AWS IAM roles and policies and AWS CloudShell. Key concepts I learnt include connecting CodeArtifact to an instance, granting permissions using roles and policies and using CLI to deploy code. 




### Project reflection

This project took me approximately 3 hours. It was a steep learning curve as I have not used these services before and came into trouble with Remote SSH extension connection dropping unexpectedly throughout the project. Also, this was a bit intensive in terms of scripts run so I had to get my head around that aswell.  

This project is part three of a series of DevOps projects where I'm building a CI/CD pipeline! 

---

## CodeArtifact Repository

CodeArtifact provides a centralized, secure, and scalable way to manage dependencies for Java projects, improving build consistency and security. Engineering teams use artifact repositories because they are safe, reliable and you are in control. 

A CodeArtifact domain is like a folder that holds multiple repositories belonging to the same project or organization. It allows you to ensure consistent security controls across all your package repositories in an efficient way without having to set up permissions for each repository separately.

Upstream repositories are like backup libraries that your primary repository can access when it doesn't have what you need. I am using Maven Central as my upstream repository. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codeartifact-updated_n4o5p6q7)

---

## CodeArtifact Security

### Issue

To access CodeArtifact, we need to connect the instance to Maven using an auth token. I ran into an error when retrieving a token because by default there are no permissions configured as AWS follows the least privilege principle. 

### Resolution

To resolve the error with my security token, I created a policy, attached it to a role which then was connected to my instance allowing the services to now communicate with each other. 

It's security best practice to use IAM roles because it follows the principle of least privilege which ensures only those who need to use services can temporarily use it. This will reduce the margin of error for safety and costs. 

---

## The JSON policy attached to my role

The JSON policy I set up grants  permissions for auth tokens and for temporary elevated access for CodeArtifiact operations. I have only granted permissions where essential following the principle of least privilege. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codeartifact-updated_23rp7q8r9)

---

## Maven and CodeArtifact

### To test the connection between Maven and CodeArtifact, I compiled my web app using settings.xml

The settings.xml file configures Maven to authenticate itself before downloading dependencies then creating a seamless connection where builds will automatically generate. 

When you compile your project, you're making sure everything is correctly set up and ready to turn into a working app.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codeartifact-updated_c17eace8)

---

## Verify Connection

After compiling, I checked my repository and saw all the dependencies downloaded from Maven successfully downloaded. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codeartifact-updated_1d79e699)

---

## Uploading My Own Packages

In a project extension, I also decided to use CodeArtifact to utilise the function to create and host completely custom packages. This is useful in situations where proprietary, custom, in-house code that you want to share internally but keep private from the outside world.

To create my own package, I first created a simple text file with:

bash
Copy
Edit
echo "Hellooooo this is a test package!" > secret-mission.txt

Then I bundled it into a compressed package (tar.gz format) using the tar command:

bash
Copy
Edit
tar -czvf secret-mission.tar.gz secret-mission.txt

I also generated a security hash because AWS CodeArtifact requires a cryptographic hash to verify the integrity of the file, ensuring it hasn't been tampered with or corrupted during the upload. To do that, I ran:

bash
Copy
Edit
export ASSET_SHA256=$(sha256sum secret-mission.tar.gz | awk '{print $1;}')
I verified my hash by running:

bash
Copy
Edit
echo $ASSET_SHA256
This hash is essentially the package's unique digital fingerprint, making sure the package remains secure and intact throughout its lifecycle.

To publish the package, I ran the command on the cli which deployed the package to CodeArtifact.  When I look at the package details in CodeArtifact, I can see new secret mission package uploaded onto the repositories. 

To validate my packages, I then ran the last piece of code which would retrieve our package from the repository. Finally, I ran a tar command and saw my original message - Helllooo this is a test package!

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codeartifact-updated_sm12-upload)

---

---
