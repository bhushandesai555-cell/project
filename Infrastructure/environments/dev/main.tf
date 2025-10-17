terraform {
  backend "s3" {
    bucket = "my-company-terraform-state-dev"
    key    = "development/terraform.tfstate"
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
      Environment = "development"
      ManagedBy   = "terraform"
    }
  }
}

module "networking" {
  source = "../../modules/networking"
  # ... same as prod but with dev variables
}

module "security" {
  source = "../../modules/security"
  # ... same as prod
}

module "compute" {
  source = "../../modules/compute"
  # ... same as prod but with smaller instances
}

module "database" {
  source = "../../modules/database"
  # ... same as prod but with smaller DB
}