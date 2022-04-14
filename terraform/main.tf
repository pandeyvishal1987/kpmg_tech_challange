#Create EC2 Instance
resource "aws_instance" "webserver" {
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = "t2.micro"
  availability_zone      = var.zones[0]
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = module.app_vpc.public_subnets[0]
  user_data              = file("install_apache.sh")

  tags = {
    Name = "web-server"
  }

}

resource "aws_instance" "app_server" {
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = "t2.micro"
  availability_zone      = var.zones[1]
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = module.app_vpc.private_subnets[1]
  user_data              = file("install_tomcat.sh")

  tags = {
    Name = "app-server"
  }

}

# Creating RDS Instance

resource "random_password" "db_password" {
  length = 16
  special = true
  override_special = "_%@/'\""
}

resource "aws_db_instance" "default" {
  allocated_storage      = 10
  db_subnet_group_name   = module.app_vpc.database_subnet_group
  engine                 = "mysql"
  engine_version         = "8.0.28"
  instance_class         = "db.t3.micro"
  multi_az               = true
  db_name                = "mydb"
  username               = "admin"
  password               = random_password.db_password.result
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database_sg.id]
}