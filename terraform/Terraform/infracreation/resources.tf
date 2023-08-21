# vpc
resource "aws_vpc" "infra-vpc" {
  cidr_block = var.vpc-details.cidr_block
  tags = {
    Name = var.vpc-details.name
  }

}

# internet gateway

resource "aws_internet_gateway" "infra-gateway" {
  vpc_id = aws_vpc.infra-vpc.id
  tags = {
    Name = var.gateway-details.name
  }

}



# route table 

resource "aws_route_table" "infra-route-table" {
  vpc_id = aws_vpc.infra-vpc.id
  tags = {
    Name = var.infra-route.name
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

# subnet association with route table

resource "aws_route_table_association" "infra-subnet-route" {
  subnet_id      = aws_subnet.infra-publicsubnet[0].id
  route_table_id = aws_route_table.infra-route-table.id


}
# routes

resource "aws_route" "infra-route-igw" {
  route_table_id         = aws_route_table.infra-route-table.id
  gateway_id             = aws_internet_gateway.infra-gateway.id
  destination_cidr_block = "0.0.0.0/0"

}

# secuity groups for infra instance

resource "aws_security_group" "infra-security-group" {
  name        = "infrasecuritygroup"
  description = "this is security group for instance"
  vpc_id      = aws_vpc.infra-vpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "this is 80 port for instance"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "this is 22 port for instance"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "infra-security-group"
  }

}

# instance 

resource "aws_instance" "infra-instance" {
  ami                         = var.instance-details.ami
  associate_public_ip_address = var.instance-details.associate_public_ip_address
  subnet_id                   = aws_subnet.infra-publicsubnet[0].id
  instance_type               = var.instance-details.instance_type
  key_name                    = "my_key_pair"
  vpc_security_group_ids      = [aws_security_group.infra-security-group.id]
  tags = {
    Name = "infra-instance"
  }
  depends_on = [
    aws_vpc.infra-vpc,
    aws_subnet.infra-publicsubnet
  ]
}

# null resource

resource "null_resource" "infra-null" {
  triggers = {
    version = var.null-details
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.infra-instance.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install apache2 -y",
      "sudo touch main.txt"
    ]
  }

}
