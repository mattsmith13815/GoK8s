## Develop Program
This simple app creates a hello world web server using the programming language Go, HTML & Pico CSS. THe powershell will build the go app and deploy to a local instance of Kubernetes. Not intended for production use. 

## Developer Setup
1. Install GO
2. Install Docker Desktop & enable Kubernetes
3. Pull project to local location
4. Baseline: run .\build_and_deploy.ps1 & open http://localhost:8080

## Build GO application for Linux
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

## To Do:
- Remote Registry push for Container Images