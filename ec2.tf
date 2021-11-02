data "aws_vpc" "main" {
  id = var.vpc_id
}

data "aws_subnet_ids" "subnet_ids" {
  vpc_id = data.aws_vpc.main.id
}

resource "aws_key_pair" "ssh" {
  key_name   = "ssh-${local.name}-key"
  public_key = var.public_key
}

data "template_file" "user_data" {
  template = file("${abspath(path.module)}/userdata.yaml")
}

data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "luigi-test" {
  ami                    = data.aws_ami.amazon-linux-2.id
  subnet_id              = tolist(data.aws_subnet_ids.subnet_ids.ids)[0]
  instance_type          = var.instance_type
  key_name               = aws_key_pair.ssh.key_name
  vpc_security_group_ids = [aws_security_group.sg_http_ssh.id]
  user_data              = data.template_file.user_data.rendered

  tags = local.tags
}
