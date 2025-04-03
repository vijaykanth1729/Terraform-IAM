terraform {
  backend "s3" {
    bucket         = "terraform-iam-state-file"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-iam-state-lock"
  }
}
