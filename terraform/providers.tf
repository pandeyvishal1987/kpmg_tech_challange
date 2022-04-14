terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.2"
    }
  }
}

provider "aws" {
  region     = var.default_region
  access_key = var.access_key
  secret_key = var.secret_key
}
