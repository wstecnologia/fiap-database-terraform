variable "regionDefault" {
  default = "us-east-1"
}

variable "db_username" {
  description = "O nome de usuário do banco de dados"
  type        = string
}

variable "db_password" {
  description = "A senha do banco de dados"
  type        = string
}

variable "db_name" {
  description = "FIAP - O nome do banco de dados "
  type        = string
  default     = "lanchonetews"
}

variable "projectName" {
  default = "RDS_FIAP"
}

variable "labRole" {
  default = "arn:aws:iam::080963086121:role/LabRole"
}

variable "accessConfig" {
  default = "API_AND_CONFIG_MAP"
}

variable "security_group_id" {
  type    = string
  default = "sg-01796ef36943f91d8"
}

variable "vpc_cidr_block" {
  type    = string
  default = "172.31.0.0/16"
}