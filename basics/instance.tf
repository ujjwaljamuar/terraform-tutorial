resource "aws_instance" "ec2_1" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "tf"
  vpc_security_group_ids = ["sg-0a4c228b488d93f2e"]
  tags = {
    Name    = "tf-instance"
    Project = "tf-tutorial"
  }
}
