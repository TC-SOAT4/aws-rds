variable "projectName" {
  default = "fiap-tech-challenge"
}

variable "clusterName" {
  default = "fiapTechChallenge"
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
  default = "mariadb"
}

variable "rdsPass" {
  default = "root"
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

variable "vpcId" {
  default = "vpc-007d6a1529c4b043a"
}

variable "vpcCIDR" {
  default = "172.31.0.0/16"
}

variable "subnet01" {
  default = "subnet-0a80a2e2a49093a7f"
}

variable "subnet02" {
  default = "subnet-013223fc01e681b2b"
}

variable "subnet03" {
  default = "subnet-0410002ec39e2f1e5"
}
