data "aws_vpc" "main" {
  id = var.vpc_id
}

data "aws_subnet" "az-a" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }
  filter {
    name   = "tag:az"
    values = ["a"]
  }
}

resource "aws_key_pair" "ssh" {
  key_name   = "ssh-${local.name}-key"
  public_key = var.public_key
}

data "template_file" "user_data" {
  template = file("${abspath(path.module)}/userdata.yml")
}

resource "aws_instance" "luigi-test" {
  ami                    = var.ami_id
  subnet_id              = data.aws_subnet.az-a.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.ssh.key_name
  vpc_security_group_ids = [aws_security_group.sg_http_ssh.id]
  user_data              = data.template_file.user_data.rendered

  tags = local.tags
}
