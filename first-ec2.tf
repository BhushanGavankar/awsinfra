# Terraform HCL

provider "aws" {
  region = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
  profile = "bgcloud"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "MyTestVPC"
  }
}

resource "aws_subnet" "mysubnet-1a" {
  vpc_id = "${aws_vpc.myvpc.id}"
  cidr_block = "10.10.10.0/24"
  availability_zone = "${var.zone[0]}"
  tags = {
    Name = "MyTestSubnet-1a"
  }
}
 
 resource "aws_subnet" "mysubnet-1b" {
  vpc_id = "${aws_vpc.myvpc.id}"
  cidr_block = "10.10.20.0/24"
  availability_zone = "${var.zone[1]}"
  tags = {
    Name = "MyTestSubnet-1b"
  }
}

resource "aws_instance" "mytfec2" {
  ami           = "ami-09a5b0b7edf08843d"
  instance_type = "${var.instance_type}"
  subnet_id = "${aws_subnet.mysubnet-1a.id}"

  tags = {
    Name = "first-EC2"
  }
}

output "VPC_id" {
  value = "${aws_vpc.myvpc.id}"
  }
output "EC2_id" {
  value = "${aws_instance.mytfec2.id}"
}

