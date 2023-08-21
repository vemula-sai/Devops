variable "region-details" {
  type        = string
  description = "this is region details for ohio region"
  default     = "us-east-1"

}

variable "vpc-cidr" {
  type        = string
  description = "this is vpc cidr block"
  default     = "192.168.0.0/16"

}

variable "vpc-name" {
  type        = string
  default     = "dockerterraform"
  description = "this is vpc name"

}

variable "subnet1-name" {
  type        = string
  description = "this is subnet one name"
  default     = "first-subnet"

}

variable "subnet1-cidr" {
  type = string
  default = "192.168.0.0/24"
  description = "this is subnet one cidr"
  
}

variable "subnet2-cidr" {
  type = string
  default = "192.168.1.0/24"
  description = "this is subnet two cidr"
  
}

variable "subnet2-name" {
  type        = string
  description = "this is subnet one name"
  default     = "second-subnet"

}


