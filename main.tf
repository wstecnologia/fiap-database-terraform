resource "aws_db_instance" "db_instance" {
  identifier             = "wstech-postgres-db"
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_subnet_group_name   = aws_db_subnet_group.sg.name
  vpc_security_group_ids = [aws_security_group.sg-db.id]
  engine_version         = "16.3"
  username               = var.db_username
  publicly_accessible    = true
  password               = var.db_password
  db_name                = var.db_name
  skip_final_snapshot    = true

  tags = {
    Name = "wstech-fiap"
  }
}

