terraform {
  backend "s3" {
    bucket         = "terraformdocker"
    dynamodb_table = "terraformdocker"
    region         = "us-east-1"
    key            = "C:/Users/DELL/terraform-classinfracreation"

  }
}
