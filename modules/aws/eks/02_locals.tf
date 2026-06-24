# locals.tf

locals {
  eks_log_types       = ["api", "audit"]
  public_access_cidrs = ["0.0.0.0/0"]
}
