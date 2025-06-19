## Develop Program
This simple app creates a hello world web server using the programming language Go, HTML & Pico CSS. THe powershell will build the go app and deploy to a local instance of Kubernetes. Not intended for production use. 

## Developer Setup
1. Install GO           https://go.dev/doc/install   
2. Install Java         https://jdk.java.net/24/
3. Install Maven        https://maven.apache.org/download.cgi
4. Install Docker       https://docs.docker.com/desktop/setup/install/windows-install/
5. Enable Kubernetes
    a. Gear > Kubernetes > flip switch
    b. Apply & Restart inside Docker
6. Pull project to local location
7. Baseline: 
    .\build_and_deploy.ps1 
    open http://localhost:8081 in a brower 

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
.\build_and_deploy_java.ps1

## Java App
cd java-tomcat-app
mvn clean package
cd ..
docker build -t java-tomcat-app:latest .
docker run -p 8081:8080 java-tomcat-app

kubectl delete deployment java-tomcat-app
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

kubectl get deployments

kubectl get pods
kubectl get services

