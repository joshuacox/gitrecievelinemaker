FROM debian:wheezy
MAINTAINER Josh Cox <josh 'at' webhosting.coop>

ENV DEBIAN_FRONTEND noninteractive

#ADD proxytest /tmp/
# test oltorf proxy
#RUN bash /tmp/proxytest
RUN echo 'Acquire::http::Proxy "http://65.67.51.187:3142";'>>/etc/apt/apt.conf
RUN apt-get -y update
RUN apt-get -y dist-upgrade
RUN apt-get -y install python-software-properties curl build-essential libxml2-dev libxslt-dev git ruby1.9.1-dev ca-certificates sudo net-tools vim
RUN apt-get -y install wget

ADD ./start.sh /start.sh
ADD ./id_rsa.pub /id_rsa.pub
RUN cd /usr/local/bin; wget https://raw.github.com/progrium/gitreceive/master/gitreceive; chmod +x /usr/local/bin/gitreceive
RUN useradd -m -G users -s /bin/bash git; mkdir /home/git;chown git. /home/git
ADD ./ssh /home/git/.ssh
RUN chmod 700 -R /home/git/.ssh
RUN chmod 600 -R /home/git/.ssh/id_rsa
RUN chmod 600 -R /home/git/.ssh/id_rsa.pub

ENV TARGETUSER ENTER_YOUR_USERNAME_HERE
ENV TARGETREPO ENTER_YOUR_REPO_HERE
RUN cd /usr/local ; git clone $TARGETREPO keys
RUN cd /usr/local/keys/.git
RUN sed -i 's/https:\/\/github.com\//git@github.com:/' /usr/local/keys/.git/config

RUN chmod 755 /start.sh
EXPOSE 80
CMD ["/bin/bash", "/start.sh"]
