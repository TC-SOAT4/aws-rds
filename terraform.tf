terraform {

  cloud {
    workspaces {
      name = "lanchonete-terraform-rds"
    }
    organization = "FIAP_POS"
  }
}
