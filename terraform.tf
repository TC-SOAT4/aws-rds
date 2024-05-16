terraform {

  cloud {
    workspaces {
      name = "lanchonete-terraform-rds"
    }
    organization = "FIAP_POS"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.40.0"
    }

    mysql = {
      source  = "petoju/mysql"
      version = "3.0.58"
    }

  }

  required_version = "~> 1.3"

}
