resource "tls_private_key" "ec2_private_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "ec2_key_generated" {
  key_name   = "${var.vpc_name}-key-generated"
  public_key = tls_private_key.ec2_private_key.public_key_openssh
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "public_ec2" {
  count         = var.instance_count
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_ids[0]
  key_name               = aws_key_pair.ec2_key_generated.key_name
  vpc_security_group_ids = [var.public_sg_id]

  tags = {
    Name = "public-ec2-instance"
  }
}
