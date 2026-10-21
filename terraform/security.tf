resource "aws_security_group" "gym-tracker-sg" {
  name        = "${var.project-name}-sg"
  description = "Security group for the gym progress tracker application"
  vpc_id      = aws_vpc.gym-tracker-vpc.id

  tags = {
    Name = "${var.project-name}-sg"
  }
}

resource "aws_security_group_rule" "allow-ssh" {
  type              = "ingress"
  security_group_id = aws_security_group.gym-tracker-sg.id
  description       = "SSH from administrator IP only"
  protocol          = "tcp"
  from_port         = var.ssh-port
  to_port           = var.ssh-port
  cidr_blocks       = ["${trimspace(data.http.my_public_ip.response_body)}/32"]
}

resource "aws_security_group_rule" "allow-http" {
  type              = "ingress"
  security_group_id = aws_security_group.gym-tracker-sg.id
  description       = "Allow HTTP traffic"

  protocol    = "tcp"
  from_port   = var.http-port
  to_port     = var.http-port
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow-https" {
  type              = "ingress"
  security_group_id = aws_security_group.gym-tracker-sg.id
  description       = "Allow HTTPS traffic"

  protocol    = "tcp"
  from_port   = var.https-port
  to_port     = var.https-port
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.gym-tracker-sg.id
  description       = "Allow web traffic"

  ip_protocol = "tcp"
  from_port   = var.https-port
  to_port     = var.https-port
  cidr_ipv4   = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "outbound" {
  security_group_id = aws_security_group.gym-tracker-sg.id
  description       = "Allow outbound traffic"

  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"

}