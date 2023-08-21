variable "region" {
  type        = string
  default     = "us-east-1"
  description = "this is region for terraform creation"

}

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

variable "gateway-details" {
  type = object({
    name = string
  })
  default = {
    name = "infra-gateway"
  }

}

variable "infra-route" {
  type = object({
    name = string
  })
  default = {
    name = "infra-route"
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

variable "instance-details" {
  type = object({
    ami                         = string
    associate_public_ip_address = bool
    instance_type               = string



  })
  default = {
    ami                         = "ami-053b0d53c279acc90"
    associate_public_ip_address = true
    instance_type               = "t2.micro"

  }

}

variable "null-details" {
  type = string
  default = "1.0"
  
}

