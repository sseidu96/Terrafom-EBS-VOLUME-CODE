resource "aws_instance" "server3" {
  ami           = "ami-0332d564d76dbd8d6"
  instance_type = "t3.micro"

  security_groups = ["app-sg"]
  key_name        = "ssh-key"

  tags = {
    Name = "Terraform server"
    Team = "Devops"
    env  = "Dev"
  }

  user_data = file("install.sh")
}

resource "aws_ebs_volume" "volume1" {
  availability_zone = aws_instance.server3.availability_zone
  size              = 10

  tags = {
    Name       = "Terraform volume"
    Team       = "Cloud"
    Created_by = "AWS"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.volume1.id
  instance_id = aws_instance.server3.id
}