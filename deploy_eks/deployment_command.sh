# deploy
kubectl apply -f aws-secret.yaml
kubectl apply -f env-secret.yaml
kubectl apply -f env-configmap.yaml

kubectl apply -f udagram-api-user-deployment.yaml
kubectl apply -f udagram-api-feed-deployment.yaml
kubectl apply -f udagram-frontend-deployment.yaml
kubectl apply -f reverseproxy-deployment.yaml

kubectl apply -f udagram-api-user-service.yaml
kubectl apply -f udagram-api-feed-service.yaml
kubectl apply -f udagram-frontend-service.yaml
kubectl apply -f reverseproxy-service.yaml

kubectl expose deployment udagram-frontend --type=LoadBalancer --name=publicfrontend
kubectl expose deployment reverseproxy --type=LoadBalancer --name=publicreverseproxy

kubectl get services

# copy link
kubectl set image deployment udagram-frontend udagram-frontend=psybinh/udagram-frontend

# git push
git add .
git commit -m "dsafsdfsdf"
git push origin circleci

# delete
kubectl delete deployments reverseproxy udagram-api-feed udagram-api-user udagram-frontend
kubectl delete services publicfrontend publicreverseproxy