data "aws-ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-20.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "gym-tracker-instance" {
  ami                         = data.aws-ami.ubuntu.id
  instance_type               = var.ec2-instance-type
  key_name                    = var.ec2-key-name
  subnet_id                   = aws-subnet.gym-tracker-subnet.id
  security_groups             = [aws-security-group.gym-tracker-sg.id]
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.gym-tracker-instance-profile.name

  tags = {
    Name = "${var.project-name}-instance"
  }
}