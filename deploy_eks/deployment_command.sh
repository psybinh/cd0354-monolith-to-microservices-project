# deploy
kubectl apply -f aws-secret.yaml
kubectl apply -f env-secret.yaml
kubectl apply -f env-configmap.yaml

kubectl apply -f backend-user-deployment.yaml
kubectl apply -f backend-feed-deployment.yaml
kubectl apply -f frontend-deployment.yaml
kubectl apply -f reverseproxy-deployment.yaml

kubectl apply -f backend-user-service.yaml
kubectl apply -f backend-feed-service.yaml
kubectl apply -f frontend-service.yaml
kubectl apply -f reverseproxy-service.yaml

kubectl expose deployment udagram-frontend --type=LoadBalancer --name=publicfrontend
kubectl expose deployment udagram-reverseproxy --type=LoadBalancer --name=publicreverseproxy

kubectl get services

# git push
git add .
git commit -m "dsafsdfsdf"
git push origin circleci

# copy link
docker build . -t psybinh/udagram-frontend:v6
docker push psybinh/udagram-frontend:v6
kubectl set image deployment udagram-frontend udagram-frontend=psybinh/udagram-frontend:v6

# delete
kubectl delete deployments udagram-api-feed udagram-reverseproxy udagram-api-user udagram-frontend
kubectl delete services publicfrontend publicreverseproxy