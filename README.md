## Welcome ot my new github repo for using modules in terraform.

### install and setup the aswcli tool

````
# apt install awscli -y
# aws configure
````
Add in your keys as required.

Clone the code onto your linux server and make updates to these files:

modules/elk/main.tf
````
shared_credentials_file = "/root/.aws/credentials"
````
Make this you're own location as per when you ran aws configure.

change the node count to the one you want as well as the ports required:

````
stack/vars.tf:  default = 2
````

````
# terraform plan
# terraform apply
````
