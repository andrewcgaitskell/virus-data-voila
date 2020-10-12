#!/bin/bash
##sudo echo "host all  all    0.0.0.0/0 md5" >> /etc/postgresql/10/main/pg_hba.conf
##sudo echo "listen_addresses='*'" >> /etc/postgresql/10/main/postgresql.conf


sed 's/UK/GB/' test.txt > newfile.txt

sed 's/127.0.0.1/0.0.0.0/' /etc/postgresql/10/main/pg_hba.conf > /etc/postgresql/10/main/pg_hba_new.conf


#Edit note name with double quotation e.g. "webserver01".
newIP="0.0.0.0/0"

#Set OpenCanary Configuration File Path
openCanaryConfig="/etc/postgresql/10/main/pg_hba.conf"
sed -i 's/\(^"device.node_id":\).*/\1 "'$newNode'",/' $openCanaryConfig
