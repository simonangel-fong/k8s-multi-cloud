# outputs.tf

output "release_name" { value = helm_release.argocd.name }
output "release_namespace" { value = helm_release.argocd.namespace }
output "argocd_version" { value = helm_release.argocd.version }
