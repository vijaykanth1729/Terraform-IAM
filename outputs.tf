output "iam_user" {
    value = module.IAM.iam_existing_user
}

output "iam_policy_arn" {
    value = module.IAM.iam_policy_arn
}

output "s3_bucket_arn" {
    value = module.IAM.s3_bucket_arn
}

output "iam_role_arn" {
    value = module.IAM.iam_role_arn
}