FROM ubuntu:25.04

RUN apt-get update && \
    apt-get install -y openssh-server gcc g++ cmake gdb sudo && \
    useradd -m -s /bin/bash lgx && \
    echo 'lgx:3200102764' | chpasswd && \
    usermod -aG sudo lgx && \
    mkdir -p /var/run/sshd && \
    ssh-keygen -A && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    apt-get clean

EXPOSE 22 27640

CMD ["/usr/sbin/sshd", "-D"]