resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "Ingress and Egress Rules"
  vpc_id      = "${aws_vpc.demo-vpc.id}"

  dynamic "ingress" {
    for_each = var.sg_ingress_rules
    iterator = port
    content {
      from_port   = port.value.from_port
      to_port     = port.value.to_port
      protocol    = port.value.protocol
      cidr_blocks = port.value.cidr_blocks
      description = port.value.description
    }
  }

  dynamic "egress" {
    for_each = var.sg_egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name        = "Demo SG"
    Environment = terraform.workspace
  }
}



