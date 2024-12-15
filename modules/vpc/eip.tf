resource "aws_eip" "nat" {
  count = var.num_subnets

  domain = "vpc"
  tags = merge({
    Name = "nat-eip-${count.index + 1}"
  }, var.common_tags)
}
