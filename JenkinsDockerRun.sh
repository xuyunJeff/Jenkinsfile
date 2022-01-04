
#mkdir /home/jenkins
docker run -p 9090:8080 -d --name jenkins -v /Users/mac/DevelopTools/jenkins-home:/var/jenkins_home jenkinsci/blueocean