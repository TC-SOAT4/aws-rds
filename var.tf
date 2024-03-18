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
  default = "lanchonetemariadb"
}

variable "rdsPass" {
  default = "lanchoneteroot"
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
  default = "vpc-04ee09426e0546365"
}

variable "vpcCIDR" {
  default = "172.31.0.0/16"
}

variable "subnet01" {
  default = "subnet-03c964c540d439fef"
}

variable "subnet02" {
  default = "subnet-03d8840eb8ccbd474"
}

variable "subnet03" {
  default = "subnet-0552155f18ca61789"
}
