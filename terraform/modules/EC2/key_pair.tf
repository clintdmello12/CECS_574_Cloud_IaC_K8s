resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "mytfkey" {
  key_name = var.key_pair_name
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "local_file" "ssh_key" {
  content = tls_private_key.rsa.private_key_pem
  filename = "${var.key_pair_name}.pem"
}