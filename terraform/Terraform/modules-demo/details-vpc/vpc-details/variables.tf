
variable "vpc-details" {
  type = object({
    cidr_block = string
    name       = string
  })
  default = {
    cidr_block = "192.168.0.0/16"
    name       = "infra-vpc"
  }

}

variable "subnet-details" {
  type = object({
    cidr_block = list(string)
    name       = list(string)
  })
  default = {
    cidr_block = ["192.168.0.0/24", "192.168.1.0/24"]
    name       = ["infra-publicsubnet", "infra-privatesubnet"]
  }

}