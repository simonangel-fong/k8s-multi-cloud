
```sh
helm repo add cilium https://helm.cilium.io/

helm upgrade -i cilium cilium/cilium \
  --namespace kube-system \
  --reuse-values \
  --set kubeProxyReplacement=true \
  --set gatewayAPI.enabled=true
```