resource "aws_key_pair" "mykp1" {
  key_name   = "mykp1"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "my_instance" {
  ami                    = var.AMIS["amazon-linux"]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.my_pub_subnet_1.id
  key_name               = aws_key_pair.mykp1.key_name
  vpc_security_group_ids = [aws_security_group.my_stack_sg.id]
  tags = {
    Name = "my-ec2- instance"
  }
}

resource "aws_ebs_volume" "vol_4_ec2" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    Name = "extra-vol-4"
  }
}

resource "aws_volume_attachment" "atch_vol_4" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4_ec2.id
  instance_id = aws_instance.my_instance.id
}

output "PublicIP" {
  value = aws_instance.my_instance.public_ip
}