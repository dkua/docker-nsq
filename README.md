Allows communication between nsqd and nsqlookupd on separate docker containers.

This image was tested to work with the [official nsqdlookupd image](https://registry.hub.docker.com/u/mreiferson/nsqlookupd/).

To run: 
    docker run --name nsqd -p 4150:4150 -p 4151:4151 -e BROADCAST_ADDRESS=my.public.host.ip -e LOOKUPD_ADDRESS=<host>:<port> rexposadas/nsqd

The biggest change from the official one is the passing of the environment variable to connect to nsqlookupd.
