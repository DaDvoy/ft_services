# ft_services

***FIRST STEP***

1) install brew - `"curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh"`
2) Проверить что docker установлен
3) `"brew install minikube"` (если minikube не устанавливается, или устанавливается но его нет на терминале, его можно скачать вот так: 
`"curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 && chmod +x minikube"`
- это инфа с оф.сайта kubernetes, после этого "mv minikube .minikube", и дальше по инструкции ниже)
4) mv .brew/.minikube ./goinfre
5) `ln -s ./goinfre/.minikube .minikube`
6) `ln -s ./goinfre/.brew .brew`


***----***

**Docker**

Узнать ID контейнера:

 - `docker ps`

Узнать IP контейнера:

 - `docker inspect service_name | grep "IPAddress"`
 
 service_name - ID контейнера
 
 IPAddress - так и пишется, ничего не нужно вставлять
 
***---***
