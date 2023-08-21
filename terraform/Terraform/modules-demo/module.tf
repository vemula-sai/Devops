module "infra-vpc-subnets" {
  source = "./details-vpc/vpc-details"
  vpc-details = {
    cidr_block = "192.168.0.0/16"
    name       = "main-vpc-module"
  }
  subnet-details = {
    cidr_block = ["192.168.0.0/24", "192.168.1.0/24"]
    name       = ["infra-publicsubnet", "infra-privatesubnet"]

  }

}
