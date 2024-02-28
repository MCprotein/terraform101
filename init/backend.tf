terraform {
  backend "s3" {
    bucket         = "tf101-my"
    key            = "terraform101/init/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
