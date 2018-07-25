# Scripts to Install Kubernetes and Istio on Ubuntu

## Install k8s master node via kubeadmin

  1_install_k8s_master.sh
## Install k8s work node via kubeadmin

  2_install_k8s_minion.sh
## Install Istio via helm

  3_install_istio.sh
  
## Lable the namespaces in which you want to enable auto sidecar injection
  
  kubectl label namespace default istio-injection=enabled

## References:
* [Installing the Istio Sidecar](https://preliminary.istio.io/docs/setup/kubernetes/sidecar-injection.html)
* [Istio Installation with Helm](https://preliminary.istio.io/docs/setup/kubernetes/helm-install.html)
