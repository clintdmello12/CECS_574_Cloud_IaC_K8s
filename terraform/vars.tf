variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "REGION" {}



############### SERVERS ##########################################
variable "AMI_ID" {
  type = map(string)
  default = {
    us-east-1 = "ami-0fc5d935ebf8bc3bc"
    us-east-2 = "ami-0e83be366243f524a"
  }
}
variable "EC2_INSTANCE_TYPE" {}
variable "FILE_NAME" {}
variable "EC2_USER" {}
variable "KEY_PAIR_NAME" {}



############### AWS_ACM_CERTIFICATE ##########################
variable "DOMAIN" {}
variable "ALTERNATIVE_DNS" {}



#################### VPC ##########################
variable "VPC_CIDR_BLOCKS" {}
variable "VPC_NAME" {}
variable "PUBLIC1_CIDR" {}
variable "PRIVATE1_CIDR" {}
variable "PUBLIC2_CIDR" {}
variable "PRIVATE2_CIDR" {}
variable "PUBLIC3_CIDR" {}
variable "PRIVATE3_CIDR" {}
variable "PUBLIC_SECURITY_GROUP_NAME" {}
variable "PRIVATE_SECURITY_GROUP_NAME" {}
variable "SG_CIDR_BLOCKS" {}


################### ROUTE53 ##########################
variable "ROUTE53_DOMAIN" {}

############## EKS ###############


################### ECR ##########################
variable "FRONTEND_REPO" {}
variable "BACKEND_REPO" {}