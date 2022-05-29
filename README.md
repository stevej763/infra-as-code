## Infrastructure as code learning repo

Repo to keep track of the culmination of some course I have been doing.

Relatively simple in the grand scheme of things, but very happy to have it working after getting over the inital learning curve.

## Output

Running this set of terraform opertations will deploy two EC2 instances along with some basic security groups.

As part of the delopyment I have integrated Ansible to wait for the deployments to finish before updating any packages and install a webserver.

### Instance-1

Apache webserver running on Amazon-Linux-2 instance

### Instance-2

Nginx webserver running on Unbuntu instance

# What I want to add next

- I want to implement the network infrastucture correctly as I just threw some very basic resource in on the default AWS VPC.
- Refactor the folder structure, put files in some sensible folders
- Use this as a template to build a load-balanced NodeJs web app, using HaProxy or Nginx as the load-balancer, all configured through Terraform/Ansible
- Set up a Kubernetes cluster through Terraform
- Integrate this kind of IAC operation with a Jenkins deployment pipeline to deploy code once a test pipeline has passed.
