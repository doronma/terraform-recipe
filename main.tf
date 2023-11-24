terraform {
  cloud {
    organization = "doron-org"

    workspaces {
      name = "terraform-recipe"
    }
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