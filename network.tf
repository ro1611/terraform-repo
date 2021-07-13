#VPC
resource "aws_vpc" "demo-vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = "Demo VPC"
    Environment = terraform.workspace
  }

  provisioner "local-exec" {
    command = "echo ${aws_vpc.demo-vpc.cidr_block} >> cidr_block.txt"
  }
}


#Public Subnet
resource "aws_subnet" "public-subnet" {
  vpc_id     = "${aws_vpc.demo-vpc.id}"
  cidr_block = "10.0.10.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet"
    Environment = terraform.workspace
  }
}

#Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.demo-vpc.id}"

  tags = {
    Name = "Public-IGW"
    Environment = terraform.workspace
  }
}

#Route Table
resource "aws_route_table" "PublicRT" {
  vpc_id = "${aws_vpc.demo-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "Public-RT"
    Environment = terraform.workspace
  }
}

#Route Table association with Public Subnet
resource "aws_route_table_association" "public_RT_association" {
  subnet_id      = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.PublicRT.id}"
}
