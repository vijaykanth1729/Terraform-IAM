# creating IAM user
resource "aws_iam_user" "test" {
  name = "test"
  lifecycle {
    ignore_changes = [name]
  }

}

# creating IAM Group
resource "aws_iam_group" "test_group" {
  name = "test_group"
}

# this is used just to fetch existing user information in the system.
data "aws_iam_user" "sample" {
  user_name = "terraform"
}

# Add a user to specific Group or Groups
resource "aws_iam_user_group_membership" "test_group_membership" {
  groups = [aws_iam_group.test_group.name]
  user   = aws_iam_user.test.name
}

# creating s3 bucket
resource "aws_s3_bucket" "sample_bucket" {
  bucket = "my-sample-test.007"
  lifecycle {
    ignore_changes = [bucket]
  }

}

# creating a policy document in json, it can be added to a policy later
data "aws_iam_policy_document" "s3_read_access" {
  statement {
    sid = "1"
    actions = [
      "s3:GetObject"
    ]
    effect    = "Allow"
    resources = ["arn:aws:s3:::my-sample-test.007/*"]
  }
}

# creating IAM policy, here we can include policy document created above
resource "aws_iam_policy" "s3_policy" {
  name   = "s3_custom_policy"
  policy = data.aws_iam_policy_document.s3_read_access.json

}

# attaching a policy to a user
resource "aws_iam_user_policy_attachment" "s3_attachment" {
  user       = aws_iam_user.test.name
  policy_arn = aws_iam_policy.s3_policy.arn
}


# attaching a policy to group, once the policy attached to group, users belong to group have same permissions
resource "aws_iam_group_policy_attachment" "s3_group_attachment" {
  group      = aws_iam_group.test_group.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

# Creating an assume role as a policy document to trust s3 service.
data "aws_iam_policy_document" "assume_role_policy_for_s3" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
  }
}

# Creating an IAM role, this requires assume role policy (Every role is requires a Trust relationship, so that who can assume this role)
resource "aws_iam_role" "sample_role" {
  name               = "sample_s3_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy_for_s3.json
}

# Adding a policy (In our case reusing existing policy) to a role.
resource "aws_iam_role_policy_attachment" "role_attachment" {
  role       = aws_iam_role.sample_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}