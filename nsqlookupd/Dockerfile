FROM ubuntu
MAINTAINER David Kua <david@kua.io>
 
RUN apt-get update
RUN apt-get -y install wget tar ca-certificates
RUN wget https://s3.amazonaws.com/bitly-downloads/nsq/nsq-0.2.30.linux-amd64.go1.3.tar.gz
RUN tar zxvf nsq-0.2.30.linux-amd64.go1.3.tar.gz
RUN mkdir -p /usr/local/bin
RUN cp /nsq-0.2.30.linux-amd64.go1.3/bin/nsqlookupd /usr/local/bin
 
EXPOSE 4160
EXPOSE 4161
CMD /usr/local/bin/nsqlookupd --broadcast-address=$BROADCAST_ADDRESS
