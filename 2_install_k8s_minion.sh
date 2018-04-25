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

read -p "Install helm (y/n)?" -n1 choice
case "$choice" in
  y|Y ) 
    wget https://storage.googleapis.com/kubernetes-helm/helm-v2.8.2-linux-amd64.tar.gz 
    tar -zxvf helm-v2.8.2-linux-amd64.tar.gz
    chmod o+x linux-amd64/helm
    mv linux-amd64/helm /usr/local/bin/helm
    rm -rf linux-amd64
    rm -rf helm-v2.8.2-linux-amd64.tar.gz
    ;;
esac
printf "\n"

cat << EOF
########################################################################################################################
1. You can now join this machines by running "kubeadmin join" command as root:
Please note that this is just an example, please refer to the output of the "kubeamin init" when cteating the k8s master for the exact comand to use in your k8s cluter!!!
  kubeadm join 10.12.6.108:6443 --token 43utwe.inl7h8dxn26p26iv --discovery-token-ca-cert-hash sha256:54cc1bcf72218de70c6b98edf4d486f79fb6d921a92ac5b7d10c76dbf96d006f

2. If you would like to get kubectl talk to your k8s master, you need to copy the dministrator kubeconfig file from your master to your workstation like this:

scp root@<master ip>:/etc/kubernetes/admin.conf .
kubectl --kubeconfig ./admin.conf get nodes

or you can manually copy the content of this file to ~/.kube/conf if scp can't be used due to security reason.
########################################################################################################################

EOF
