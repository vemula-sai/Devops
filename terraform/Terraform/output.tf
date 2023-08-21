output "vpc-id" {
    value = aws_vpc.dockervpc.id
  
}

output "vpc-name" {
    value = aws_vpc.dockervpc.tags
  
}

output "subnet1-cidr" {
    value = aws_subnet.first-subnet.id
  
}

output "subnet2-cidr" {
    value = aws_subnet.second-subnet.id
  
}