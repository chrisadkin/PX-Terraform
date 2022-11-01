
module "eks_cluster" {
  region            = var.region
  ec2_instance_type = var.ec2_instance_type
  cluster_name      = var.cluster_name
  source            = "./modules/eks_cluster"
}

module "iam_policy" {
  nodegroup_iam_role = module.eks_cluster.nodegroup_iam_role 
  source             = "./modules/iam_policy"
}
