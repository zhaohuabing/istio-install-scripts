# Scripts for Istio installation on Ubuntu system

* Install k8s master node using kubeadmin
 
  1_install_k8s_master.sh
* Install k8s work node using kubeadmin
  
  2_install_k8s_minion.sh
* Install Istio using helm
  
  ***Note***: 
  * Helm chart of 0.7.1 release has some bugs and can't be installed successfully when I try this script, if it isn't fixed yet,please downlod the chart from istio master branch in githhub and use it instead.Download link: https://github.com/istio/istio/tree/master/install/kubernetes/helm/istio
  * Modify install/kubernetes/helm/istio/values.yaml to 
    * Enable sidecar-injector
    * Install addones sucha as grafana, prometheus, servicegraph and zipkin
    * Add nodeports to access grafana and zipkin from outside of k8s cluster
  
  3_install_istio.sh
* Lable the namespaces in which you want to enable auto sidecar injection
  
  kubectl label namespace default istio-injection=enabled

There is an example values.yaml file in this repo. 


References:
[Installing the Istio Sidecar](https://preliminary.istio.io/docs/setup/kubernetes/sidecar-injection.html)
[Installation with Helm](https://preliminary.istio.io/docs/setup/kubernetes/helm-install.html)
