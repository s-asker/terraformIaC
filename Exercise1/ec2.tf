provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "ec2_trial" {
  ami                    = "ami-09da212cf18033880"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-2a"
  key_name               = "ansiblekey"
  vpc_security_group_ids = ["sg-0b9705c8926a67395"]
  tags = {
    Name    = "Trial-Instance"
    Project = "Trial"
  }
}