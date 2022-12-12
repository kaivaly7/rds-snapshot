
variable "AWSRegion" {
  description = "AWS Regions"
  default     = "us-east-1"
}

variable "profile" {
  description = "AWS profile"
  default     = "saml"
}

variable "ApplicationName" {
  description = "Application Name"
}

variable "ServiceName" {
  description = "Resource name used for service naming"
}

variable "Environment" {
  description = "The Runtime Environment (demo/dev/qa/uat/prod)"
}

variable "DeployColor" {
  description = "The deployment color, i.e green | blue"
}

# AWS Tagging Standards
variable "Description" {
  description = "Description of stack's purpose"
}

variable "Platform" {
  description = "Business platform"
  default     = "Streaming"
}

variable "Product" {
  description = "Product name"
  default     = "SVOD"
}

variable "CostCenter" {
  description = "CostCenter for Billing"
  default     = "7501303"
}

variable "DistributionList" {
  description = "Automated support e-mail address"
  default     = "mediasvodsupportnonprod@nielsen.com"
}

variable "Process" {
  description = "Process name"
  default     = "Collection"
}

variable "Market" {
  description = "Market or JIC"
  default     = "Global"
}

variable "AlwaysOn" {
  description = "Resources meant to run 24/7/7 (Yes/No)"
  default     = "Yes"
}

variable "CreatedBy" {
  description = "Created by user (email)"
}

variable "AccountNumber" {
  description = "AWS account number"
  default="324683867184"
}

variable "Account" {
  description = "AWS account name"
  default="Eng-MediaWorks-NonProd"
}

variable "STATE_STORE" {
  description = "S3 bucket for Terraform state store (must be specified in .tfvars file)"
}

variable "DYNAMODB_TABLE" {
  description = "Dynamo db table for Terraform state "
}

variable "aws_db_instance_id" {
  description = "DB Instance ID"
}

variable "subnet_group_name" {
  description = "Subnet Group Name"
}

variable "security_group_id" {
  description = "Security Group id"
}

variable "aws_db_snapshot_db_snapshot_id" {
  description = "snapshot ID"
}


