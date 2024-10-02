# Security Group para EC2 (Webserver)
resource "aws_security_group" "sg_webserver" {
  name        = "sg_webserver"
  description = "Permite SSH e HTTP HTTPS para o webserver"
  vpc_id      = aws_vpc.vpc_prod.id

  ingress {
    description = "Permitir SSH do IP especifico"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["45.172.69.188/32"]  # Substitua pelo seu IP
  }

  ingress {
    description = "Permitir HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Permitir HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_webserver"
  }
}

# Security Group para RDS
resource "aws_security_group" "sg_rds" {
  name        = "sg_rds"
  description = "Permite acesso ao RDS a partir do webserver e do IP especifico"
  vpc_id      = aws_vpc.vpc_prod.id

  ingress {
    description = "Permitir acesso PostgreSQL do webserver"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    # Referencia o SG do webserver
    security_groups = [aws_security_group.sg_webserver.id]
  }

  ingress {
    description = "Permitir acesso PostgreSQL do IP especifico"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Substitua pelo seu IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_rds"
  }
}