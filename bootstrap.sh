#!/usr/bin/env bash


sudo apt-get update

sudo apt-get install vim curl zip unzip git python-pip -y -q
sudo apt-get install -y openjdk-7-jdk

curl -L http://downloads.datastax.com/community/dsc-cassandra-2.0.9-bin.tar.gz | tar xz
sudo mkdir /var/lib/cassandra
sudo mkdir /var/log/cassandra

# change address from localhost to 0.0.0.0 so that we can connect to cassandra remotely
sudo sed -i 's/^rpc_address: localhost/rpc_address: 0.0.0.0/' /home/vagrant/dsc-cassandra-2.0.9/conf/cassandra.yaml

sudo ./dsc-cassandra-2.0.9/bin/cassandra

while netstat -lnt | awk '$4 ~ /:9160$/ {exit 1}'; do sleep 10; done
sudo ./dsc-cassandra-2.0.9/bin/cqlsh -f /vagrant/cassandra/init.cql

echo 'PATH=$PATH:/home/vagrant/dsc-cassandra-2.0.9/bin/' >> .bashrc
echo 'export PATH' >> .bashrc



