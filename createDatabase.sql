CREATE DATABASE IF NOT EXISTS assignment;
USE assignment;
CREATE TABLE IF NOT EXISTS user_table (user_id int(3) unsigned zerofill not null auto_increment primary key, first_name varchar(30) not null, last_name varchar(30) not null, username  varchar(30) not null, date_of_birth DATE, country varchar(20), college_name varchar(50), password varchar(250), unique(username));
EXPLAIN user_table;