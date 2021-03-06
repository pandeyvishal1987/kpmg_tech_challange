variable "access_key" {
  type        = string
  description = "Set by ENV variables TF_VAR_access_key"
}
variable "secret_key" {
  type        = string
  description = "Set by ENV variables TF_VAR_secret_key"
}

variable "default_region" {
  description = "Default Region"
  type        = string
  default     = "us-east-1"
}

variable "zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}


# Defining CIDR Block for VPC
variable "vpc_cidr" {
  description = "VPC CIDR range"
  type        = string
  default     = "10.0.0.0/16"
}

# Defining CIDR Block for public Subnet
variable "public_subnets" {
  description = "Public subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

# Defining CIDR Block for private Subnet
variable "private_subnets" {
  description = "Private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", ]
}

# Defining CIDR Block for DB Subnet
variable "db_subnet" {
  description = "Database subnets"
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24"]
}
