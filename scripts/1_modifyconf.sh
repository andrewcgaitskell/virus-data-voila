#!/bin/bash

#Edit note name with double quotation e.g. "webserver01".
newNode="server211"

#Set OpenCanary Configuration File Path
openCanaryConfig="info.conf"
sed -i 's/\(^"device.node_id":\).*/\1 "'$newNode'",/' $openCanaryConfig
