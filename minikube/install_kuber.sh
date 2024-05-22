#!/bin/bash

# Update names of the nodes you need to install kubernetes on
NODES=("controller" "worker-1")

for NODE in "${NODES[@]}"; do
    echo "Installing Kubernetes on $NODE"

    vagrant ssh $NODE -- "
        sudo apt-get update

        sudo apt-get install -y apt-transport-https curl

        mkdir /etc/apt/keyrings

        echo \"deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /\" | sudo tee /etc/apt/sources.list.d/kubernetes.list

        curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

        sudo apt-get update
        
        sudo apt-get install -y kubelet kubeadm kubectl

        sudo apt-mark hold kubelet kubeadm kubectl
    "
done
