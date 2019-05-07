#!/bin/sh

# Creating Service Account Named "tiller"
kubectl -n kube-system create serviceaccount tiller

# Creating Cluster Role Binding of Cluster Admin Role for "tiller" Service Account 
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller

# Helm Init with "tiller" Service Account
helm init --service-account tiller

# Observing the status of "tiller" pod deployed in kube-system namespace 
kubectl get pods --namespace kube-system -w 
