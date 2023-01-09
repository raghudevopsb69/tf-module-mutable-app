resource "aws_iam_policy" "ssm-policy" {
  name        = "aws_ssm_ro_to_ec2_${var.env}"
  path        = "/"
  description = "aws_ssm_ro_to_ec2_${var.env}"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "ssm:GetParameterHistory",
          "ssm:GetParametersByPath",
          "ssm:GetParameters",
          "ssm:GetParameter"
        ],
        "Resource" : [
          "arn:aws:ssm:us-east-1:739561048503:parameter/param.dev*",
          "arn:aws:ssm:us-east-1:739561048503:parameter/param.NEXUS*"
        ]
      },
      {
        "Sid" : "VisualEditor1",
        "Effect" : "Allow",
        "Action" : "ssm:DescribeParameters",
        "Resource" : "*"
      }
    ]
  })
}

