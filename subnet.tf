resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.vpc_prod.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.regionDefault}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_a"
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id                  = aws_vpc.vpc_prod.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "${var.regionDefault}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_b"
  }
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id            = aws_vpc.vpc_prod.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "${var.regionDefault}a"
  tags = {
    Name = "private_subnet_a"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id            = aws_vpc.vpc_prod.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "${var.regionDefault}b"

  tags = {
    Name = "private_subnet_b"
  }
}