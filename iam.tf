resource "aws_iam_group" "cmtr_vkkq9lu1_iam_group" {
  name = "cmtr-vkkq9lu1-iam-group"
}
/*
resource "aws_iam_policy" "cmtr_vkkq9lu1_iam_policy" {
  name = "cmtr-vkkq9lu1-iam-policy"
  policy = templatefile("${path.module}/policy.json", {
    bucket_name = data.aws_s3_bucket.cmtr_vkkq9lu1_bucket_1769411145.bucket
  })
  tags = {
    Project = "cmtr-vkkq9lu1"
  }
}


 */
resource "aws_iam_role" "cmtr_vkkq9lu1_iam_role" {
  name = "cmtr-vkkq9lu1-iam-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  tags = {
    Project = "cmtr-vkkq9lu1"
  }
}
/*
resource "aws_iam_role_policy_attachment" "aws_iam_role_policy_attachment" {
  policy_arn = aws_iam_policy.cmtr_vkkq9lu1_iam_policy.arn
  role       = aws_iam_role.cmtr_vkkq9lu1_iam_role.name
}


 */
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "cmtr-vkkq9lu1-iam-instance-profile"
  role = aws_iam_role.cmtr_vkkq9lu1_iam_role.name
}
