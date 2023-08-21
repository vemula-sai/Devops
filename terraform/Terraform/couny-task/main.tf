resource "aws_vpc" "first-vpc" {
  count = 2
  cidr_block = var.vpc-details.cidr_block[count.index]
  tags = {
    Name = var.vpc-details.name[count.index]
  }
}

resource "aws_subnet" "taskterraformsubnets" {
  count      = length(var.subnet-details.name)
  vpc_id     = aws_vpc.first-vpc[0].id
  cidr_block = cidrsubnet(var.vpc-details.cidr_block[0], 8, count.index)
  tags = {
    Name = var.subnet-details.name[count.index]
  }
  depends_on = [
    aws_vpc.first-vpc[0]
  ]

}

resource "aws_subnet" "taskterraformsubnets2" {
  count      = length(var.subnet-details.name)
  vpc_id     = aws_vpc.first-vpc[1].id
  cidr_block = cidrsubnet(var.vpc-details.cidr_block[1], 8, count.index)
  tags = {
    Name = var.subnet-details.name[count.index]
  }
  depends_on = [
    aws_vpc.first-vpc[1]
  ]

}