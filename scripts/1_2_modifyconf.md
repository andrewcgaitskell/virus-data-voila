    add
    
    host all  all    0.0.0.0/0 md5 to /etc/postgresql/10/main/pg_hba.conf
    
    add
    
    listen_addresses='*' to /etc/postgresql/10/main/postgresql.conf
    
    
    sudo nano /etc/postgresql/10/main/pg_hba.conf
    
    sudo nano /etc/postgresql/10/main/postgresql.conf

    sudo service postgresql restart

    open firewall port 5432
    
    
