resource "aws_s3_bucket" "bucket" {
  bucket = var.name
}

resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket                  = aws_s3_bucket.bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = var.restrict_public_buckets
}

resource "aws_s3_bucket_versioning" "bucket" {
  count  = var.versioned ? 1 : 0
  bucket = aws_s3_bucket.bucket.bucket

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket" {
  count  = var.encrypt ? 1 : 0
  bucket = aws_s3_bucket.bucket.id
  rule {
    bucket_key_enabled = true

    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_cors_configuration" "bucket" {
  count = var.cors.enabled ? 1 : 0
  bucket = aws_s3_bucket.bucket.bucket
  cors_rule {
    allowed_methods = coalesce(var.cors.methods, ["GET"])
    allowed_origins = coalesce(var.cors.origins, ["*"])
    allowed_headers = coalesce(var.cors.headers, ["Authorization"])
    max_age_seconds = 3000
  }
}
