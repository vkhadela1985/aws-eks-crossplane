resource "aws_eks_node_group" "eks-node-group" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "test-node-group"
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids      = ["subnet-0f6bc7b568deff237", "subnet-04c52babfd7e38ee0", "subnet-07787ed573e4e56d5"]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  depends_on = [
    aws_eks_cluster.eks-cluster,
  ]
}