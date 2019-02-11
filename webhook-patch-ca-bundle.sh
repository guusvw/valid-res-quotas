#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

export CA_BUNDLE=$(kubectl get configmap -n kube-system extension-apiserver-authentication -o=jsonpath='{.data.client-ca-file}' | base64 | tr -d '\n')

sed -e "s|\${CA_BUNDLE}|${CA_BUNDLE}|g" k8s/webhook.yaml
