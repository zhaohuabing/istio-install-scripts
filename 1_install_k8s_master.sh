#!/bin/bash


echo "************install docker************"
apt-get update
apt-get install -y docker.io

echo "*************set up kubernetes apt-get source************"
apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update

read -p "Install kubelet (y/n)?" -n1 choice
case "$choice" in
  y|Y ) apt-get install -y kubelet;;
esac
printf "\n"


read -p "Install kubelet (y/n)?" -n1 choice
case "$choice" in
  y|Y ) apt-get install -y kubelet;;
esac
printf "\n"

read -p "Install kubeadm (y/n)?" -n1 choice
case "$choice" in
  y|Y ) apt-get install -y kubeadm;;
esac
printf "\n"

read -p "Install kubectl (y/n)?" -n1 choice
case "$choice" in
  y|Y ) apt-get install -y kubectl;;
esac
printf "\n"

kubeadm init --config kubeadm.conf --dry-run

read -p "Create kubernetees master(y/n)?" -n1 choice
case "$choice" in
  y|Y ) 
    kubeadm init --config kubeadm.conf
    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config
    sudo chmod o+wr  /home/ubuntu/.kube/config
    ;;
esac
printf "\n"

read -p "Install calico network plugin (y/n)?" -n1 choice
case "$choice" in
  y|Y ) kubectl apply -f https://docs.projectcalico.org/v2.6/getting-started/kubernetes/installation/hosted/kubeadm/1.6/calico.yaml;; 
esac
printf "\n"

read -p "Install helm (y/n)?" -n1 choice
case "$choice" in
  y|Y ) 
    wget https://storage.googleapis.com/kubernetes-helm/helm-v2.8.2-linux-amd64.tar.gz 
    tar -zxvf helm-v2.8.2-linux-amd64.tar.gz
    chmod o+x linux-amd64/helm
    mv linux-amd64/helm /usr/local/bin/helm
    ;;
esac
printf "\n"
