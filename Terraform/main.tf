module "iam" {
  source         = "./modules/iam"
  iam_user_name  = var.iam_user_name
  iam_role_name  = var.iam_role_name
}

module "s3" {
  source          = "./modules/s3"
  bucket_name     = var.s3_bucket_name
  policy_arn      = module.iam.policy_arn
}

module "autoscaling" {
  source         = "./modules/autoscaling"
  vpc_id         = var.vpc_id
  subnets        = var.public_subnets
  ami_id         = var.ami_id
  instance_type  = var.instance_type
}
