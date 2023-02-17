module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "3.0.0"
  bucket = "test-11"
  acl    = "private"

  versioning = {
    enabled = true
  }
}