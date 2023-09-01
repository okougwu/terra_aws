#create resource for Development Environment

module "dev-vpc" {
    source = "../Modules/VPC"

    ENVIRONMENT = var.Env
    AWS_REGION = var.AWS_REGION  
}

module "prod-instances" {
    source = "../Modules/instances"

    ENVIRONMENT    = var.Env
    AWS_REGION     = var.AWS_REGION
    VPC_ID         = module.prod-vpc.my_vpc_id
    PUBLIC_SUBNETS = module.prod-vpc.public_subnets
}

provider "aws" {
    region = var.AWS_REGION
    profile = "okougwu"  
}