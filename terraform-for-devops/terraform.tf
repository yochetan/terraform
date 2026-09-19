terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "6.38.0"
        }
    }

    backend "s3" {
        bucket = "chetan-remote-bucket"
        use_lockfile   = true
        key = "terraform.tfstate"
        region = "us-west-2"
    }

}