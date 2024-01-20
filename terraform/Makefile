.PHONY: init
init:
	terraform init

.PHONY: refresh
refresh:
	terraform refresh

.PHONY: plan
plan:
	terraform fmt && terraform validate && terraform plan -out=terraform.plan

.PHONY: apply
apply:
	terraform apply terraform.plan


.PHONY: output
output:
	terraform output
