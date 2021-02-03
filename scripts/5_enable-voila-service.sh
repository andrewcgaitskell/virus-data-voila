apt install nginx

mkdir /etc/systemd/system/nginx.service.d
printf "[Service]\nExecStartPost=/bin/sleep 0.1\n" > /etc/systemd/system/nginx.service.d/override.conf
systemctl daemon-reload
systemctl restart nginx 
cp /home/jupyterlab/virus-data-voila/scripts/andrewcgaitskell.com /etc/nginx/sites-enabled/andrewcgaitskell.com
systemctl enable nginx.service
systemctl start nginx.service

mkdir /usr/lib/systemd/system
cp /home/jupyterlab/virus-data-voila/voila.service /usr/lib/systemd/system/voila.service

systemctl enable voila.service
systemctl start voila.service
