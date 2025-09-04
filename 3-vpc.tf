variable "vpc_cidr" {
  type        = string
  default     = "10.230.0.0/16"
  description = "VPC CIDR block"
}

resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-vpc"
  })
}
