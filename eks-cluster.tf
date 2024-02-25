resource "aws_eks_cluster" "eks-cluster" {
  name     = "test-eks-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = ["subnet-07787ed573e4e56d5", "subnet-04c52babfd7e38ee0", "subnet-0f6bc7b568deff237"]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_vpc_resource_controller,
  ]
}