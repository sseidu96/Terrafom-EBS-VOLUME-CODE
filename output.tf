output "public-ip" {
  value = aws_instance.server3.public_ip
}

output "az" {
  value = aws_instance.server3.availability_zone
}

output "private-ip" {
  value = aws_instance.server3.private_ip
}

output "ssh-command" {
  value = "ssh -i ~/Downloads/ssh-key.pem ec2-user@${aws_instance.server3.public_ip}"
}