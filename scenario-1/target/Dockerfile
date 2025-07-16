FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y openssh-server sudo ufw iproute2 net-tools iputils-ping rsyslog && \
    useradd -m blueuser && echo 'blueuser:bluepass' | chpasswd && usermod -aG sudo blueuser

RUN mkdir /var/run/sshd

# Enable password authentication
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 22

CMD ["/entrypoint.sh"]