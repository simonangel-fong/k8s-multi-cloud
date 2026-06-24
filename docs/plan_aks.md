# AKS: Terraform

Provision AKS on Azure, mirroring the `infra/aws` + `modules/aws` layout.

- **Root:** `infra/az/`
- **Modules:** `modules/az/aks/`
- **State:** S3, key `k8s-multi-cloud/az/terraform.tfstate`

## Layout

Each Terraform dir uses the same file split as `infra/aws`:

```
01_variables.tf
02_locals.tf
03_providers.tf
04_outputs.tf
05_main.tf
```

## Resources

| Resource | Key settings                                   |
| -------- | ---------------------------------------------- |
| RG       | name, location, tags                           |
| VNet     | CIDR sized for AKS pod/node scale; subnet      |
| AKS      | system-assigned identity; default node pool    |

---

## Phases

| #   | Goal     | Done when                                                                  |
| --- | -------- | -------------------------------------------------------------------------- |
| 00  | Init     | Files scaffolded; backend configured; `terraform init` succeeds            |
| 01  | Network  | RG + VNet + subnet applied; outputs exposed                                |
| 02  | AKS      | Cluster + default node pool Running; `az aks get-credentials` works        |
| 03  | Argo CD  | Local Argo CD registers AKS; app-of-apps (`argocd/00-root.yaml`) deployed  |

---

## Out of Scope (this stage)

- Private API server
- Multi-AZ / multi-region
- Workload identity, network policies, TLS

---

## Note

```sh
terraform -chdir=infra/az init -backend-config=backend.hcl -reconfigure
terraform -chdir=infra/az fmt && terraform -chdir=infra/az validate
terraform -chdir=infra/az plan
terraform -chdir=infra/az apply -auto-approve

terraform -chdir=infra/az destroy -auto-approve

az network vnet list --resource-group multi-cloud-k8s-dev

az aks get-credentials --resource-group <rg> --name <cluster>
kubectl get nodes

argocd cluster add <aks-context>
kubectl apply -f argocd/00-root.yaml
```
