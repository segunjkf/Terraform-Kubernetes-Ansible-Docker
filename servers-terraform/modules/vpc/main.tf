resource "aws_vpc" "my-vpc" {
  cidr_block       = var.vpc-cidr-blocks
  instance_tenancy = "default"
  tags = {
    "Name" = "mynew-vpc"
  }

}

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.subnet-cidr-block
  availability_zone = var.availability_zone

}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my-vpc.id
}

resource "aws_main_route_table_association" "a" {
  vpc_id         = aws_vpc.my-vpc.id
  route_table_id = aws_route_table.my-route-tb.id
}

resource "aws_route_table" "my-route-tb" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}
