    sudo echo "host all  all    0.0.0.0/0 md5" >> /etc/postgresql/10/main/pg_hba.conf
    
    sudo echo "listen_addresses='*'" >> /etc/postgresql/10/main/postgresql.conf
    
    sudo nano /etc/postgresql/10/main/pg_hba.conf
    
    sudo nano /etc/postgresql/10/main/postgresql.conf

    sudo service postgresql restart
