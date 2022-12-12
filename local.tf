locals {
  default_tags = {
    Description      = var.Description
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
  }
}

