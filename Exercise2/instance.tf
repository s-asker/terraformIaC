resource "aws_instance" "trial"{
    ami = var.AMIS[var.REGION]
    instance_type = "t2.micro"
    availability_zone = var.ZONE1
    key_name = "ansiblekey"
    vpc_security_group_ids = ["sg-0b9705c8926a67395"]
    tags = {
        Name = "TryingTerra"
        Project = "Dummy"
    }
}