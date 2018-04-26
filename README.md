# Scripts for Istio installation on Ubuntu system

* 1_install_k8s_master.sh :Install k8s master node using kubeadmin
* 2_install_k8s_minion.sh :Install k8s work node using kubeadmin
* 3_install_istio.sh      :Install Istio using helm
* Lable the namespace with istio-injection=enabled
  
  kubectl label namespace default istio-injection=enabled

Note: helm chart of 0.7.1 release has some bugs and can't be installed successfully when I try this script, please downlod the chart from istio master branch in githhub.

Istio chart download link: https://github.com/istio/istio/tree/master/install/kubernetes/helm/istio

