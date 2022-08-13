output "vpc_id" {
  description = "ID of the created VPC."
  value       = aws_vpc.this.id
}

output "igw_id" {
  description = "ID of the created internet gateway."
  value       = aws_internet_gateway.this.id
}
