resource "aws_db_instance" "db_instance" {
  identifier             = "wstech-postgres-db"
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_subnet_group_name   = aws_db_subnet_group.sg.name
  vpc_security_group_ids = [aws_security_group.sg-db.id]
  engine_version         = "16.3"
  username               = var.db_username
  password               = var.db_password
  db_name                = var.db_name
  publicly_accessible    = true
  skip_final_snapshot    = true

  tags = {
    Environment = "Pos Tech "
    Team        = "6SOAT-49"
    Name        = "wstech-fiap"
  }
}

