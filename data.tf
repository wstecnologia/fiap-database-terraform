data "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
}

data "aws_subnets" "available" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

data "aws_subnet" "subnet" {
  for_each = toset(data.aws_subnets.available.ids)
  id       = each.value
}

data "aws_iam_role" "eks_cluster_role" {
  name = "LabRole"
}

data "aws_security_group" "existing_sg" {
  filter {
    name   = "group-id"
    values = [var.security_group_id]
  }

  vpc_id = data.aws_vpc.vpc.id

}