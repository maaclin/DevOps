<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Encrypt Data with AWS KMS

**Project Link:** [View Project](http://learn.nextwork.org/projects/aws-security-kms)

**Author:** Yossief Solomon  
**Email:** ysolom90@gmail.com

---

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-kms_w0x1y2z3)

---

## Introducing Today's Project!

In this project, I will demonstrate creating encryption keys with AWS KMS. We'll encrypt a DynamoDB database and try retrieve data from it. 

### Tools and concepts

Services I used include Amazon DynamoDB and KMS. Key concepts I learnt include encryption for DynamoDB and adding/deleting key users from KMS policy. 

### Project reflection

This project took me approximately an half an hour whilst writing up documentation.

I completed this project as part of my series of AWS projects.

---

## Encryption and KMS

Encryption is the process of using algorithims to covert data into ciphertext, only authorised users can decrypt and restore the data to its original, readable state. Encryption keys are used to decrypt this data and are stored in a secure vault on AWS KMS.

AWS KMS is a secure vault to manage, create and use encryption keys. Key management systems are important because your keys are safe, you wouldn't have to worry about losing them or someone stealing them. Also, this meets compliance requirements for data security. 

Encryption keys are broadly categorized as symmetric and asymmetric keys. Symmetric keys use the same key for encryption and decryption whilst assymetric keys are a pair of keys: a public key for encryption and a private key for decryption. I set up a symmetric key because it generally faster and more efficent for encrypting large amounts of data, well suited for DynamoDB. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-kms_a2b3c4d5)

---

## Encrypting Data

My encryption key will safeguard data in DynamoDB, which is a fast and flexible way to store your data, which makes it a great choice for applications that need quick access to large volumes of data e.g games. 

The different encryption options in DynamoDB include owned by DynamoDB, AWS managed key and User managed key. Their differences are based on who manages the keys. I selected managed by myself to test the option of having full control. This is the most secure option. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-kms_q8r9s0t1)

---

## Data Visibility

Rather than controlling who has access to the key, KMS manages user permissions by defining policies that specify which users or roles can perform specific actions on the key, such as encrypting, decrypting, or managing it.

Despite encrypting my DynamoDB table, I could still see the table's items because I have permissions to use the encryption keys as I set it up earlier. DynamoDB uses transparent data encryption, which means data is secure at rest and still accessible to authorised users that have the correct permissions. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-kms_c0d1e2f3)

---

## Denying Access

I configured a new IAM user to test the encryption on my table. The permission policies I granted this user are DynamoDB Full Access without permissions to use our KMS key. 

After accessing the DynamoDB table as the test user, I encountered an access denied error due to lack of permissions. This confirmed that my table was correctly encrypted. 

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-kms_w0x1y2z3)

---

## EXTRA: Granting Access

To let my test user use the encryption key, I used the console to add our test user to our key users list. My key's policy was updated to include our nextwork-kms-user and can be seen in our policy JSON in the list of users granted access. 

Using the test user, I retried accessing our table after refreshing the page. I observed the access denied prompt had disappeared and I could see the items in the table which confirmed that I had successfully added the test user to the policy

Encryption secures data instead of access to resources like in security groups or permission policies. I could combine encryption with access cibtriks to add an a layer of security - only users with access permissions and decryption keys can view the actual data.

![Image](http://learn.nextwork.org/sparkling_violet_festive_wombat/uploads/aws-security-kms_feffb2fb8)

---

---
