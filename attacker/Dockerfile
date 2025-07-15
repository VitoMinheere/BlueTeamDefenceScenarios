FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y sshpass openssh-client

COPY attack.sh /attack.sh
RUN chmod +x /attack.sh

COPY finish.sh /finish.sh
RUN chmod +x /finish.sh

CMD ["/attack.sh"]