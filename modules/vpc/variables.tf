variable "num_subnets" {
  default = 3 # You can modify this to change the number of subnets/NAT Gateways
}

variable "common_tags" {
  description = "Common tags for all resources"
  type = map(string)
  default = {
    "id"             = "2024"
    "owner"          = "Thim"
    "environment"    = "dev"
    "project"        = "spring"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
    "company"        = "EK-TECH"
  }
}

variable "availability_zones" {
  description = "List of availability zones to use"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"] # Replace with desired AZs
}