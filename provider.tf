terraform {
  required_version = "~>1.11.3" # terraform_version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.82.1" # provider_version
    }
  }

}

provider "aws" {
  region = "us-east-1"
  #   shared_config_files      = ["C:\\Users\\RH0998\\.aws\\config"]
  #   shared_credentials_files = ["C:\\Users\\RH0998\\.aws\\credentials"]
  #   profile                  = "terraform"
}
