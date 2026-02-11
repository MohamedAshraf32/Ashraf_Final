terraform {
  backend "s3" {
    bucket         = "ashrof-final-gp1 " # REPLACE THIS WITH YOUR ACTUAL BUCKET NAME
    key            = "eks-platform/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    use_lockfile   = false  # Optional, but recommended
  }
}
