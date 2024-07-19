resource "aws_vpc" "deham14" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "WebServerVPC"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.deham14.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet1"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "deham14-igw" {
  vpc_id = aws_vpc.deham14.id

  tags = {
    Name = "WebServerIG"
  }
}

