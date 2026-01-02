variable "iam_user_name" {
  default = "demo-user"
}

variable "iam_role_name" {
  default = "demo-role"
}

variable "s3_bucket_name" {
  default = "demo-terraform-bucket-12345"
}

variable "vpc_id" {}

variable "public_subnets" {
  type = list(string)
}

variable "ami_id" {
  description = "AMI for EC2"
}

variable "instance_type" {
  default = "t2.micro"
}
