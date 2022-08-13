# =========================================
# Route Tables and their Associations
# =========================================

resource "aws_route_table" "public" {
  count  = length(var.pub_sub_cidrs) == 0 ? 0 : 1
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.project_name}-pub-route-table"
  }
}

resource "aws_route_table" "private" {
  count  = length(var.pri_sub_cidrs) == 0 ? 0 : 1
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.project_name}-pri-route-table"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(var.pub_sub_cidrs)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public[0].id
}

resource "aws_route_table_association" "private" {
  count          = length(var.pri_sub_cidrs)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[0].id
}

# =========================================
# Routes
# =========================================

resource "aws_route" "public" {
  count                  = length(var.pub_sub_cidrs) == 0 ? 0 : 1
  route_table_id         = aws_route_table.public[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw[0].id
}

resource "aws_route" "private" {
  count                  = length(var.pri_sub_cidrs) == 0 ? 0 : 1
  route_table_id         = aws_route_table.private[0].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[0].id
}
