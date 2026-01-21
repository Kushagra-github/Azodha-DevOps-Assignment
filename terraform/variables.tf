data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
data "aws_vpc" "default" {
  default = true
}

variable "region" {
  default = "ap-south-1"
}

