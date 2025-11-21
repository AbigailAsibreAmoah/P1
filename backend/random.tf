resource "random_id" "bucket_suffix" {
  byte_length = 4
}

locals {
  bucket_name = var.bucket_name != "" ? var.bucket_name : "tasty-bites-website-${random_id.bucket_suffix.hex}"
}