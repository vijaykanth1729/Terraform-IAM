# Terraform-IAM

Dealing with IAM resources in AWS using Terraform.

## 1. Understanding Key Terraform AWS IAM Resources

Here are the primary resources used for IAM management in Terraform:

| Terraform Resource                  | Purpose                                                      |
|--------------------------------------|--------------------------------------------------------------|
| `aws_iam_role`                       | **Creates an IAM role**                                      |
| `aws_iam_policy`                     | **Creates a standalone IAM policy**                         |
| `aws_iam_policy_document`            | **Defines an inline JSON policy (can be used in roles or policies)** |
| `aws_iam_role_policy_attachment`     | **Attaches an AWS-managed or customer-managed policy to a role** |
| `aws_iam_user`                       | **Creates an IAM user**                                      |
| `aws_iam_group`                      | **Creates an IAM group**                                     |
| `aws_iam_user_policy_attachment`     | **Attaches a policy to a user**                             |
| `aws_iam_group_policy_attachment`    | **Attaches a policy to a group**                            |
