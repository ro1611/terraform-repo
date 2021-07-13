# resource "aws_security_group" "demo-sg" {
#   name = "sg_22"
#   vpc_id = "${aws_vpc.demo-vpc.id}"

#   ingress {
#       from_port   = 22
#       to_port     = 22
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#       from_port   = 80
#       to_port     = 80
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 65535
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "Demo SG"
#     Environment = terraform.workspace
#   }
# }

resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "Ingress and Egress Rules"
  vpc_id = "${aws_vpc.demo-vpc.id}"

  dynamic "ingress" {
    for_each = var.sg_ingress_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.sg_egress_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "Demo SG"
    Environment = terraform.workspace
  }
}



