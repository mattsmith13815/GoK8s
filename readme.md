## Develop Program
This simple app creates a hello world web server using the programming language Go

## Build application for Linux
set GOOS=linux
set GOARCH=amd64
go build -o .

## Linux start command
/gocontainer

## Build Container Image
docker build -t localhost/gocontainer:latest .

## Run Containers in Kubernetes
kubectl apply -f kube.yaml

## Get Details 
kubectl get pods
kubectl get service

## Remove deployment
kubectl delete deployment gocontainer-deployment

## Single Build Command:
.\build_and_deploy.ps1

## Remote Registry for Container Images?
To Do