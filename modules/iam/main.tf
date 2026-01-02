# IAM User
resource "aws_iam_user" "this" {
  name = var.iam_user_name
}

# IAM Role
resource "aws_iam_role" "this" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# Custom Policy
resource "aws_iam_policy" "this" {
  name = "demo-custom-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = "*"
      }
    ]
  })
}

# Attach policy to user
resource "aws_iam_user_policy_attachment" "user_attach" {
  user       = aws_iam_user.this.name
  policy_arn = aws_iam_policy.this.arn
}

# Attach policy to role
resource "aws_iam_role_policy_attachment" "role_attach" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
