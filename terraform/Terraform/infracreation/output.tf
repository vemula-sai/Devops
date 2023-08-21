output "region-name" {
  value = var.region
}

output "vpc-id" {
  value = aws_vpc.infra-vpc.id
}

output "vpc-name" {
  value = aws_vpc.infra-vpc.tags
}

output "intergateway-id" {
  value = aws_internet_gateway.infra-gateway.id

}
output "intergateway-name" {
  value = aws_internet_gateway.infra-gateway.tags
  
}
output "route-table-id" {
  value = aws_route_table.infra-route-table.id
  
}
output "route-table-name" {
  value = aws_route_table.infra-route-table.tags
  
}
output "publicsubnet" {
  value = aws_subnet.infra-publicsubnet[0].id
  
}
output "publicsubnet-name" {
  value = aws_subnet.infra-publicsubnet[0].tags
  
}
output "privatesubnet" {
  value = aws_subnet.infra-publicsubnet[1].id
  
}
output "privatesubnet-name" {
  value = aws_subnet.infra-publicsubnet[1].tags
  
}

