provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket1" {
  # Nom exact demandé (en minuscules)
  bucket = "eproject1"

  tags = {
    Name        = "eproject1"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "bucket1_versioning" {
  bucket = aws_s3_bucket.bucket1.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "bucket2" {
  # Nom exact demandé (en minuscules)
  bucket = "eprojectt1"

  tags = {
    Name        = "eprojectt1"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "bucket2_versioning" {
  bucket = aws_s3_bucket.bucket2.id
  versioning_configuration {
    status = "Enabled"
  }
}
