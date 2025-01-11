#!/bin/bash
PORTS=(
    "4444"
    "2222"
)

PORT_ARGS=""
for PORT in "${PORTS[@]}"; do
    PORT_ARGS+="-p $PORT:$PORT "
done

sudo docker build -t agent .
sudo apparmor_parser -r -W docker-network
sudo docker run --cap-add=NET_ADMIN --net=host --privileged --rm -it $PORT_ARGS --security-opt apparmor=docker-network --name agent agent
