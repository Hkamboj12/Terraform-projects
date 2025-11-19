provider "aws" {
  region = "us-east-1"
}

# Get default VPC
data "aws_vpc" "default" {
  default = true
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-051f7e7f6c2f40dc1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}


resource "aws_security_group" "demo" {
    description = "this security group is used for demo projects"
    vpc_id = aws.vpc_id.default

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "Sg-demo"
    }
  
}



resource "aws_instance" "demo" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.demo.id]

  tags = {
    Name = "terraform-demo-ec2"
  }
}

output "public_ip" {
  description = "Public IP of demo EC2"
  value       = aws_instance.demo.public_ip
}
