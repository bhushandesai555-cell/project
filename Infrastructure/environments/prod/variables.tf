variable "project_name" {
  description = "Project name"
  type        = string
  default     = "production-app"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "ami_id" {
  description = "AMI ID for instances"
  type        = string
  default     = "ami-0c02fb55956c7d316"
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Key pair name"
  type        = string
}

variable "desired_capacity" {
  description = "ASG desired capacity"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "ASG maximum size"
  type        = number
  default     = 4
}

variable "min_size" {
  description = "ASG minimum size"
  type        = number
  default     = 1
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "productiondb"
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "DB instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "DB allocated storage"
  type        = number
  default     = 20
}

variable "db_multi_az" {
  description = "DB Multi-AZ deployment"
  type        = bool
  default     = false
}