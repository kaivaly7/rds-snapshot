
output "newRDSInstance" {
  value       = aws_db_instance.svod-rds-nonprod-black.arn
  description = "RDS instance Created"
}
