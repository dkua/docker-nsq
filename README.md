Allows communication between nsqd and nsqlookupd on separate docker containers.

This image was tested to work with the [official nsqdlookupd image](https://registry.hub.docker.com/u/mreiferson/nsqlookupd/).

To run: 

    docker run --name nsqd -p 4150:4150 -p 4151:4151 -e BROADCAST_ADDRESS=my.public.host.ip -e LOOKUPD_ADDRESS=<host>:<port> rexposadas/nsqd

The biggest change from the official one is the passing of the environment variable to connect to nsqlookupd.

Once you have nsqd and nsqlookup connection you can test your installation. Given that your docker host is on `172.17.42.1`
you can send messages to nsqd like so:

    curl -d 'hello world 1' 'http://172.17.42.1:4151/put?topic=test'

See your message:

    watch -n 0.5 "curl -s http://172.17.42.1:4151/stats"

Questions? rexposadas@yahoo.com  / @rexposadas
