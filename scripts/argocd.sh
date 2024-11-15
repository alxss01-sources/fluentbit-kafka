#!/bin/bash

start_server() {
    kubectl port-forward svc/argocd-server -n argocd 8080:443
}

password_admin() {
    printf "Capturando Password Admin\n"
    echo $(kubectl get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" -n argocd | base64 -d)
}

option=$1

case $option in 
    -s) echo "Start ArgoCD" start_server;;
    -p) password_admin ;;
     *) echo "Opção invávlida";;
esac