# kiwi jenkins

## docs
* https://hub.docker.com/_/jenkins/

## manual build image
```
docker build -f ./Dockerfile --rm -t yren/kiwi-jenkins:2.60.3 .
```

## manual run
```
sudo mkdir -p /rt/jenkins_home
sudo chmod -R 777 /rt/jenkins_home
HOST_J_HOME="/rt/jenkins_home"

docker run -d --name="jenkins" \
-p 80:8080 -p 60000:50000 \
--restart=always \
-v $HOST_J_HOME:/var/jenkins_home/ \
-v /var/run/docker.sock:/var/run/docker.sock \
-e "HOST_J_HOME=${HOST_J_HOME}" \
yren/kiwi-jenkins:2.60.3
```

## push to docker hub
```
docker login
docker push yren/kiwi-jenkins:2.60.3
```
