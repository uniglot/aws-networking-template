variable "project_name" {
  description = "Project name that will be used as a name prefix of all resources."
  type        = string
}

variable "vpc_cidr" {
  description = "The IPv4 CIDR block for the VPC."
  type        = string
}

variable "pub_sub_cidrs" {
  description = "List of CIDR blocks of public subnets."
  type        = list(string)
  default     = []
}

variable "pri_sub_cidrs" {
  description = "List of CIDR blocks of private subnets."
  type        = list(string)
  default     = []
}

variable "ssh_allowed_cidrs" {
  description = "List of CIDR blocks that are allowed for SSH"
  type        = list(string)
}
