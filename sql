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
