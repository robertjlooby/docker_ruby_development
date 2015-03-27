FROM ubuntu:14.10
MAINTAINER Robert Looby "robertjlooby@gmail.com"
ENV REFRESHED_ON 2015-03-27

RUN apt-get update
RUN apt-get install -y curl

#Get RVM and some Rubies
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s stable
RUN echo "source /etc/profile.d/rvm.sh" >> /root/.bashrc
RUN /usr/local/rvm/bin/rvm install ruby-1.9.3
RUN /usr/local/rvm/bin/rvm install ruby-2.0.0
RUN /usr/local/rvm/bin/rvm install ruby-2.1.5
RUN /usr/local/rvm/bin/rvm install ruby-2.2.0
RUN /usr/local/rvm/bin/rvm alias create default ruby-2.1.5
