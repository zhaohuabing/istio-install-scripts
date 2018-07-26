#!/bin/bash
wget https://github.com/istio/istio/releases/download/0.8.0/istio-0.8.0-linux.tar.gz
tar -zxvf istio-0.8.0-linux.tar.gz
rm -rf istio-0.8.0-linux.tar.gz
sudo cp istio-0.8.0/bin/istioctl /usr/bin/
rm -rf istio-0.8.0

kubectl apply -f istio.yaml
