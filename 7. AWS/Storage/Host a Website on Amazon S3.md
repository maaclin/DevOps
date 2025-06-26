<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Host a Website on Amazon S3

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-host-a-website-on-s3)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-host-a-website-on-s3_5d4474f9)

---

## Introducing Today's Project!

### Tools and concepts

 S3 allows you to store objects; files like documents, images, videos, or backups in "buckets" which are essentially containers similar to folders. 

### Project reflection

I used S3 to store the .html and image files for my website and host my static website. 

---

## How I Set Up an S3 Bucket

Creating a S3 bucket is effortless and takes seconds to provision. 

I picked eu-west-2 for my S3 bucket because it is the most geographically close to me to optimize latency, minimize costs and is a good rule of thumb for the future for addressing regulatory requirements.

No two buckets can share the same name, ensuring each bucket can be uniquely identified and accessed.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-host-a-website-on-s3_ba6d42ad)

---

## Upload Website Files to S3

### index.html and image assets

Next, I uploaded my index.html and website folder containing everything I needed for my site. 

Both files are necessary for this project as the .html is the blueprint of the site and the folder contains all the images needed for my site. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-host-a-website-on-s3_a265af88)

---

## Static Website Hosting on S3

Web hosting is essentially renting space on a server to store your website's files and data. 


I simply scrolled to the bottom of properties on my bucket, enabled static website hosting, selected host a static website as the hosting type and specificied index.html as the default page. 

An ACL is a set of rules that decides who can get access to a resource. I enabled ACLs for this website as it would allow me to practice managing access for each object in my bucket individually compared to the whole bucket with a bucket policy.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-host-a-website-on-s3_c22c54c0)

---

## Bucket Endpoints

When you configure your bucket as a static website, the website is available at the AWS Region-specific website endpoint of the bucket

When I first visited the bucket endpoint URL, I saw an error code, to solve this error we need to set the permission of the objects to public as the bucket may be public but the images/html files are still private. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-host-a-website-on-s3_22ce4daf)

---

## Success!

To resolve this connection error I went back to my s3 bucket > actions > make public using acl, which now allowed me to select which files were made public and the end result was a fully functioning page.  

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-host-a-website-on-s3_5d4474f9)

---

## Bucket Policies

---

---
