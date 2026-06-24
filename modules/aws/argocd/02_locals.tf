# locals.tf

locals {
  default_values = yamlencode({
    server = {
      service = {
        type = "ClusterIP"
      }
    }
  })
}
