terraform {
  backend "s3" {
    bucket = "ci-cd-project-terraform-ansible-kubernetes"
    key = "ci/cd-project/state.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}

module "vpc-new" {
   source = "./modules/vpc"
   subnet-cidr-block = var.subnet-cidr-block
   availability_zone = var.availability_zone
   vpc-cidr-blocks = var.vpc-cidr-blocks

 }

 module "ec2" {
    source = "./modules/ec2-ansible"
    image_name = var.image_name
    public_key = var.public_key
    private1_key = var.private1_key
    instance_type = var.instance_type
    security_id = [module.vpc-new.securit-group-id]
    subnet_id = module.vpc-new.subnet_id_number
    availability_zone = var.availability_zone
    subnet_id_2 =  module.vpc-new.subnet_id_number
    security_id2 = [module.vpc-new.securit-group-id]
 }