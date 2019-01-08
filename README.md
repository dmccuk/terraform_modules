## Welcome to my new github repo for using modules in terraform.

Hi,
The purpose of this code is to build out a "Datacentre" of servers that met your environment requirements. You have the option to build any number of these types of EC2 instances (micro, small, medium). Simply update the stack/vars.tf file with the number and, once your access, secret, .pem key and keyname have been added, you should be able to start building. I'll be updating the code regularly to include an option to build gitlab and jenkins servers (configured) so you can start using them as soon as they're built. I want to add some webservers and a load balancer too (maybe an nginx LB or a ELB) as well as a testing framework to work with code testing on git commits that jenkins can hook in to. It should be a handy bit of code by the end! 

## Cloners:
 * **If you use this code, it will cost you some AWS Dollars:**
   * Only build what you need to.
   * Turn off anything you aren't using. You only pay for what you need, don't leave 10 instance up for weeks!
   * **Use this code at your own risk. By typing "terraform apply" you are building in AWS and you WILL be charged.**
 * Thanks for taking the time to clone and test my code.
 * If you like the code and it works for you, please like the repo.
 * I make regular updates so please follow me to get notified when I make changes.
 * Please collaborate. If you see something that's wrong or could be done better, or even a typo!, make a pull request and I'll happily test and merge your code.
 * If you see a problem, please raise me an issue and I'll look to resolve it asap.
 
## Requirements:

 * You should be familiar with AWS (pem keys, access/sceret keys, etc). If not, search Ryan Kroonenberg on udemy.
 * install awscli (instructions below): pip may be required.
 * You'll need to install Terraform (please see hashicorp's website).
 * A Linux server (I use vagrant (Ubuntu 16.04.5 LTS) on Windows - My terraform code runs on ubuntu 16.04).
 * Linux packages required (install these): curl git wget python. 


## Updates:
 * The plan is to make a mini CI/CD "datacentre" with all the current Devops tooling available within the environment * I've added a new module to standup a gitlab Server. in the stack/vars.tf, make this "1" for terraform to build you a GitLab CE installation based on the public IP address of the node.
 * I'll shortly add an update to standup a Jenkins server as well (installed and configured).
 
#### Option (1) Install pip first
<details>
 <summary>Expand for the details</summary>
  <p>

Use the curl command to download the installation script:
````
# curl -O https://bootstrap.pypa.io/get-pip.py
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 1622k  100 1622k    0     0   766k      0  0:00:02  0:00:02 --:--:--  766k

# python get-pip.py
Collecting pip
  Downloading https://files.pythonhosted.org/packages/c2/d7/90f34cb0d83a6c5631cf71dfe64cc1054598c843a92b400e55675cc2ac37/pip-18.1-py2.py3-none-any.whl (1.3MB)
    100% |████████████████████████████████| 1.3MB 1.6MB/s
Collecting setuptools
  Downloading https://files.pythonhosted.org/packages/37/06/754589caf971b0d2d48f151c2586f62902d93dc908e2fd9b9b9f6aa3c9dd/setuptools-40.6.3-py2.py3-none-any.whl (573kB)
    100% |████████████████████████████████| 573kB 1.2MB/s
Collecting wheel
  Downloading https://files.pythonhosted.org/packages/ff/47/1dfa4795e24fd6f93d5d58602dd716c3f101cfd5a77cd9acbe519b44a0a9/wheel-0.32.3-py2.py3-none-any.whl
Installing collected packages: pip, setuptools, wheel
Successfully installed pip-18.1 setuptools-40.6.3 wheel-0.32.3

# pip install awscli
Collecting awscli
  Downloading https://files.pythonhosted.org/packages/25/08/45e02aac4dea0a120c3ab7f537cf4fcb37b5a45a7b5bece825aa432f3ad3/awscli-1.16.84-py2.py3-none-any.whl (1.4MB)
    100% |████████████████████████████████| 1.4MB 631kB/s
Collecting docutils>=0.10 (from awscli)
  Downloading https://files.pythonhosted.org/packages/50/09/c53398e0005b11f7ffb27b7aa720c617aba53be4fb4f4f3f06b9b5c60f28/docutils-0.14-py2-none-any.whl (543kB)
    100% |████████████████████████████████| 552kB 1.5MB/s
Collecting botocore==1.12.74 (from awscli)
  Downloading https://files.pythonhosted.org/packages/4c/52/b5264c71ebfc037a1edb234beafc15f20c83cf53466fe094a77d34625008/botocore-1.12.74-py2.py3-none-any.whl (5.2MB)
    100% |████████████████████████████████| 5.2MB 589kB/s
Collecting PyYAML<=3.13,>=3.10 (from awscli)
  Downloading https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz (270kB)
    100% |████████████████████████████████| 276kB 1.5MB/s
