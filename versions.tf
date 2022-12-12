terraform {
  required_version = ">= 0.13"
  #Facing issue with new release version 4.0.0. Temporary fix by pinning module to exact last working version of provider.
  required_providers {
    aws = "~> 3.74"
  }
}