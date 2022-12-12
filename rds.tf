provider "aws" {
  region  = var.AWSRegion
  profile = var.profile
}


data "aws_db_snapshot" "db_snapshot" {
  most_recent            = true
  db_instance_identifier = var.aws_db_instance_id
   #tags = local.default_tags
}

resource "aws_db_instance" "svod-rds-nonprod-blue" {
  instance_class         = "db.t3.micro"
  identifier             = "svod-rds-nonprod-blue"
  db_subnet_group_name   = var.subnet_group_name
  vpc_security_group_ids = [var.security_group_id]
  skip_final_snapshot    = true
  snapshot_identifier    = data.aws_db_snapshot.db_snapshot.id
}




