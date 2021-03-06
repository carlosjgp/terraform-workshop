terraform {
  required_providers {
    kubernetes = {
      # https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs
      source  = "hashicorp/kubernetes"
      version = "2.5.0"
    }
    kind = {
      # https://registry.terraform.io/providers/justenwalker/kind/latest/docs
      source  = "justenwalker/kind"
      version = "0.11.0-rc.1"
    }
    aws = {
      # https://registry.terraform.io/providers/hashicorp/aws/latest/docs
      source  = "hashicorp/aws"
      version = "~> 3"
    }
  }
  required_version = ">= 0.13"
}
