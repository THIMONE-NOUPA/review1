
resource "aws_nat_gateway" "nat" {
  count = var.num_subnets

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = merge({
    Name = "${var.common_tags["environment"]}-${var.common_tags["project"]}-nat-gateway-${count.index + 1}"
  }, var.common_tags)
}