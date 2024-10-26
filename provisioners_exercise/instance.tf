resource "aws_key_pair" "tf-key" {
  key_name   = "tfkp"
  public_key = file("tf-kp.pub")
}

resource "aws_instance" "ec2-2" {
  ami                    = var.AMIS["amazon-linux"]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.tf-key.key_name
  vpc_security_group_ids = ["sg-0a4c228b488d93f2e"]
  tags = {
    Name    = "ec2-2nd"
    Project = "tutorial"
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
    host        = self.public_ip
    user        = var.USER
    private_key = file("tf-kp")
  }
}

output "PublicIP" {
  value = aws_instance.ec2-2.public_ip
}

output "PrivateIP" {
  value = aws_instance.ec2-2.private_ip
}