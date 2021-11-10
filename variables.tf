variable "instance_type" {
  type        = string
  description = "EC2 instance size"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where the EC2 is deployed"
}

variable "ssh_ip" {
  type        = string
  description = "IP with CIDR block to allow SSH access from e.g. 123.456.78.910/32"
}

variable "public_key" {
  type        = string
  description = "Public key for SSH access"
}

variable "ami_id" {
  type        = string
  description = "ID of the AMI the EC2 uses (it defaults to an Amazon Linux 2 x86_64 in us-east-1)"
  default     = "ami-01cc34ab2709337aa"
}
