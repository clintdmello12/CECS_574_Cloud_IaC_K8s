output "public_sg_id" {
  value = aws_security_group.public_ec2_sg.id
}
output "private_sg_id" {
  value = aws_security_group.private_ec2_sg.id
}
output "vpc_id" {
  value = aws_vpc.my-project.id
}
output "public_subnet" {
  value = aws_subnet.public1.id
}
output "public_subnet2" {
  value = aws_subnet.public2.id
}
output "public_subnet3" {
  value = aws_subnet.public3.id
}
output "private_subnet" {
  value = aws_subnet.private1.id
}
output "private_subnet2" {
  value = aws_subnet.private2.id
}
output "private_subnet3" {
  value = aws_subnet.private3.id
}
output "private_nacl_id" {
  value = aws_network_acl.private_nacl.id
}