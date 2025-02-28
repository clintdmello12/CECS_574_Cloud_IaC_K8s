resource "aws_instance" "ubuntu" {
  ami = var.ami_id
  instance_type = var.ec2_instance_type
  key_name = aws_key_pair.mytfkey.key_name
  vpc_security_group_ids = [var.public_sg_module]
  subnet_id = var.public_subnet_id
  provisioner "file" {
    source = var.file_name
    destination = var.file_name
  }
  provisioner "remote-exec" {
    inline = [ 
      "chmod +x ${var.file_name}",
      "./${var.file_name}"
     ]
  }
  connection {
    host = self.public_ip
    user = var.ec2_user
    type = "ssh"
    private_key = file(local_file.ssh_key.filename)
  }
  tags = {
    Name = "${var.vpc_name}-${var.ec2_user}"
    Terraform = "True"
  }
} 


resource "aws_route53_record" "ec2_domain" {
  zone_id = var.domain_zone_id
  name    = "application.${var.domain}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.ubuntu.public_ip]
}