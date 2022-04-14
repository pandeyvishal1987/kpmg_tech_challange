# Creating Security Group 
resource "aws_security_group" "web_sg" {
  vpc_id = module.app_vpc.vpc_id
  
  # Inbound Rules
  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  
  # Outbound Rules
  # Internet access to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "web-sg"
  }
}

# Create Database Security Group
resource "aws_security_group" "app_server_sg" {
  name        = "app-server-sg"
  description = "Allow inbound traffic from web server"
  vpc_id      = module.app_vpc.vpc_id
  ingress {
    description     = "Allow traffic from web server"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }
  tags = {
    Name = "app-server-sg"
  }
}

# Create Database Security Group
resource "aws_security_group" "database_sg" {
  name        = "database-sg"
  description = "Allow inbound traffic from application layer"
  vpc_id      = module.app_vpc.vpc_id
  ingress {
    description     = "Allow traffic from application layer"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app_server_sg.id]
  }
  egress {
    from_port   = 32768
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "database-sg"
  }
}