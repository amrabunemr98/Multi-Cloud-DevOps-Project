resource "aws_vpc" "task_vpc" {
  cidr_block = var.cidr-block
  tags = {
    Name = var.vpc-tag
  }
}