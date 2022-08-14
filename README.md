<!-- BEGIN_TF_DOCS -->
# AWS Networking Template

This module provisions essential network components of AWS.

The resulting resources include
- A VPC
- Public subnets (arbitrary numbers)
- Private subnets (arbitrary numbers)
- Route tables
- An internet gateway, if needed
- A NAT gateway and the associated Elastic IP, if needed
- Security groups

## Usage Example

```terraform
# in `main.tf`
module "network" {
source = "github.com/uniglot/aws-networking-template"

project_name = "module-test"
vpc_cidr = "10.0.1.0/24"
pub_sub_cidrs = ["10.0.1.0/25"]
pri_sub_cidrs = ["10.0.1.128/25"]
ssh_allowed_cidrs = ["123.123.12.3/32"]
}
```

## Resources

| Name | Type |
|------|------|
| [aws_eip.eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.private_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.public_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_pri_sub_cidrs"></a> [pri\_sub\_cidrs](#input\_pri\_sub\_cidrs) | List of CIDR blocks of private subnets. | `list(string)` | `[]` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name that will be used as a name prefix of all resources. | `string` | n/a | yes |
| <a name="input_pub_sub_cidrs"></a> [pub\_sub\_cidrs](#input\_pub\_sub\_cidrs) | List of CIDR blocks of public subnets. | `list(string)` | `[]` | no |
| <a name="input_ssh_allowed_cidrs"></a> [ssh\_allowed\_cidrs](#input\_ssh\_allowed\_cidrs) | List of CIDR blocks that are allowed for SSH | `list(string)` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The IPv4 CIDR block for the VPC. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elastic_ip"></a> [elastic\_ip](#output\_elastic\_ip) | Elastic IP associated with NAT gateway. |
| <a name="output_igw_id"></a> [igw\_id](#output\_igw\_id) | Internet gateway ID |
| <a name="output_nat_id"></a> [nat\_id](#output\_nat\_id) | NAT gateway ID |
| <a name="output_pri_rt_id"></a> [pri\_rt\_id](#output\_pri\_rt\_id) | Private route table's ID |
| <a name="output_pri_sub_ids"></a> [pri\_sub\_ids](#output\_pri\_sub\_ids) | List of private subnet IDs |
| <a name="output_private_sec_group_id"></a> [private\_sec\_group\_id](#output\_private\_sec\_group\_id) | Private security group's ID |
| <a name="output_pub_rt_id"></a> [pub\_rt\_id](#output\_pub\_rt\_id) | Public route table's ID |
| <a name="output_pub_sub_ids"></a> [pub\_sub\_ids](#output\_pub\_sub\_ids) | List of public subnet IDs |
| <a name="output_public_sec_group_id"></a> [public\_sec\_group\_id](#output\_public\_sec\_group\_id) | Public security group's ID |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID |
<!-- END_TF_DOCS -->