FROM jenkins/jenkins:latest
## 현재 유저권한으로
USER $USER
## docker 설치
RUN curl -s https://get.docker.com/ | sh
## docker-compose 설치
RUN curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
## docker group 에 jenkins 추가
RUN usermod -aG docker jenkins
RUN apt-get install python3 -y
RUN apt-get install pip -y
