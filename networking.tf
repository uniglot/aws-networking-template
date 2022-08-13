# =========================================
# VPC & IGW
# =========================================

resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags       = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = {
    Name = "${var.project_name}-igw"
  }
}

# =========================================
# Subnets
# =========================================

resource "aws_subnet" "public" {
  count      = length(var.pub_sub_cidrs)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.pub_sub_cidrs[count.index]
  tags       = {
    Name = "${var.project_name}-pub-sub-${count.index}"
  }
}

resource "aws_subnet" "private" {
  count      = length(var.pri_sub_cidrs)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.pri_sub_cidrs[count.index]
  tags       = {
    Name = "${var.project_name}-pub-sub-${count.index}"
  }
}

# =========================================
# Routing Tables and their Associations
# =========================================

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  tags   = {
    Name = "${var.project_name}-pub-route-table"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id
  tags   = {
    Name = "${var.project_name}-pri-route-table"
  }
}

resource "aws_route_table_association" "public" {
  count = length(var.pub_sub_cidrs)
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = length(var.pri_sub_cidrs)
  subnet_id = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
