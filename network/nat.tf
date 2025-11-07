resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "${module.local.env}-nat"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.allocation_id
  subnet_id     = aws_subnet.public_zone1.id

  tags = {
    Name = "${module.local.env}-nat"
  }

  depends_on = [aws_internet_gateway.gw]
}
