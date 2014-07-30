# docker-nsq

This repo is a fork of [rexposadas' nsqd image](https://github.com/rexposadas/nsqd) and contains docker images for
the most up to date NSQ binaries: nsqd, nsqlookupd, and nsqadmin.

The link to the most up to date binaries for NSQ can be found here on the official site [http://nsq.io/deployment/installing.html](http://nsq.io/deployment/installing.html).

To run: 

    docker run --name nsqd -p 4150:4150 -p 4151:4151 
        -e BROADCAST_ADDRESS=my.public.host.ip 
        -e LOOKUPD_ADDRESS=<host>:<port> 
        dkua/nsqd

The biggest change from the official one is the passing of env variables to connect to nsqlookupd.
The official NSQ Docker images haven't been updated in a while and the source couldn't be updated.

Once you have nsqd and nsqlookup connection you can test your installation. Assuming that your docker host is on `172.17.42.1`
you can send messages to nsqd like so:

    curl -d 'hello world 1' 'http://172.17.42.1:4151/put?topic=test'

See your message:

    watch -n 0.5 "curl -s http://172.17.42.1:4151/stats"

Questions? david@kua.io / @davidkua
