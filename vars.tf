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
  description = "O nome do banco de dados"
  type        = string  
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
