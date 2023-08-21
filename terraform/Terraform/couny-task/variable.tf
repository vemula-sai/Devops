variable "vpc-details" {
  type = object({
    name       = list(string)
    cidr_block = list(string)
  })
  default = {
    name       = ["terraform-vpc1", "terraform-vpc2"]
    cidr_block = ["192.168.0.0/16", "172.16.0.0/16"]
  }

}

variable "subnet-details" {
  type = object({
    name = list(string)

  })
  default = {
    name = ["first-sub", "second-sub", "third-sub", "fourth-sub"]

  }

}

