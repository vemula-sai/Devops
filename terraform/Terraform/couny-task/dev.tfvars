vpc-details = {
  cidr_block = ["192.168.0.0/16", "172.16.0.0/16"]
  name = ["terraform-vpc1", "terraform-vpc2"]
}
subnet-details = {
  cidr_block = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
  name = ["first-sub", "second-sub", "third-sub", "fourth-sub"]
}