provider "aws" {
    region = "us-east-1"  
}

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my_subnet" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "us-east-1a"

}

resource "aws_instance" "foo" {
    ami             = "ami-0c101f26f147fa7fd"
    instance_type   = "t2.micro"
    subnet_id       = aws_subnet.my_subnet.id
    tags = {
        Name = "TF-Instance"
    }
}
