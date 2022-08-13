tidy:
	terraform fmt
	terraform-docs .

test:
	terraform plan --var-file=test.tfvars

applytest:
	terraform apply -auto-approve --var-file=test.tfvars
