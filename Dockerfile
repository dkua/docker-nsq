FROM ubuntu
 
RUN apt-get update
RUN apt-get -y install wget tar ca-certificates
RUN wget https://s3.amazonaws.com/bitly-downloads/nsq/nsq-0.2.28.linux-amd64.go1.2.1.tar.gz
RUN tar zxvf nsq-0.2.28.linux-amd64.go1.2.1.tar.gz
RUN mkdir -p /usr/local/bin
RUN cp /nsq-0.2.28.linux-amd64.go1.2.1/bin/nsqd /usr/local/bin
 
RUN mkdir -p /data
VOLUME ["/data"]
EXPOSE 4150
EXPOSE 4151
CMD /usr/local/bin/nsqd --data-path=/data --broadcast-address=$BROADCAST_ADDRESS --lookupd-tcp-address=$LOOKUPD_ADDRESS
