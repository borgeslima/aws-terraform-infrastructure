provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    token                  = module.eks.aws_eks_cluster_auth.token
  }
}

module "helm_release" {

  source = "./helm"

  for_each = var.helms

  helm_name             = each.value.name
  helm_repository       = each.value.repository
  helm_chart            = each.value.chart
  helm_namespace        = each.value.namespace
  helm_force_update     = each.value.force_update
  helm_create_namespace = each.value.create_namespace
  helm_version          = each.value.version
  helm_values           = each.value.values

  depends_on = [module.eks]
}