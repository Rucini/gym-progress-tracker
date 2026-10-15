output "vpc-id" {
  value = aws-vpc.gym-tracker-vpc.id
}

output "subnet-id" {
  value = aws-subnet.gym-tracker-subnet.id
}

output "internet-gateway-id" {
  value = aws-internet_gateway.gym-tracker-igw.id
}

output "route-table-id" {
  value = aws-route-table.gym-tracker-rt.id
}

output "security-group-id" {
  value = aws-security-group.gym-tracker-sg.id
}


output "ec2-instance-public-ip" {
  value = aws_instance.gym-tracker-instance.public_ip
}

output "ec2-instance-public-dns" {
  value = aws_instance.gym-tracker-instance.public_dns
}

output "application-s3-bucket-name" {
  value = aws_s3_bucket.application-bucket.bucket
}
