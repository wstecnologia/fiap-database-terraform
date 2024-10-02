resource "aws_instance" "webserver" {
  ami             = "ami-0ebfd941bbafe70c6"
  instance_type   = "t3.micro"
  subnet_id       = aws_subnet.public_subnet_a.id
  security_groups = [aws_security_group.sg_webserver.id]
  ##key_name        = var.key_name

  tags = {
    Name = "webserver"
  }
}
