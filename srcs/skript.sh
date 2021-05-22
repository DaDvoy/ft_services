$!/bin/sh
#
#minikube delete
#minikube start --vm-driver=virtualbox
#minikube addons enable metallb
#eval $(minikube docker-env)

#//cd ./srcs
kubectl apply -f config.yaml

cd mysql
docker build -t mysql_image .
kubectl apply -f mysql.yaml
cd ../wordpress


docker build -t wp_image .
kubectl apply -f wordpress.yaml
cd ../php

docker build -t php_image .
kubectl apply -f php.yaml
cd ../ftps

docker build -t ftps_image .
kubectl apply -f ftps.yaml
#//cd ../ph
#
#//kubect get pods
#//minikube delete pods
#//kubectl delete deploy nginx
#//kubectl describe pod
#//kubectl logs [podname]
#//minikube stop

#kubectl delete deploy wp-deployment
#kubectl delete svc wp-svc
#
#kubectl delete deploy php-deployment
#kubectl delete svc php-svc
#
#kubectl delete deploy mysql-deployment
#kubectl delete svc mysql-svc
