variable "project_name" {
  type = string
}

variable "vpc_cidr" {
  description = "The IPv4 CIDR block for the VPC."
  type        = string
  default     = "10.0.1.0/24"
}

variable "pub_sub_cidrs" {
  description = "List of CIDR blocks of public subnets."
  type        = list(string)
  default     = ["10.0.1.0/25"]
}

variable "pri_sub_cidrs" {
  description = "List of CIDR blocks of private subnets."
  type        = list(string)
  default     = ["10.0.1.128/25"]
}
