# Main Terraform configuration file
# File: main.tf

provider "aws" {
  region = "us-east-1"
}

# Create a security group for RDS Database Instance
resource "aws_security_group" "rds_sg" {
  name        = "rds_security_group"
  description = "Allow inbound access to RDS"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Change this to restrict access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds_security_group"
  }
}
