access_key    = "XXXXXXXXXX"
secret_key    = "XXXXXXXXXX"
region        = "us-east-1"
cidr_block    = "10.0.0.0/16"
ami           = "ami-0ab4d1e9cf9a1215a"
instance_type = "t2.micro"

sg_ingress_rules = {
  "1" = {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },

  "2" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  "3" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  "4" = {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

sg_egress_rules = {
  "1" = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  },

  "2" = {
    from_port   = 8446
    to_port     = 8446
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  "3" = {
    from_port   = 2022
    to_port     = 2022
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



