#Write-Output "Building Go app..."
#$Env:GOOS = "linux"
#$Env:GOARCH = "amd64"
#go build -o ./dist/

#Write-Output "Building Docker image..."
#docker build -t localhost/gocontainer:latest .

#Write-Output "Pushing Docker image to local registry..."
#docker push localhost/gocontainer:latest

Write-Output "Pulling remote image..."
docker pull ghcr.io/mattsmith13815/gok8s:main

Write-Output "Remove current deployment if it exists..."
kubectl delete deployment gocontainer-deployment

Write-Output "Deploying to Kubernetes..."
kubectl apply -f kube.yaml

Write-Output "Build and deployment complete!"
