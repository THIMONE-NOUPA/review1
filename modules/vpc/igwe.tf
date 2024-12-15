resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = merge({
    Name = "${var.common_tags["environment"]}-${var.common_tags["project"]}-igw"
  }, var.common_tags)
}