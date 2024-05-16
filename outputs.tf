output "rds_name" {
  value = "rds-${var.projectName}"
}

output "security_group_id" {
  value = tolist(aws_db_instance.mariadb-fiap-tech-challenge.vpc_security_group_ids)[0]
}
