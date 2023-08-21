resource "aws_vpc" "taint-untiant-task" {
    cidr_block = "192.168.0.0/16"
    tags = {
      Name = local.vpcman
    }
  
}

resource "aws_subnet" "subnet-task-1" {
    vpc_id = local.superman
    cidr_block = "192.168.0.0/24"
    tags = {
        Name = "subnet-taint"
    }
  
}