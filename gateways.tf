resource "aws_eip" "eip" {
  vpc = true
  tags = {
    Name = "${var.project_name}-nat"
  }
}

resource "aws_nat_gateway" "nat" {
  count = length(var.pri_sub_cidrs) == 0 ? 0 : 1
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public[0].id
  tags = {
    Name = "${var.project_name}-nat"
  }
}

resource "aws_internet_gateway" "igw" {
  count = length(var.pub_sub_cidrs) == 0 ? 0 : 1
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.project_name}-igw"
  }
}
