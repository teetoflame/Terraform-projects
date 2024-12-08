# Define provider (AWS)
provider "aws" {
  region = var.aws_region
}

# Define input variables
variable "aws_region" {
  default = "eu-north-1"  # Correct region
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ami_id" {
  default = "ami-075449515af5df0d1"  # Ubuntu 20.04 AMI
}

variable "key_pair_name" {
  default = "bincom"  # Existing key pair name
}

# Define security group to allow HTTP traffic
resource "aws_security_group" "allow_http" {
  name_prefix = "allow_http"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Define web server (EC2 instance)
resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair_name  # Use var.key_pair_name to reference the existing key pair
  security_groups = [aws_security_group.allow_http.name]

  tags = {
    Name = "ConfigurableWebServer"
  }
}

# Output the public IP of the web server
output "web_server_public_ip" {
  value = aws_instance.web.public_ip
}
