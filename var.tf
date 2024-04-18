variable "projectName" {
  default = "fiap-tech-challenge"
}

variable "dbName" {
  default = "lanchonetedb"
}

variable "regionDefault" {
  default = "us-east-1"
}

variable "engineRds" {
  default = "mariadb"
}

variable "engineRdsVersion" {
  default = "10.11"
}

variable "rdsUser" {
  default = "lanchoneteuser"
}

variable "rdsPass" {
  default = "lanchonete"
}

variable "instanceClass" {
  default = "db.t3.micro"
}

variable "storageType" {
  default = "gp3"
}

variable "minStorage" {
  default = "20"
}

variable "maxStorage" {
  default = "30"
}
