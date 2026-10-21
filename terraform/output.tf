output "vpc-id" {
  value = aws_vpc.gym-tracker-vpc.id
}

output "subnet-id" {
  value = aws_subnet.gym-tracker-subnet.id
}

output "internet-gateway-id" {
  value = aws_internet_gateway.gym-tracker-igw.id
}

output "route-table-id" {
  value = aws_route_table.gym-tracker-rt.id
}

output "security-group-id" {
  value = aws_security_group.gym-tracker-sg.id
}


output "ec2_instance_public-ip" {
  value = aws_instance.gym-tracker-instance.public_ip
}

output "ec2_instance_public-dns" {
  value = aws_instance.gym-tracker-instance.public_dns
}

output  "aws_s3_bucket"{
  value = aws_s3_bucket.app-storage.bucket
}
