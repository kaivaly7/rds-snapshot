terraform { 
backend "s3" { 
bucket="useast1-nlsn-svod-nonprod-blue-terraform-state" 
key="root_tfstate.json" 
region="us-east-1" 
dynamodb_table="svod-all-nonprod-env-state-table" 
} 
}