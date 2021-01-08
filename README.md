# Running voila on a private server

started with:

        https://voila.readthedocs.io/en/latest/deploy.html#running-voila-on-a-private-server
        
## Prerequisites

A server running Ubuntu 18.04 (or later) with root access.

Ability to SSH into the server and run commands from the prompt.

The public IP address of the server.

A domain name pointing to the IP address of the server.

## Very important

Everything must be run as su, including the noteook installation.

## Create the virtual machine on the Google Console

    select Ubuntu 18.04 LTS
    Change networking to standard and fix the external IP
    
    Enable HTTP and HTTPS

    Enable Port Forwarding

    Open Firewall to 8866 ingress and egress

## SSH into the server:

## change to root:

sudo su

## Install nginx:

apt install nginx

## Check nginx correctly installed:

systemctl status nginx

## if you get an error

        mkdir /etc/systemd/system/nginx.service.d
        printf "[Service]\nExecStartPost=/bin/sleep 0.1\n" > /etc/systemd/system/nginx.service.d/override.conf
        systemctl daemon-reload
        systemctl restart nginx 

## enable site 

nano /etc/nginx/sites-enabled/yourdomain.com

paste the following content:

    server {
        listen 80;
        server_name yourdomain.com;  ####### change this
        proxy_buffering off;
        location / {
                proxy_pass http://localhost:8866;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection "upgrade";
                proxy_read_timeout 86400;
        }

        client_max_body_size 100M;
        error_log /var/log/nginx/error.log;
    }

## Enable and start the nginx service:

    systemctl enable nginx.service
    systemctl start nginx.service

## Install pip:

    apt update
    apt upgrade

    apt install python3-pip

## Setup an example project

    cd /home/ubuntu

    git clone https://github.com/voila-dashboards/voila.git

    cd voila

    nano requirements.txt

paste

    bqplot
    ipympl
    ipyvolume
    scipy
    voila

save control x then Y

## install the dependencies:

    python3 -m pip install -r requirements.txt

## Create script to run Voila to avoid the following error

    https://superuser.com/questions/1238471/systemd-error-executable-path-is-not-absolute

## Shell Script to Run Voila for one dashboard

    cd /home/ubuntu/voila

    nano voilascript.sh

    paste following:

    voila --no-browser /home/ubuntu/voila/notebooks/basics.ipynb

    ctrl x Y

    chmod +x voilascript.sh

## Shell Script to Run Voila for Folder of Dashboards

    cd /home/ubuntu/voila

    nano voilascript.sh

    paste following:

    voila --no-browser /home/ubuntu/voila/notebooks/

    ctrl x Y

    chmod +x voilascript.sh

## Create a new systemd service for running voila

    mkdir /usr/lib/systemd/system
    cd /usr/lib/systemd/system

    nano voila.service

The service will ensure voila is automatically restarted on startup:

        [Unit]
        Description=Voila

        [Service]
        Type=simple
        PIDFile=/run/voila.pid
        ExecStart=/bin/bash /home/ubuntu/voila/voilascript.sh
        User=ubuntu
        WorkingDirectory=/home/ubuntu/
        Restart=always
        RestartSec=10

        [Install]
        WantedBy=multi-user.target


control x Y


In this example voila is started with voila --no-browser voila/notebooks/basics.ipynb to serve a single notebook. You can edit the command to change this behavior and the notebooks voila is serving.

## Enable and start the voila service:

    sudo systemctl enable voila.service
    sudo systemctl start voila.service


Note

## To check the logs for voila:

    journalctl -u voila.service

## Go to Domain

Now go to yourdomain.com:8866 to access the voila application.

    http://yourdomain.com:8866
    
    http://andrewcgaitskell.com:8866
# voila_current
