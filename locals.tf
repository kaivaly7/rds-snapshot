locals {
  default_tags = {
    Description      = var.Description
    ApplicationName  = upper(var.ApplicationName)
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
    aws_db_instance_id = var.aws_db_instance_id
    subnet_group_name = var.subnet_group_name
    security_group_id = var.security_group_id

  }
}

