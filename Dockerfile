FROM ubuntu:latest

RUN apt-get update \
&& apt-get install -y vim sudo wget \
&& apt-get clean

COPY ./client.rb ./client.pem /etc/chef/
COPY config_chef_waiter.json /etc/chefwaiter/config.json

RUN wget -O /tmp/chef.deb https://packages.chef.io/files/stable/chef/15.4.45/ubuntu/18.04/chef_15.4.45-1_amd64.deb \
&& dpkg -i /tmp/chef.deb \
&& rm -f /tmp/chef.deb

RUN wget -O /tmp/chefwaiter.tar.gz https://github.com/morfien101/chef-waiter/releases/download/v1.4.3/chef-waiter-linux-amd64-v1.4.3.tar.gz \
&& tar -xzf /tmp/chefwaiter.tar.gz \
&& mv $(find . | grep chef-waiter$) /chef-waiter \
&& rm -f /tmp/chefwaiter.tar.gz


ENTRYPOINT [ "/chef-waiter" ]