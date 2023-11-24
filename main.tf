terraform {
  backend "s3" {
    bucket         = "recipe-app-api-devops-state-bucket"
    key            = "recipe-app.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "recipe-app-api-devops-tf-state-lock"
  }
}

provider "aws" {
  region = "eu-central-1"
  #version = "~> 2.54.0"
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    Owner       = var.conntact
    ManagedBy   = "Terraform"
  }

}