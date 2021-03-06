#!/bin/bash

config=$1

if [ -z "$config" ]; then
    config="-conf=deviceconf.yml"
fi;

if [ ! -f $GOPATH/bin/devicehive-cloud ]; then
	echo "devicehive-cloud package not found. Installing it now..."
	go get github.com/devicehive/IoT-framework/devicehive-cloud
	cd $GOPATH/src/github.com/devicehive/IoT-framework/devicehive-cloud
	go install
	echo "Installation of devicehive-cloud complete. Running application..."
fi

cd .
$GOPATH/bin/devicehive-cloud $config
