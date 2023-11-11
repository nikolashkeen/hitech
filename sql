ASTRA
apt install postgresql
su - postgres
psql
  
create database prod;
create database test;
create database dev;
create database zabbix;

create user produser with password 'P@ssw0rd';
create user devuser with password 'P@ssw0rd';
create user testuser with password 'P@ssw0rd';
create user admin with password 'P@ssw0rd';
create user dbadmin superuser;

alter user dbadmin with password 'P@ssw0rd';
alter database dev owner to devuser;
alter database prod owner to produser;
alter database test owner to testuser;
alter database zabbix owner to admin;

su - postgres
pgbench -i dev
pgbench -i test
pgbench -i prod

ALT
apt-get install postgresql11 postgresql11-server postgresql11-contrib
/etc/init.d/postgresql initdb
vim /var/lib/pgsql/data/postgresql.conf
# Ищем строчку, которая начинается на listen, раскомментируем и прописываем *
listen_addresses = '*'
vim /var/lib/pgsql/data/pg_hba.conf
Ищем строчку host со 127.0.0.1 и меняем на 0.0.0.0/0
host all all 0.0.0.0/0 trust
systemctl restart postgresql

psql -U postgres
