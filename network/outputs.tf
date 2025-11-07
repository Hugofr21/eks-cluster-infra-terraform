output "nat_gateway_id" {
  value = aws_nat_gateway.nat.id
  description = "ID the NAT Gateway public"
}

output "nat_allocation_id" {
  value = aws_eip.nat.allocation_id
  description = "Allocation ID do EIP associate of the NAT Gateway"
}

output "nat_public_ip" {
  value = aws_eip.nat.public_ip
  description = "Address IP public associate of the NAT Gateway"
}

output "nat_subnet_id" {
  value = aws_nat_gateway.nat.subnet_id
  description = "Subnet where the NAT Gateway foi created"
}

output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
  description = "ID of Internet Gateway annexation the VPC"
}
