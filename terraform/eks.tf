# A simple and fast cluster, without specified version. For production cluster we must setup version, obviously.
resource "aws_eks_cluster" "aws_eks" {
  name     = var.k8s_cluster_name
  role_arn = aws_iam_role.lab_8.arn

  vpc_config {
    subnet_ids = [for i in aws_subnet.vpc_networks : i.id]
  }

  tags = {
    Name = var.env
  }
}

resource "aws_eks_node_group" "lab_8_nodes" {
  cluster_name    = aws_eks_cluster.aws_eks.name
  node_group_name = var.k8s_node_pool_name
  node_role_arn   = aws_iam_role.lab_8_nodes.arn
  subnet_ids      = [for i in aws_subnet.vpc_networks : i.id]

  # Also should be enabled for real prod cluster (it's main k8s feature, it was created for!), but right now i have a task to setup exactly one instance.
  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  # But it also possible to use ARM, i simply don't have ARM processor to verify the compilation of my code.
  ami_type = "AL2_x86_64"
  disk_size = "10"
  instance_types = var.k8s_instance_type

  # Sometimes it can be useful to have access to VM itself, nf_conntrack or disk capacity problems to dig. Yes: you can disable it and use Privileged conteiner in pod. But this way it's just faster.
  remote_access {
    ec2_ssh_key = aws_key_pair.devops_lab_8.key_name
    source_security_group_ids = [aws_security_group.lab_8.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.lab_8_WorkerNodePolicy,
    aws_iam_role_policy_attachment.lab_8_CNI_Policy,
    aws_iam_role_policy_attachment.lab_8_EC2ContainerRegistryReadOnly,
  ]

  tags = {
    Name = var.env
  }
}