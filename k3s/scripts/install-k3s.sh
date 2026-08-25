#!/bin/bash
set -euxo pipefail

systemctl enable --now amazon-ssm-agent

curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL=stable sh -s - server \
  --write-kubeconfig-mode 644 \
  --node-name k3s-server

until k3s kubectl get nodes 2>/dev/null | grep -q ' Ready '; do sleep 5; done
k3s kubectl get nodes -o wide > /var/log/k3s-ready.log 2>&1