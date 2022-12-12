# AWS Region
REGION ?= $(shell aws configure get region)

# The Environment, i.e dev/qa/prod
ENV ?= $(shell aws configure get env)

# The deploy color
COLOR ?= $(shell aws configure get deploy-color)

# Account
ACCOUNT ?= $(shell aws configure get account)

# Terraform Variables
VAR_FILE ?= vars/$(ACCOUNT)-$(ENV)-$(COLOR)-$(REGION).tfvars

include $(VAR_FILE)

_var_file:
	@$(MAKE) _workspace_create ws=$(ApplicationName)-$(ServiceName)-$(ENV)-$(COLOR)-$(REGION)
	@echo "Using var file $(VAR_FILE)"

_workspace_create:
	@terraform workspace new $(ws) > /dev/null 2>&1 || terraform workspace select $(ws) > /dev/null 2>&1 || true

_workspace_show:
	@echo "Using workspace:"
	@terraform workspace show

_create_state_bucket:
	@printf "terraform { \nbackend \"s3\" { \nbucket=\"$(STATE_STORE)\" \nkey=\"root_tfstate.json\" \nregion=\"$(REGION)\" \ndynamodb_table=\"$(DYNAMODB_TABLE)\" \n} \n}" > backend.tf

_tf_init:
	@terraform init -var-file=$(VAR_FILE)

_check_init:
	@if [ -d ".terraform" ]; then if [ -f "backend.tf" ]; then echo "Terraform init exists."; else make _create_state_bucket; fi; else make init; fi

init: _create_state_bucket _tf_init _var_file _workspace_show

create: init apply

apply: _check_init _var_file
	@terraform apply -var-file=$(VAR_FILE) -auto-approve

delete: _check_init _var_file
	@terraform destroy -var-file=$(VAR_FILE) -lock=false

output:
	@terraform output

clean:
	@rm -rf backend*.tf
	@rm -rf .terraform
	@rm -rf terraform.tfstate.*

tf_plan: clean init
	@echo "Terraform Plan: "
	@echo "${VAR_FILE}"
	@terraform plan -var-file="${VAR_FILE}"

tf_destroy_plan: clean init
	@echo "Terraform destroy Plan: : "
	@echo "Variable File Name (Destroy-Plan): ${VAR_FILE}"
	@echo "terraform plan -destroy -var-file=\"${VAR_FILE}\" "
	@terraform plan -destroy \
		-var-file="${VAR_FILE}"
