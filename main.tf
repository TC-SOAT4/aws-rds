provider "aws" {
  region = var.regionDefault
}

resource "aws_db_subnet_group" "subnet-rds" {
  name       = "subnet-rds-${var.projectName}"
  subnet_ids = ["${var.subnet01}", "${var.subnet02}", "${var.subnet03}"]

  tags = {
    Name = "subnet-rds"
  }
}

resource "aws_security_group" "sg-rds" {
  name   = "SG=${var.projectName}-rds"
  vpc_id = var.vpcId

  ingress {
    description = "VPC"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_rds"
  }
}

resource "aws_db_instance" "rds" {
  db_name                      = var.dbName
  identifier                   = "rds-${var.projectName}"
  engine                       = var.engineRds
  engine_version               = var.engineRdsVersion
  username                     = var.rdsUser
  password                     = var.rdsPass
  instance_class               = var.instanceClass
  storage_type                 = var.storageType
  allocated_storage            = var.minStorage
  max_allocated_storage        = var.maxStorage
  multi_az                     = false
  vpc_security_group_ids       = [aws_security_group.sg-rds.id]
  db_subnet_group_name         = aws_db_subnet_group.subnet-rds.id
  apply_immediately            = true
  skip_final_snapshot          = true
  publicly_accessible          = false
  deletion_protection          = true
  performance_insights_enabled = false
  backup_retention_period      = 1
  backup_window                = "00:00-00:30"
  copy_tags_to_snapshot        = true
  delete_automated_backups     = false
}
