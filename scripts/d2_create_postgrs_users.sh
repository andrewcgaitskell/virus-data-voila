psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"

psql -c "CREATE EXTENSION adminpack;"

psql -c "CREATE ROLE pythonuser WITH LOGIN SUPERUSER INHERIT CREATEDB CREATEROLE NOREPLICATION PASSWORD 'pythonuser';"

psql -c "CREATE DATABASE data WITH OWNER 'pythonuser';"
