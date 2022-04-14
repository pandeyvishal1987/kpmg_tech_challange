variable "access_key" {
  description = "Set by ENV variables TF_VAR_access_key"
}
variable "secret_key" {
  description = "Set by ENV variables TF_VAR_secret_key"
}

variable "default_region" {
  default = "us-east-1"
}

variable "zones" {
  type        = list(string) 
  default = ["us-east-1a","us-east-1b"]
}


# Defining CIDR Block for VPC
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

# Defining CIDR Block for public Subnet
variable "public_subnets" {
  type        = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

# Defining CIDR Block for private Subnet
variable "private_subnets" {
  type        = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24",]
}

# Defining CIDR Block for DB Subnet
variable "db_subnet" {
  type        = list(string)
  default = ["10.0.21.0/24","10.0.22.0/24"]
}
