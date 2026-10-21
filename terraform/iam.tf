resource "aws_iam_role" "gym-tracker-ec2-role" {
  name = "${var.project-name}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "gym-tracker-ec2-role-policy" {
  name = "${var.project-name}-s3-access"
  role = aws_iam_role.gym-tracker-ec2-role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListBucket"
        ]
        Effect = "Allow"
        action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = "aws_s3_bucket.app-storage.arn"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "gym-tracker-instance-profile" {
  name = "${var.project-name}-instance-profile"
  role = aws_iam_role.gym-tracker-ec2-role.name
}