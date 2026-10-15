resource "aws-s3-bucket" "app-storage" {
  bucket = var.application-bucket-name

  tags = {
    Name    = "${var.project-name}-storage"
    project = var.project-name
  }
}

resource "aws-s3-bucket_versioning" "app-storage-versioning" {
  bucket = aws-s3-bucket.app-storage.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws-s3-bucket-server-side-encryption-configuration" "app-storage-encryption" {
  bucket = aws-s3-bucket.app-storage.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "app-storage-public-access-block" {
  bucket = aws-s3-bucket.app-storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}