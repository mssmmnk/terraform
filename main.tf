#main.tf

privider "aws" {        ##defines the aws region
    region = var.aws_region        ##var is going to be defined in the file var.tf
}

resource "aws_vpc" "main" {              ##defines 
    cidr_block = var.vpc_cidr
    tags = {
        Name = "main-vpc"
    }
}

resource "aws_subnet" "main" {
    vpc_id  = aws_vpc.main.vpc_id
    cidr_block = var.subnet_cidr
    availability_zone = var.availability_zone
    tags = {
        Name = "main-subnet"
    }
}

resource "aws_instance" "main" {
    ami = var-ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.main.ami_id
    tags = {
        Name = "main-instance"
    }
}