
resource "aws_db_subnet_group" "sg" {
  name       = "db-subnet-group"
  subnet_ids =  local.security_group_id

  tags = {
    Name = "db-subnet-group"
  }
}

resource "aws_security_group" "sg-db" {
  name        = "db-sg-wstech"
  description = "Allow access to PostgreSQL"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}