Collecting s3transfer<0.2.0,>=0.1.12 (from awscli)
  Downloading https://files.pythonhosted.org/packages/d7/14/2a0004d487464d120c9fb85313a75cd3d71a7506955be458eebfe19a6b1d/s3transfer-0.1.13-py2.py3-none-any.whl (59kB)
    100% |████████████████████████████████| 61kB 1.5MB/s
Collecting rsa<=3.5.0,>=3.1.2 (from awscli)
  Downloading https://files.pythonhosted.org/packages/e1/ae/baedc9cb175552e95f3395c43055a6a5e125ae4d48a1d7a924baca83e92e/rsa-3.4.2-py2.py3-none-any.whl (46kB)
    100% |████████████████████████████████| 51kB 1.7MB/s
Collecting colorama<=0.3.9,>=0.2.5 (from awscli)
  Downloading https://files.pythonhosted.org/packages/db/c8/7dcf9dbcb22429512708fe3a547f8b6101c0d02137acbd892505aee57adf/colorama-0.3.9-py2.py3-none-any.whl
Collecting urllib3<1.25,>=1.20; python_version == "2.7" (from botocore==1.12.74->awscli)
  Downloading https://files.pythonhosted.org/packages/62/00/ee1d7de624db8ba7090d1226aebefab96a2c71cd5cfa7629d6ad3f61b79e/urllib3-1.24.1-py2.py3-none-any.whl (118kB)
    100% |████████████████████████████████| 122kB 1.7MB/s
Collecting jmespath<1.0.0,>=0.7.1 (from botocore==1.12.74->awscli)
  Downloading https://files.pythonhosted.org/packages/b7/31/05c8d001f7f87f0f07289a5fc0fc3832e9a57f2dbd4d3b0fee70e0d51365/jmespath-0.9.3-py2.py3-none-any.whl
Collecting python-dateutil<3.0.0,>=2.1; python_version >= "2.7" (from botocore==1.12.74->awscli)
  Downloading https://files.pythonhosted.org/packages/74/68/d87d9b36af36f44254a8d512cbfc48369103a3b9e474be9bdfe536abfc45/python_dateutil-2.7.5-py2.py3-none-any.whl (225kB)
    100% |████████████████████████████████| 235kB 1.9MB/s
Collecting futures<4.0.0,>=2.2.0; python_version == "2.6" or python_version == "2.7" (from s3transfer<0.2.0,>=0.1.12->awscli)
  Downloading https://files.pythonhosted.org/packages/2d/99/b2c4e9d5a30f6471e410a146232b4118e697fa3ffc06d6a65efde84debd0/futures-3.2.0-py2-none-any.whl
Collecting pyasn1>=0.1.3 (from rsa<=3.5.0,>=3.1.2->awscli)
  Downloading https://files.pythonhosted.org/packages/7b/7c/c9386b82a25115cccf1903441bba3cbadcfae7b678a20167347fa8ded34c/pyasn1-0.4.5-py2.py3-none-any.whl (73kB)
    100% |████████████████████████████████| 81kB 2.0MB/s
Collecting six>=1.5 (from python-dateutil<3.0.0,>=2.1; python_version >= "2.7"->botocore==1.12.74->awscli)
  Downloading https://files.pythonhosted.org/packages/73/fb/00a976f728d0d1fecfe898238ce23f502a721c0ac0ecfedb80e0d88c64e9/six-1.12.0-py2.py3-none-any.whl
Building wheels for collected packages: PyYAML
  Running setup.py bdist_wheel for PyYAML ... done
  Stored in directory: /root/.cache/pip/wheels/ad/da/0c/74eb680767247273e2cf2723482cb9c924fe70af57c334513f
Successfully built PyYAML
Installing collected packages: docutils, urllib3, jmespath, six, python-dateutil, botocore, PyYAML, futures, s3transfer, pyasn1, rsa, colorama, awscli
Successfully installed PyYAML-3.13 awscli-1.16.84 botocore-1.12.74 colorama-0.3.9 docutils-0.14 futures-3.2.0 jmespath-0.9.3 pyasn1-0.4.5 python-dateutil-2.7.5 rsa-3.4.2 s3transfer-0.1.13 six-1.12.0 urllib3-1.24.1
````
</p></details>

### Option (2) install and setup the aswcli tool for Access/secret credential storage with APT
(Keep your keys outside of your code and not in Github!)
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

**By running "terraform apply", AWS will charge you for what you build**
If in doubt, ask someone and don't do it.
````
# terraform init
# terraform plan
# terraform apply
````

If you get any errors, see if you've made a typo or let me know by raising an issue.

# Future improvements:

1) Currently the code will only allow one ec2 instance type (operating system) per size of instance. It may be eaiser to just refactor the module and create more for specific operating systems (so Ubunutu and Red Hat have there own module) or just reference an AMI variable pointing to a different OS.
2) Make the ingress ports into an array so they are dynamic based on variables for each ec2 instance type. At the moment you need to add them all individually but an array would be nicer.

