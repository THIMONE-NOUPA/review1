# resource "aws_subnet" "private" {
#   count = var.num_subnets

#   vpc_id            = aws_vpc.main.id
#   cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, ceil(log(var.num_subnets, 2)), count.index + var.num_subnets)
#   availability_zone = var.availability_zones[count.index]

#   tags = merge({
#     Name = "private-subnet-${count.index + 1}"
#   }, var.common_tags)
# }
resource "aws_subnet" "private" {
  for_each = toset(["0", "1", "2"])  # Use strings instead of numbers

  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, ceil(log(var.num_subnets * 2, 2)), tonumber(each.key) + var.num_subnets)
  availability_zone = var.availability_zones[tonumber(each.key)]

  tags = merge({
    Name = "private-subnet-${tonumber(each.key) + 1}"
  }, var.common_tags)
}