Write-Output "Building Java App..."
cd java-tomcat-app
mvn clean package
cd ..

Write-Output "Building Docker Image..."
docker build -t java-tomcat-app:latest .

Write-Output "Clean up local..."
kubectl delete deployment java-tomcat-app
kubectl delete service java-tomcat-app

Write-Output "Deploy to Local Kubernete..."
kubectl apply -f java-tomcat-app/deployment.yaml
kubectl apply -f java-tomcat-app/service.yaml

Write-Output "Display running pods..."
kubectl get pods