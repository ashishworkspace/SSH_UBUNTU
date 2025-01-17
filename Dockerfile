FROM ubuntu:latest

RUN apt update && apt install  openssh-server sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test

RUN  echo 'test:test' | chpasswd

RUN service ssh start

RUN ssh-keygen -A

RUN rm -rf /run/nologin

CMD ["/usr/sbin/sshd","-D"]

EXPOSE 22
