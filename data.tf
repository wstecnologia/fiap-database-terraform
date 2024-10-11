data "aws_vpc" "vpc" {  
  id = "vpc-0632b4ba7df6128f9"
}

data "aws_subnets" "available" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}
data "aws_security_group" "existing_sg" {
  filter {
    name   = "group-name"
    values = ["SG=${var.projectName}"]
  }

  vpc_id = data.aws_vpc.vpc.id

 
}