resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.deham14.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.deham14-igw.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

# Associate the route table with the subnet
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}