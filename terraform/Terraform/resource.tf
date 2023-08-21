resource "aws_vpc" "dockervpc" {
  cidr_block = var.vpc-cidr
  tags = {

    Name = var.vpc-name
  }
}

resource "aws_subnet" "first-subnet" {
  vpc_id     = aws_vpc.dockervpc.id
  cidr_block = var.subnet1-cidr
  tags = {
    Name = var.subnet1-name
  }

}


resource "aws_subnet" "second-subnet" {
  vpc_id     = aws_vpc.dockervpc.id
  cidr_block = var.subnet2-cidr
  tags = {
    Name = var.subnet2-name
  }

}
