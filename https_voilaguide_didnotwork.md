started 

https://voila.readthedocs.io/en/latest/deploy.html#running-voila-on-a-private-server

Enable HTTPS with Let’s Encrypt

Install certbot:

sudo su

add-apt-repository ppa:certbot/certbot

apt update

apt upgrade

apt install python-certbot-nginx

Obtain the certificates from Let’s Encrypt. The --nginx flag will edit the nginx configuration automatically:

sudo certbot --nginx -d yourdomain.com

certbot --nginx -d andrewcgaitskell.com

/etc/nginx/sites-enabled/yourdomain.com should now contain a few more entries:

cat /etc/nginx/sites-enabled/yourdomain.com

...
listen 443 ssl; # managed by Certbot
ssl_certificate /etc/letsencrypt/live/yourdomain.com/fullchain.pem; # managed by Certbot
ssl_certificate_key /etc/letsencrypt/live/yourdomain.com/privkey.pem; # managed by Certbot
include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
...
Visit https://yourdomain.com to access the voila applications over HTTPS.

To automatically renew the certificates (they expire after 90 days), open the crontab file:

crontab -e
And add the following line:

0 12 * * * /usr/bin/certbot renew --quiet
