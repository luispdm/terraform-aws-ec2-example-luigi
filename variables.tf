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
