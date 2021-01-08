adduser webuser

usermod -aG sudo webuser

chown -R webuser /var/www

exit

su webuser

cd /var/www

git clone 
