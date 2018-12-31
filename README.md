## Welcome to my new github repo for using modules in terraform.

## Requirements:

 * Terraform installed (please see hashicorp website)
 * Linux (I use vagrant on Windows)

### install and setup the aswcli tool for Access/secret credential storage
(outside of your code and not in Github!)

````
# apt install awscli -y
# aws configure
````
Add in your keys as required.

### clone:
Clone the code onto your linux server and make updates to this files:

````
stack/vars.tf
````

Change the variable count for each size of EC2 instance you need and make any other changes you need to.
Like your .pem key location, AMI type for your region/OS, etc...

I.E.
````
shared_credentials_file = "/root/.aws/credentials"
````
Once you're happy, run the following:

````
# terraform init
# terraform plan
# terraform apply
````

If you get any errors, see if you've made a typo or let me know by raising an issue.

# Future improvements:

1) Currently the code will only allow one ec2 instance type (operating system) per size of instance. It may be eaiser to just refactor the module and create more for specific operating systems (so Ubunutu and Red Hat have there own module) or just reference an AMI variable pointing to a different OS.
2) Make the ingress ports into an array so they are dynamic based on variables for each ec2 instance type. At the moment you need to add them all individually but an array would be nicer.

