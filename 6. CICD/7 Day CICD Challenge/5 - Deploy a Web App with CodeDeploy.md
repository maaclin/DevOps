<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Deploy a Web App with CodeDeploy

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-devops-codedeploy-updated)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codedeploy-updated_val-27)

---

## Introducing Today's Project!

AWS CodeDeploy is a continuous deployment service. This means CodeDeploy automates deployments and enables consistent rollouts. It will deploy applications in ways that keep applications avaliable and handles failures. 

### Key tools and concepts

Services I used were AWS CodeDeploy, AWS CodeBuild, AWS CodeArtifact, AWS CloudFormation, and AWS S3.

Key concepts I learnt include Infrastructure as Code, deployment automation, continuous integration and continuous delivery (CI/CD), and disaster recovery.

### Project reflection

This project took me approximately 3 hours. The most challenging part was the secret mission as I struggled with rolling back the project to working as before. 

This project is part five of a series of DevOps projects where I'm building a CI/CD pipeline!

---

## Deployment Environment

To set up for CodeDeploy, I launched an EC2 instance and VPC because that is our production environment. We need to seperate the prod and dev env so that the code written is not shown until devs complete production. 

Instead of launching these resources manually, I used Cloudformation. When I need to delete these resources created by our template we can delete the complete stack which will automatically delete all resources.

Other resources created in this template include all our networking resources. They're also in the template because without this our instance hosting the web app will fail. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codedeploy-updated_val-5)

---

## Deployment Scripts

The install_dependencies.sh script sets up all the software needed to run our website by installing Tomcat and Apache that handle internet traffic and host our application.

It will create settings that let these programs to work together, making our website accessible to visitors on the internet.

start_server.sh will fire up Tomcat and enable auto-start whenever the server reboots then will starts Apache and also enable auto start. Together, these commands ensure our application is up and running and will stay that way even if the server restarts.

This script safely stops web server services by first checking if they're running. It uses pgrep to check for running processes of the programs and only attempts to stop the services if they are actually active. This prevents errors that could occur from trying to stop services that aren't running.

---

## appspec.yml

Then, I wrote an appspec.yml file which is essentially the instruction manual for CodeDeploy. Here's what each part does: The key sections in appspec.yml are BeforeInstall (install dependecies), ApplicationStart (use start_server.sh script) and ApplicationStop (use the stop_server.sh script)

I also updated buildspec.ymlto tell CodeBuild that it should package up the new appspec.yml and all other scripts. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codedeploy-updated_val-12)

---

## Setting Up CodeDeploy

A deployment group is a collection of EC2 instances that are grouped to deploy something together. A CodeDeploy application is like the main folder for your deployment project and allows you to organise everything necessary for deployment. 

To set up a deployment group, you also need to create an IAM role to grant permissions for autoscaling, ec2, elb, cloudwatch and s3. We will use the AWSCodeDeployRole managed by AWS as this will provide all the necessary permissions whilst keeping in best security practices. 

Tags are helpful and super efficent for flexibility; if you add new instances with the same tag, CodeDeploy automatically includes them in future deployments. Self-documentation: Tags like role: webserver clearly explain what the instance does, making our AWS environment easier to understand. Integration: The CloudFormation template we used earlier already tagged our EC2 instance with role: webserver, so everything works together seamlessly.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codedeploy-updated_val-18)

---

## Deployment configurations

Another key settings is the deployment configuration, which affects how fast an application is deployed and the success or failure conditions for a deployment. I used CodeDeployDefault.AllAtOnce as this is a test product which has no effect to an end user, but one/halfatatime would be useful when testing as these slower approaches reduce risk by limiting the blast radius of any potential issues.

In order to connect we must install a CodeDeploy Agent to as whenever you initiate a deployment, it's the CodeDeploy Agent that receives the deployment instructions (i.e. bash scripts) from CodeDeploy and carries them out on the EC2 instance.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codedeploy-updated_val-20)

---

## Success!

A CodeDeploy deployment is a specific update to our application that we are deploying to our users. The difference to a deployment group and a deployment is the group is the settings file and the deployment is the update pushed. 

The revision location is the place where CodeDeploy looks to find your application's build artifacts. We're using the S3 bucket that's storing our WAR file, so CodeDeploy knows where to find the latest version of our web app it's deploying to the deployment EC2 instances.

To check that the deployment was a success, I visited my public IPv4 DNS and I saw my website was functioning with the prompt displayed I created earlier!

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codedeploy-updated_val-27)

---

## Disaster Recovery

In a project extension, I decided to create an intentional error to practice rollbacking. The intentional error I created was a script error in my stop_server file. This will cause the deployment to fail because the script is incorrect and contains commands that will fail. 

I also enabled rollbacks with this deployment, which means a rollback lets you quickly go back to the previous version that was working fine. Rollbacks are important because they help minimize downtime when things break.



When my deployment failed, the automatic rollback did not work because CodeDeploy only reuses the previous deployment's configuration, not the build artifact.

To actually recover from the failed deployment, I'd have to manually fix the code, commit and push the fix, rebuild the application, and then redeploy the fixed version.

In production environments, true automated rollbacks are often implemented with more advanced tools.

AWS CodePipeline can be configured to automatically roll back to the last successful deployment when a failure is detected, which eliminates the need for manual intervention.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-devops-codedeploy-updated_rollback-validation-upload)

---

---
