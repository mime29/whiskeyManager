psql postgres
postgres=# \du
postgres=# \password postgres
postgres=# CREATE ROLE postgres WITH LOGIN PASSWORD 'niania';
postgres=# \du
postgres=# ALTER ROLE postgres CREATEDB;
postgres=# CREATE DATABASE whiskeyrocks;
postgres=# GRANT ALL PRIVILEGES ON DATABASE whiskeyrocks TO postgres;

import sql file to postgres
psql -d whiskeyrocks -U username -f db.sql
