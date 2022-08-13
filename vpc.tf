resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_subnet" "public" {
  count      = length(var.pub_sub_cidrs)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.pub_sub_cidrs[count.index]
  tags = {
    Name = "${var.project_name}-pub-sub-${count.index}"
  }
}

resource "aws_subnet" "private" {
  count      = length(var.pri_sub_cidrs)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.pri_sub_cidrs[count.index]
  tags = {
    Name = "${var.project_name}-pub-sub-${count.index}"
  }
}
