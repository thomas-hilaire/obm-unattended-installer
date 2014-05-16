FROM debian:wheezy


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade --assume-yes && apt-get dist-upgrade --assume-yes

RUN mkdir /root/.ssh/ && mkdir /var/run/sshd

ADD vagrant.pub /root/.ssh/authorized_keys

RUN chmod 400 /root/.ssh/authorized_keys && chown root:root /root/.ssh/authorized_keys

RUN apt-get install --assume-yes openssh-server

RUN apt-get install --assume-yes python-simplejson python-apt nano less syslog-ng

RUN rm /usr/sbin/policy-rc.d

ADD rc.local /etc/rc.local

ADD ssh_force_command /etc/ssh/ssh_force_command

RUN chmod +x /etc/rc.local /etc/ssh/ssh_force_command

RUN echo "ForceCommand /etc/ssh/ssh_force_command" >> /etc/ssh/sshd_config

EXPOSE 22
