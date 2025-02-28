module "VPC" {
  source = "./modules/VPC"
  vpc_cidr_blocks = var.VPC_CIDR_BLOCKS
  vpc_name = var.VPC_NAME
  public1_cidr = var.PUBLIC1_CIDR
  private1_cidr = var.PRIVATE1_CIDR
  public2_cidr = var.PUBLIC2_CIDR
  private2_cidr = var.PRIVATE2_CIDR
  public3_cidr = var.PUBLIC3_CIDR
  private3_cidr = var.PRIVATE3_CIDR
  region = var.REGION
  public_security_group_name = var.PUBLIC_SECURITY_GROUP_NAME
  private_security_group_name = var.PRIVATE_SECURITY_GROUP_NAME
  cidr_blocks = var.SG_CIDR_BLOCKS
}



module "certificate" {
  source = "./modules/ACM"
  domain = var.DOMAIN
  alternative_dns = var.ALTERNATIVE_DNS
  domain_zone_id = module.Route53.domain_zone_id
}



module "Servers" {
  source = "./modules/EC2"
  ami_id = var.AMI_ID[var.REGION]
  ec2_instance_type = var.EC2_INSTANCE_TYPE
  key_pair_name = var.KEY_PAIR_NAME
  file_name = var.FILE_NAME
  ec2_user = var.EC2_USER
  public_sg_module = module.VPC.public_sg_id
  private_sg_module = module.VPC.private_sg_id
  public_subnet_id = module.VPC.public_subnet
  private_subnet_id = module.VPC.private_subnet
  domain_zone_id = module.Route53.domain_zone_id
  domain = var.DOMAIN
  vpc_name = var.VPC_NAME
}



module "Route53" {
  source = "./modules/Route53"
  route53_domain = var.DOMAIN
}


module "EKS" {
  source = "./modules/EKS"
  vpc_name = var.VPC_NAME
  vpc_id = module.VPC.vpc_id
  private_subnet = module.VPC.private_subnet
  private_subnet2 = module.VPC.private_subnet2
  private_subnet3 = module.VPC.private_subnet3
  public_subnet = module.VPC.public_subnet
  public_subnet2 = module.VPC.public_subnet2
  public_subnet3 = module.VPC.public_subnet3

}

module "ECR" {
  source = "./modules/ECR"
  frontend_repo = var.FRONTEND_REPO
  backend_repo = var.BACKEND_REPO
}