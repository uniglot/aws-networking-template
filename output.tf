output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "pub_sub_ids" {
  description = "List of public subnet IDs"
  value       = try(aws_subnet.public.*.id, null)
}

output "pri_sub_ids" {
  description = "List of private subnet IDs"
  value       = try(aws_subnet.private.*.id, null)
}

output "elastic_ip" {
  description = "Elastic IP associated with NAT gateway."
  value       = try(aws_nat_gateway.nat[0].public_ip, null)
}

output "nat_id" {
  description = "NAT gateway ID"
  value       = try(aws_nat_gateway.nat[0].id, null)
}

output "igw_id" {
  description = "Internet gateway ID"
  value       = try(aws_internet_gateway.igw[0].id, null)
}

output "pub_rt_id" {
  description = "Public route table's ID"
  value       = try(aws_route_table.public[0].id, null)
}

output "pri_rt_id" {
  description = "Private route table's ID"
  value       = try(aws_route_table.private[0].id, null)
}
