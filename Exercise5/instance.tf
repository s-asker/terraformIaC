resource "aws_key_pair" "trialkp" {
  key_name   = "trialkey"
  public_key = file("trialkey.pub")
}

resource "aws_instance" "instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  vpc_security_group_ids = ["sg-0b9705c8926a67395"]
  key_name               = aws_key_pair.trialkp.key_name
  tags = {
    Name    = "Instance"
    Project = "Dummy"
  }

  provisioner "file" {

    source      = "web.sh"
    destination = "/tmp/web.sh"

  }
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("trialkey")
    host        = self.public_ip
  }
}
output "PublicIP" {
  value = aws_instance.instance.public_ip
}

output "PrivateIP" {
  value = aws_instance.instance.private_ip
}

