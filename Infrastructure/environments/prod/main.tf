terraform {
  backend "s3" {
    bucket = "my-company-terraform-state-prod"
    key    = "production/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = "production"
      ManagedBy   = "terraform"
    }
  }
}

# NETWORKING MODULE
module "networking" {
  source = "../../modules/networking"

  project_name        = var.project_name
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones  = var.availability_zones
}

# SECURITY MODULE
module "security" {
  source = "../../modules/security"

  project_name = var.project_name
  vpc_id       = module.networking.vpc_id
}

# COMPUTE MODULE
module "compute" {
  source = "../../modules/compute"

  project_name           = var.project_name
  subnet_ids            = module.networking.public_subnet_ids
  security_group_id     = module.security.web_sg_id
  alb_security_group_id = module.security.alb_sg_id
  vpc_id                = module.networking.vpc_id
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  key_name              = var.key_name
  desired_capacity      = var.desired_capacity
  max_size              = var.max_size
  min_size              = var.min_size
}

# DATABASE MODULE
module "database" {
  source = "../../modules/database"

  project_name      = var.project_name
  subnet_ids        = module.networking.private_subnet_ids
  security_group_id = module.security.db_sg_id
  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  instance_class    = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  multi_az          = var.db_multi_az
}