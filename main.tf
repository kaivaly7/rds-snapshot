provider "aws" {
  region  = var.AWSRegion
  profile = var.profile
}

module "nlsn_svod_rds" {
  source = "./rds"
  Description      = var.Description
  ApplicationName  = var.ApplicationName
  ServiceName      = var.ServiceName
  Platform         = var.Platform
  Product          = var.Product
  CostCenter       = var.CostCenter
  DistributionList = var.DistributionList
  Process          = var.Process
  Market           = var.Market
  AlwaysOn         = var.AlwaysOn
  AWSRegion        = var.AWSRegion
  Environment      = var.Environment
  DeployColor      = var.DeployColor
  CreatedBy        = var.CreatedBy
  STATE_STORE      = var.STATE_STORE
  DYNAMODB_TABLE   = var.DYNAMODB_TABLE
  aws_db_instance_id  = var.aws_db_instance_id
  security_group_id   = var.security_group_id
  subnet_group_name   = var.subnet_group_name
  aws_db_snapshot_db_snapshot_id = var.aws_db_snapshot_db_snapshot_id
}
