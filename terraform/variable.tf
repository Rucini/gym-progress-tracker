variable "aws-region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "eu-north-1"
}

variable "project-name" {
  description = "The name prefix for the capstone resources"
  type        = string
  default     = "gym-progress-tracker"
}

variable "vpc-cider" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public-subnet-cider" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "ssh-allowed-cidr" {
  description = "my IP address to allow SSH access to the EC2 instance"
  type        = string

  validation {
    condition     = can(cidernetmask(var.ssh-allowed-cidr))
    error_message = "The ssh-allowed-cidr must be a valid CIDR block (e.g., 192.168.1.0/24)"
  }
}

variable "http-port" {
  description = "HTTP port"
  type        = number
  default     = 80
}

variable "https-port" {
  description = "HTTPS port"
  type        = number
  default     = 443
}

variable "ssh-port" {
  description = "SSH port"
  type        = number
  default     = 22
}

variable "ec2-instance-type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ec2-key-name" {
  description = "The name of the EC2 key pair to use for SSH access"
  type        = string
}

variable "application-bucket-name" {
  description = "The name of the S3 bucket to store application data"
  type        = string
}

variable "availability-zone" {
  description = "The availability zone for the subnet"
  type        = string
  default     = "eu-north-1a"
}