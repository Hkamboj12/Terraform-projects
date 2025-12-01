resource "aws_vpc" "myvpc" {
    cidr_block = var.vpc-cidr

    tags = {
        Name = "myvpc"
    }  
}

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.subnet1-cidr
    map_public_ip_on_launch = true
    region = "us-east-1"

    tags = {
        Name = "sub1"
    }  
}

resource "aws_subnet" "subnet2" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.subnet2-cidr
    map_public_ip_on_launch = true
    region = "us-east-2"
    
    tags = {
        Name = "sub2"
    }  
}


