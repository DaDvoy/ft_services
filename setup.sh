#!/bin/sh

kubectl delete deploy nginx-deployment
kubectl delete svc nginx-svc
kubectl delete deploy wp-deployment
kubectl delete svc wp-svc
kubectl delete deploy php-deployment
kubectl delete svc php-svc
kubectl delete deploy sql-deployment
kubectl delete svc mysql-svc
kubectl delete deploy grafana-deployment
kubectl delete svc grafana-svc
kubectl delete deploy influxdb-deployment
kubectl delete svc influxdb-svc
kubectl delete deploy ftps-deployment
kubectl delete svc ftps-svc


minikube delete
minikube start --vm-driver=virtualbox
minikube addons enable metallb
eval $(minikube docker-env)

kubectl apply -f ./srcs/config.yaml

docker build -t nginx_image     ./srcs/nginx/
docker build -t wp_image		    ./srcs/wp/
docker build -t mysql_image	    ./srcs/mysql/
docker build -t php_image		    ./srcs/php/
docker build -t ftps_image	    ./srcs/ftps/
docker build -t grafana_image	  ./srcs/grafana/
docker build -t influxdb_image	./srcs/influxdb/

kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/wp/wordpress.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/php/php.yaml
kubectl apply -f ./srcs/ftps/ftps.yaml
kubectl apply -f ./srcs/grafana/grafana.yaml
kubectl apply -f ./srcs/influxdb/influxdb.yaml

