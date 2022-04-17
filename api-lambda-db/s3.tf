resource "aws_s3_bucket" "xray-s3-bucket" {
  bucket = "xray-s3-bucket"
}

resource "aws_s3_bucket_object" "xray-s3-object" {
  bucket = aws_s3_bucket.xray-s3-bucket.bucket
  key = "contents.txt"
  source = "./contents.txt"
}