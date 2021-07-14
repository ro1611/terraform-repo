resource "aws_instance" "demo-instance" {
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${aws_subnet.public-subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.demo-sg.id}"]
  key_name               = "terraform"

  tags = {
    Name        = "Demo-Instance"
    Environment = terraform.workspace
  }

  provisioner "remote-exec" {
    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./terraform.pem")
    }

    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo yum -y install nginx",
      "sudo systemctl start nginx",
    ]
  }
}