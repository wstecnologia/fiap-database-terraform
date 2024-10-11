data "aws_vpc" "vpc" {  
  id = "vpc-0632b4ba7df6128f9"
}

data "aws_subnets" "available" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}
