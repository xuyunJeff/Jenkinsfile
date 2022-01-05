
#mkdir /home/jenkins
docker run -p 9090:8080 -d --name jenkins -v /Users/mac/DevelopTools/jenkins-home:/var/jenkins_home jenkinsci/blueocean

https://blog.csdn.net/weigang200820chengdu/article/details/97034996
docker volume create --name nexus-data
docker run -d -p 8081:8081 --name nexus -v nexus-data:/nexus-data sonatype/nexus3

docker logs -f nexus