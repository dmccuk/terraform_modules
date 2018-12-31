## Welcome to my new github repo for using modules in terraform.

### install and setup the aswcli tool

````
# apt install awscli -y
# aws configure
````
Add in your keys as required.

Clone the code onto your linux server and make updates to this files:

````
stack/vars.tf
````

Change the variable count for each size of EC2 instance you need.

````
shared_credentials_file = "/root/.aws/credentials"
````
Make this you're own location as per when you ran aws configure.

````
# terraform init
# terraform plan
# terraform apply
````

# Future improvements:

1) Currently the code will only allow one ec2 instance type per size of instance.
2) Make the ingress ports into an array so they are dynamic based on variables for each ec2 instance type.
