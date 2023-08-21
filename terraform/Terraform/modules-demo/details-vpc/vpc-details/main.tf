# vpc
resource "aws_vpc" "infra-vpc" {
  cidr_block = var.vpc-details.cidr_block
  tags = {
    Name = var.vpc-details.name
  }

}

# subnet creation

resource "aws_subnet" "infra-publicsubnet" {
  count      = length(var.subnet-details.name)
  vpc_id     = aws_vpc.infra-vpc.id
  cidr_block = cidrsubnet(var.vpc-details.cidr_block, 8, count.index)
  tags = {
    Name = var.subnet-details.name[count.index]
  }
  depends_on = [
    aws_vpc.infra-vpc
  ]

}
