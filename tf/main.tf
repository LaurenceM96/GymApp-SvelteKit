variable "region" {
    description = "aws region"
    type        = string
    default     = "eu-west-2"
}

provider "aws" {
  region = var.region
}

terraform {
    backend "s3" {
        region  = "eu-west-2"
        bucket  = "tf-backend-gym-app"
        key     = "gym-app-svelte-kit/main.tfstate"
        encrypt = true
    }
}