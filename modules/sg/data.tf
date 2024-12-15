data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.common_tags["environment"]}-${var.common_tags["project"]}"] # Replace with the actual Name tag value of your VPC
  }
}