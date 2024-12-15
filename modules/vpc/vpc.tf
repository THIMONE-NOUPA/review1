resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = merge({
    Name = "${var.common_tags["environment"]}-${var.common_tags["project"]}"
  }, var.common_tags)
}

















