resource "aws_subnet" "subnet-pub" {
  for_each          = var.sub
  vpc_id            = var.vpc
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags = {
    Name = each.value.name
  }
}

