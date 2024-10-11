resource "aws_secretsmanager_secret" "rds_master_password" {
  name        = "rds_master_password"
  description = "Senha master para a instância RDS PostgreSQL"
}

resource "aws_secretsmanager_secret_version" "rds_master_password_version" {
  secret_id     = aws_secretsmanager_secret.rds_master_password.id
  secret_string = jsonencode({
    username = var.db_username
    password = var.db_password
  })
}

resource "aws_db_instance" "db_instance" {
  identifier             = "wstech-postgres-db"
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_subnet_group_name   = aws_db_subnet_group.sg.name
  vpc_security_group_ids = [aws_security_group.sg-db.id]
  engine_version         = "16.3"  
  username                = jsondecode(aws_secretsmanager_secret_version.rds_master_password_version.secret_string)["username"]
  password                = jsondecode(aws_secretsmanager_secret_version.rds_master_password_version.secret_string)["password"]
  db_name                = var.db_name
  publicly_accessible    = true    
  skip_final_snapshot    = true

  tags = {
    Environment = "Pos Tech "
    Team        = "6SOAT-49"
    Name = "wstech-fiap"
  }
}

