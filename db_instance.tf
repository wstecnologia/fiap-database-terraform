
resource "aws_db_instance" "ws_tech" {
  allocated_storage = 20
  engine            = "postgres"
  engine_version    = "16.4"
  instance_class    = "db.t3.micro"

  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [aws_security_group.sg_rds.id]
  publicly_accessible    = true

  tags = {
    Name = "ws_tech_db_instance"
  }

}
