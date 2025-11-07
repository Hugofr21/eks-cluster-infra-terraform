resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    name = "${local.env}-main"
  }


}

resource "aws_vpc" "publicSubnet" {
  cidr_block = "10.0.0.0/16"
}
