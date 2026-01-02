variable "iam_user_name" {
  default = "terraform-user"
}

variable "iam_role_name" {
  default = "terraform-role"
}

variable "s3_bucket_name" {
  default = "terra-pract-user-bucket"
}

variable "vpc_id" {
  description = "VPC where resources will be created"
  default     = "vpc-070d186a0639513c6"
}

variable "public_subnets" {
  description = "Public subnets for ALB and Auto Scaling"
  type        = list(string)
  default     = [
    "subnet-06600459ef0c92e66",
    "subnet-0b079fb1488cbdda1"
  ]
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  default     = "ami-00ca570c1b6d79f36"
}

variable "instance_type" {
  default = "t2.micro"
}
