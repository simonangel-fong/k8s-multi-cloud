# main.tf

# ##############################
# Argo CD
# ##############################
resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.argocd_version
  namespace  = var.namespace

  create_namespace = true

  values = compact([
    local.default_values,
    var.extra_values,
  ])

  atomic        = false
  wait          = false
  wait_for_jobs = false
  timeout       = 600
}
