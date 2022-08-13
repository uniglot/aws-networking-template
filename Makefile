tidy:
	terraform fmt
	terraform-docs .

test:
	terraform plan --var-file=test.tfvars
