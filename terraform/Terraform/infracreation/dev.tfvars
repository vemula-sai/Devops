region = "us-east-1"
vpc-details = {
  cidr_block = "192.168.0.0/16"
  name       = "infra-vpc"
}
gateway-details = {
  name = "infra-gateway"
}
infra-route = {
  name = "value"
}
subnet-details = {
  cidr_block = ["192.168.0.0/24", "192.168.1.0/24"]
  name       = ["infra-publicsubnet", "infra-privatesubnet"]

}
instance-details = {
  ami                         = "ami-053b0d53c279acc90"
  associate_public_ip_address = true
  instance_type               = "t2.micro"

}
null-details = "1.1"
