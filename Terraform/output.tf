output "iam_user_name" {
  value = module.iam.user_name
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "alb_dns_name" {
  value = module.autoscaling.alb_dns_name
}
