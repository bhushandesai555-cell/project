variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security Group ID for instances"
  type        = string
}

variable "alb_security_group_id" {
  description = "Security Group ID for ALB"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-0c02fb55956c7d316" # Amazon Linux 2
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