output "nat_gateway_id" {
  value       = aws_nat_gateway.nat.id
  description = "ID of the public NAT Gateway"
}

output "nat_allocation_id" {
  value       = aws_eip.nat.allocation_id
  description = "Allocation ID of the EIP associated with the NAT Gateway"
}

output "nat_public_ip" {
  value       = aws_eip.nat.public_ip
  description = "Public IP address associated with the NAT Gateway"
}

output "nat_subnet_id" {
  value       = aws_nat_gateway.nat.subnet_id
  description = "Subnet where the NAT Gateway was created"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.gw.id
  description = "ID of the Internet Gateway attached to the VPC"
}

output "private_subnet_ids" {
  description = "IDs of the private subnets used for internal workloads and EKS nodes"
  value       = [
    aws_subnet.private_zone1.id,
    aws_subnet.private_zone2.id
  ]
}

output "private_subnet_cidrs" {
  description = "CIDR blocks of the private subnets"
  value       = [
    aws_subnet.private_zone1.cidr_block,
    aws_subnet.private_zone2.cidr_block
  ]
}

output "private_subnet_zones" {
  description = "Availability zones of the private subnets"
  value       = [
    aws_subnet.private_zone1.availability_zone,
    aws_subnet.private_zone2.availability_zone
  ]
}

output "public_subnet_ids" {
  description = "IDs of the public subnets with Internet access"
  value       = [
    aws_subnet.public_zone1.id,
    aws_subnet.public_zone2.id
  ]
}

output "public_subnet_cidrs" {
  description = "CIDR blocks of the public subnets"
  value       = [
    aws_subnet.public_zone1.cidr_block,
    aws_subnet.public_zone2.cidr_block
  ]
}

output "public_subnet_zones" {
  description = "Availability zones of the public subnets"
  value       = [
    aws_subnet.public_zone1.availability_zone,
    aws_subnet.public_zone2.availability_zone
  ]
}
