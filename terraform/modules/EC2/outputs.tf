############ EC2 ###############################
output "ip_ubuntu" {
    value = aws_instance.ubuntu.public_ip
}

############ KEY_PAIR ##########################
output "key_pair" {
  value = aws_key_pair.mytfkey.key_name
}