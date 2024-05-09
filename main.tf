provider "aws" {
  region = var.regionDefault
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.0"

  name                 = "vpc_lanchonete_rds"
  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_db_subnet_group" "db_subnet_group_lanchonete_rds" {
  name       = "db_subnet_group_lanchonete_rds"
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name = "lanchonete_rds"
  }
}

resource "aws_security_group" "security_group_lanchonete_rds" {
  name   = "security_group_rds"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "lanchonete_rds"
  }
}

resource "aws_db_instance" "mariadb-fiap-tech-challenge" {
  identifier = "rds-${var.projectName}"
  engine     = var.engineRds
  db_name    = var.dbNamePedido
  #parameter_group_name  = "default.sqlserver-ex-15.0"
  engine_version        = var.engineRdsVersion
  instance_class        = var.instanceClass
  storage_type          = var.storageType
  allocated_storage     = var.minStorage
  max_allocated_storage = var.maxStorage
  username              = var.rdsUser
  password              = var.rdsPass
  publicly_accessible   = true # Enable public accessibility
  skip_final_snapshot   = true

  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group_lanchonete_rds.name
  vpc_security_group_ids = [aws_security_group.security_group_lanchonete_rds.id]

  tags = {
    Name        = "TechLanches MARIADB Server Database"
    Repository  = "https://github.com/TC-SOAT4/aws-rds"
    Environment = "Prod"
    ManagedBy   = "Terraform"
  }

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }

}

# Configure the MySQL provider based on the outcome of
# creating the aws_db_instance.
provider "mysql" {
  endpoint = "${aws_db_instance.mariadb-fiap-tech-challenge.endpoint}"
  username = "${aws_db_instance.mariadb-fiap-tech-challenge.username}"
  password = "${aws_db_instance.mariadb-fiap-tech-challenge.password}"
}

# Create the second database beside "initial_db"
# using the aws_db_instance resource above.
resource "mysql_database" "producao-db" {
  name = var.dbNameProducao
}



