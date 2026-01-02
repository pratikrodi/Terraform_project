variable "iam_user_name" {
  default = "terraform-user"
}

variable "iam_role_name" {
  default = "terraform-role"
}

variable "s3_bucket_name" {
  default = "Terra-pract-user-bucket"
}

variable "vpc_id" {}

variable "public_subnets" {
  type = list(string)
}

variable "ami_id" {
  description = "ami-00ca570c1b6d79f36"
}

variable "instance_type" {
  default = "t2.micro"
}
