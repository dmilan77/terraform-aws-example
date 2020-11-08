resource "aws_kms_key" "s3key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "bucekt_01" {
  bucket = "test-bucket-dmilan-01"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.s3key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket" "bucekt_02" {
  bucket = "test-bucket-dmilan-02"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.s3key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

