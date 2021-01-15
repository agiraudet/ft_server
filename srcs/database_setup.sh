#!/bin/bash

#substitue to mysql_secure_installation 
service mysql start
mysql -u root <<_EOF_
	UPDATE mysql.user SET Password='pi' WHERE User='root';
	DELETE FROM mysql.user WHERE User='';
	DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
	DROP DATABASE IF EXIST test;
	DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
	FLUSH PRIVILEGES;
_EOF_

#create database
service mysql start
mysql -u root <<_EOF_
	CREATE DATABASE newdb;
	CREATE USER 'admin'@'localhost' IDENTIFIED BY 'pi';
	GRANT ALL PRIVILEGES ON newdb.* TO 'admin'@'localhost';
	FLUSH PRIVILEGES;
_EOF_
