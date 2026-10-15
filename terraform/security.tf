resource "aws-security-group" "gym-tracker-sg" {
  name        = "${var.project-name}-sg"
  description = "Security group for the gym progress tracker application"
  vpc_id      = aws-vpc.gym-tracker-vpc.id

  tags = {
    Name = "${var.project-name}-sg"
  }
}

resource "aws-security-group_rule" "allow-ssh" {
  security_group_id = aws-security-group.gym-tracker-sg.id
  description      = "SSH from administrator IP only"

  ip-protocol = "tcp"
  from_port   = var.ssh-port
  to_port     = var.ssh-port
  cidr_blocks = [var.ssh-allowed-cidr]  
}

resource "aws-security-group_rule" "allow-http" {
  security_group_id = aws-security-group.gym-tracker-sg.id
  description      = "Allow HTTP traffic"

  ip-protocol = "tcp"
  from_port   = var.http-port
  to_port     = var.http-port
  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws-security-group_rule" "allow-https" {
  security_group_id = aws-security-group.gym-tracker-sg.id
  description      = "Allow HTTPS traffic"

  ip-protocol = "tcp"
  from_port   = var.https-port
  to_port     = var.https-port
  cidr_ipv4= "0.0.0.0/0"
}

resource "aws-vpc-security-group-ingress-rule" "https" {
  security_group_id = aws-security-group.gym-tracker-sg.id
  description      = "Allow web traffic"

  ip_protocol = "tcp"
  from_port   = var.https-port
  to_port     = var.https-port
  cidr_blocks = "0.0.0.0/0"
}

resource "aws-vpc-security-group-egress-rule" "outbound" {
  security_group_id = aws-security-group.gym-tracker-sg.id
  description      = "Allow outbound traffic"

  ip_protocol = "-1"
  cidr-ipv4 = "0.0.0.0/0"

}