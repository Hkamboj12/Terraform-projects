resource "aws_internet_gateway" "ig" {
    vpc_id =  aws_vpc.myvpc.id

    tags = {
      Name = "ig-myvpc"
    }
}

resource "aws_internet_gateway_attachment" "igat" {
    internet_gateway_id = aws_internet_gateway.ig.id
    vpc_id =  aws_vpc.myvpc.id
}


resource "aws_route_table" "public-route" {
    vpc_id =  aws_vpc.myvpc.id

    route {
        cidr_block = var.subnet1-cidr
        gateway_id = aws_internet_gateway.ig.id
    } 

    tags = {
        Name = "public-route"
    }
}


resource "aws_route_table_association" "sub1-routeA" {
    subnet_id = aws_subnet.subnet1.id
    route_table_id = aws_route_table.public-route.id 
}


resource "aws_instance" "EC2-instance" {
    ami = ""
    instance_type = ""
  
}