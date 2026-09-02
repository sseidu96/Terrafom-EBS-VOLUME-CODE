# Generates a secure private key and encodes it as PEM
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create the AWS EC2 Key Pair
resource "aws_key_pair" "ec2_key" {
  key_name   = "bash_key"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

# Save private key file
resource "local_file" "ssh_key" {
  filename        = "bash-key.pem"
  content         = tls_private_key.ec2_key.private_key_pem
  file_permission = "0600"
}