FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y openssh-server docker.io sudo && \
    useradd -m -s /bin/bash blueuser && \
    echo 'blueuser:bluepass' | chpasswd && \
    usermod -aG docker blueuser && \
    mkdir /var/run/sshd

COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

EXPOSE 2233
CMD ["/setup.sh"] 