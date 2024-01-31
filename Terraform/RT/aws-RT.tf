#Route table of public
resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc

  route {
    cidr_block = var.cidr-rt
    gateway_id = var.igw
  }

  tags = {
    Name = var.tag_public
  }
}

#Resource:route table association for public
resource "aws_route_table_association" "rt_public" {
  count          = length(var.sub_pub)
  subnet_id      = var.sub_pub[count.index]
  route_table_id = aws_route_table.public_rt.id
}








