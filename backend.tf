terraform {
  backend "s3" {
    bucket         = "terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    
    # LocalStack endpoint
    endpoints = {
      s3       = "http://localstack.10.8.0.1.nip.io"
      dynamodb = "http://localstack.10.8.0.1.nip.io"
    }
    
    # DynamoDB для locking
    dynamodb_table = "terraform_locks"
    
    # LocalStack не требует настоящих credentials
    access_key = "test"
    secret_key = "test"
    
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    use_path_style           = true
  }
}
