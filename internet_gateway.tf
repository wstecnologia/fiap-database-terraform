resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc_prod.id

  tags = {
    Name = "igw_prod"
  }
}