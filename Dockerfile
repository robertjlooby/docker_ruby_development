FROM ubuntu:14.10
MAINTAINER Robert Looby "robertjlooby@gmail.com"
ENV REFRESHED_ON 2015-03-27

RUN apt-get update
RUN apt-get install -yqq curl

RUN useradd -rm ruby_dev
RUN echo "ruby_dev ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers
USER ruby_dev

#Get RVM and some Rubies
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s stable
RUN /home/ruby_dev/.rvm/bin/rvm install ruby-1.9.3
RUN /home/ruby_dev/.rvm/bin/rvm install ruby-2.0.0
RUN /home/ruby_dev/.rvm/bin/rvm install ruby-2.1.5
RUN /home/ruby_dev/.rvm/bin/rvm install ruby-2.2.0
RUN /home/ruby_dev/.rvm/bin/rvm alias create default ruby-2.1.5

WORKDIR /home/ruby_dev
