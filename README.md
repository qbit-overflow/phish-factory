# phish-factory
Build and deploy phishing infrastructure in the cloud using infrastructure as code

This was a project built to help deploy phishing websites to S3 utilizing the targats URL as the sub domain for AWS S3 good for testing for CORS errors.

This is there Terraform portion, I had a python script that called httrack to download the website, and TF manages the infrastuctre
