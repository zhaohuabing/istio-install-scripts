#!/bin/bash

wget https://github.com/istio/istio/releases/download/0.7.1/istio-0.7.1-linux.tar.gz
tar -zxvf istio-0.7.1-linux.tar.gz 
rm -rf istio-0.7.1-linux.tar.gz
kubectl create -f istio-0.7.1/install/kubernetes/helm/helm-service-account.yaml
helm init --service-account tiller
helm version
helm install istio-0.7.1/install/kubernetes/helm/istio --name istio --namespace istio-system
