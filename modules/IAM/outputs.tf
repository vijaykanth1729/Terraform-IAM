output "iam_existing_user" {
    value = data.aws_iam_user.sample.user_name
}

output "iam_policy_arn" {
    value = aws_iam_policy.s3_policy.arn
}

output "s3_bucket_arn" {
    value = aws_s3_bucket.sample_bucket.arn
}

output "iam_role_arn" {
    value = aws_iam_role.sample_role.arn
}