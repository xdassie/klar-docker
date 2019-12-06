#!/bin/sh
unset DOCKER_TOKEN # don't send this out over the internet
while true; do /klar quay.io/xdassie/klar:latest; sleep 600; done;
