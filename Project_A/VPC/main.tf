resource "aws_vpc" "My_virtual_Network" {         
  cidr_block = var.cidr_block
  tags = {
    Name = "my-vpc"
    Owner = "imran.shaikh@einfochips.com"
    DM = "Shriram Deshpande"
    Project = "Internal POC"
    Department = "PES" 
  }
}


resource "aws_subnet" "public_subnet" {
  count             = length(var.my_subnet)                             
  vpc_id            = aws_vpc.My_virtual_Network.id
  cidr_block        = var.my_subnet[count.index].cidr_block             
  availability_zone = var.my_subnet[count.index].availability_zone      

  tags = {
    Name = "PublicSubnet-${count.index}"
    Owner = "imran.shaikh@einfochips.com"
    DM = "Shriram Deshpande"
    Project = "Internal POC"
    Department = "PES"
  }
}

resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.My_virtual_Network.id

  tags = {
    Name = "My-IGW"
    Owner = "imran.shaikh@einfochips.com"
    DM = "Shriram Deshpande"
    Project = "Internal POC"
    Department = "PES"
  }
}

resource "aws_route_table" "public_subnet_route" {
  vpc_id = aws_vpc.My_virtual_Network.id

  route {
    cidr_block = "0.0.0.0/0" # Route all traffic to the Internet Gateway
    gateway_id = aws_internet_gateway.example_igw.id
  }

  depends_on = [aws_subnet.public_subnet]
}

resource "aws_route_table_association" "public_subnet_association1" {
  count          = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id                                   
  route_table_id = aws_route_table.public_subnet_route.id
}
