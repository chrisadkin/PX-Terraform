resource "aws_iam_policy" "px_policy" {
  name        = "test-policy"
  description = "A test policy"

  policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
        {
            "Sid": "", 
            "Effect": "Allow",
            "Action": [
                "ec2:AttachVolume",
                "ec2:ModifyVolume",
                "ec2:DetachVolume",
                "ec2:CreateTags",
                "ec2:CreateVolume",
                "ec2:DeleteTags",
                "ec2:DeleteVolume",
                "ec2:DescribeTags",
                "ec2:DescribeVolumeAttribute",
                "ec2:DescribeVolumesModifications",
                "ec2:DescribeVolumeStatus",
                "ec2:DescribeVolumes",
                "ec2:DescribeInstances",
                "autoscaling:DescribeAutoScalingGroups"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "additional" {
# role       = module.eks.module.eks_managed_node_groups["one"].aws_iam_role
  role       = var.nodegroup_iam_role 
  policy_arn = aws_iam_policy.px_policy.arn
}

output "node_group_iam_role_name" {
  value = var.nodegroup_iam_role 
}
