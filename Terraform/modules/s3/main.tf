resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

resource "aws_s3_object" "file" {
  bucket = aws_s3_bucket.this.id
  key    = "sample.txt"
  source = "${path.root}/files/sample.txt"
}
