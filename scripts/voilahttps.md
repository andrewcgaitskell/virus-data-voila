
# add the fixed external ip to godaddy

An A record with www.example.com pointing to your server’s public IP address.

# sign into vm

  sudo su

  add-apt-repository ppa:certbot/certbot

You’ll need to press ENTER to accept. Then, update the package list to pick up the new repository’s package information.

# update packages

apt update

# install certbot's nginx 

And finally, install Certbot’s Nginx package with apt-get.

apt install python-certbot-nginx

Certbot is now ready to use, but in order for it to configure SSL for Nginx, we need to verify some of Nginx’s configuration.

copy /etc/nginx/sites-enabled/example.com /etc/nginx/sites-available/example.com

# verify the syntax of your configuration edits.

nginx -t

# generate and install keys

certbot --nginx -d example.com -d www.example.com

certbot --nginx -d acgdata.info -d www.acgdata.info

# back up keys

apt install zip

cd /etc/letsencrypt

ls

cd ..

zip -r letsencryptbackup.zip letsencrypt

download zip file to local drive

Notes from Original Posts
==========================


This runs certbot with the --nginx plugin, using -d to specify the names we’d like the certificate to be valid for.

If this is your first time running certbot, you will be prompted to enter an email address and agree to the terms of service. After doing so, certbot will communicate with the Let’s Encrypt server, then run a challenge to verify that you control the domain you’re requesting a certificate for.

If that’s successful, certbot will ask how you’d like to configure your HTTPS settings.

Output

Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.

1: No redirect - Make no further changes to the webserver configuration.
2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for
new sites, or if you're confident your site works on HTTPS. You can undo this

change by editing your web server's configuration.

Select the appropriate number [1-2] then [enter] (press 'c' to cancel):

Select your choice then hit ENTER. The configuration will be updated, and Nginx will reload to pick up the new settings. certbot will wrap up with a message telling you the process was successful and where your certificates are stored:

Output
IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at
   /etc/letsencrypt/live/example.com/fullchain.pem. Your cert will
   expire on 2017-10-23. To obtain a new or tweaked version of this
   certificate in the future, simply run certbot again with the
   "certonly" option. To non-interactively renew *all* of your
   certificates, run "certbot renew"
 - Your account credentials have been saved in your Certbot
   configuration directory at /etc/letsencrypt. You should make a
   secure backup of this folder now. This configuration directory will
   also contain certificates and private keys obtained by Certbot so
   making regular backups of this folder is ideal.
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le

Your certificates are downloaded, installed, and loaded. Try reloading your website using https:// and notice your browser’s security indicator. It should indicate that the site is properly secured, usually with a green lock icon. If you test your server using the SSL Labs Server Test, it will get an A grade.

Let’s finish by testing the renewal process.
Step 5 — Verifying Certbot Auto-Renewal

Let’s Encrypt’s certificates are only valid for ninety days. This is to encourage users to automate their certificate renewal process. The certbot package we installed takes care of this for us by adding a renew script to /etc/cron.d. This script runs twice a day and will automatically renew any certificate that’s within thirty days of expiration.

To test the renewal process, you can do a dry run with certbot:

    sudo certbot renew --dry-run

If you see no errors, you’re all set. When necessary, Certbot will renew your certificates and reload Nginx to pick up the changes. If the automated renewal process ever fails, Let’s Encrypt will send a message to the email you specified, warning you when your certificate is about to expire.
Conclusion

In this tutorial, you installed the Let’s Encrypt client certbot, downloaded SSL certificates for your domain, configured Nginx to use these certificates, and set up automatic certificate renewal. If you have further questions about using Certbot, their documentation is a good place to start.
