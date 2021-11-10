# Terraform aws ec2 example
Terraform Module to provision an EC2 Instance running Apache.

Not intended for production use. Just an example to show how to create and publish a module on the Terraform Registry.

```hcl
terraform {

}

provider "aws" {
  region  = "us-east-1"
}

module "ec2-example-luigi" {
  source        = "luispdm/ec2-example-luigi/aws"
  vpc_id        = "vpc-00000000"
  ssh_ip        = "MY_OWN_IP_ADDRESS/32"
  public_key    = "ssh-rsa XXXXX..."
  instance_type = "t2.micro"
  ami_id        = "my-ami-id"
}

output "public_ip" {
  value = module.ec2-example-luigi.public_ip
}

output "public_dns" {
  value = module.ec2-example-luigi.public_dns
}
```
