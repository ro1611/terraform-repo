output "public_ip" {
  value = aws_instance.demo-instance.public_ip
}

output "cidr" {
  value = aws_vpc.demo-vpc.cidr_block
}

output "subnet" {
  value = aws_subnet.public-subnet.cidr_block
}