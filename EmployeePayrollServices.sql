Employee Payroll Services MySql Queries...
==============================================================================================================================
UC1_Create Databse,Show Database,Use PayRollServices


MySQL  localhost:3306 ssl  SQL > create database employeepayrollservices;
Query OK, 1 row affected (0.1955 sec)
 MySQL  localhost:3306 ssl  SQL > show databases;
+-------------------------+
| Database                |
+-------------------------+
| address_book_service    |
| addressbookservice      |
| bookstoredb             |
| dbname                  |
| demo                    |
| employeedb              |
| employeepayrollservices |           
| information_schema      |
| mysql                   |
| payroll_services        |
| performance_schema      |
| sakila                  |
| simple                  |
| stud                    |
| sys                     |
| user                    |
| world                   |
+-------------------------+
19 rows in set (0.0022 sec)

==================================================================================================================================================
UC2_Use Database 

MySQL  localhost:3306 ssl  SQL > use employeepayrollservices;
Default schema set to `employeepayrollservices`.
Fetching table and column names from `employeepayrollservices` for auto-completion... Press ^C to stop.
 MySQL  localhost:3306 ssl  employeepayrollservices  SQL >


===================================================================================================================================================
UC3_Insert Values Into Employee_payroll table

MySQL  localhost:3306 ssl  employeepayrollservices  SQL > create table employee_payroll(
                                                        -> id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                                        -> name VARCHAR(30) NOT NULL,
                                                        -> salary DOUBLE NOT NULL,
                                                        -> start DATE NOT NULL,
                                                        -> PRIMARY KEY (id)
                                                        -> );
Query OK, 0 rows affected (0.5942 sec)
Records: 3  Duplicates: 0  Warnings: 0

 MySQL  localhost:3306 ssl  employeepayrollservices  SQL > select * from employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(30)  | NO   |     | NULL    |                |
| gender | char(1)      | YES  |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+

====================================================================================================================================================

UC4_Retrive all the data from the table


Records: 3  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  employeepayrollservices  SQL > select *from employee_payroll;
+----+----------+--------+------------+
| id | name     | salary | start      |
+----+----------+--------+------------+
|  1 | Mohin    | 600000 | 2021-06-26 |
|  2 | Prashant | 700000 | 2021-07-27 |
|  3 | Rushi    | 800000 | 2021-08-28 |
+----+----------+--------+------------+
3 rows in set (0.0020 sec)
=====================================================================================================================================================

UC5_Ability to retrieve salary data for a particular
employee as well as all employees who have
joined in a particular data range from the
payroll service database


 MySQL  localhost:3306 ssl  employeepayrollservices  SQL > SELECT salary FROM employee_payroll where name = 'Mohin';
+--------+
| salary |
+--------+
| 600000 |
+--------+

 MySQL  localhost:3306 ssl  employeepayrollservices  SQL > select * from employee_payroll where start BETWEEN CAST('2021-02-06' AS DATE) AND DATE(NOW());
+----+----------+--------+------------+
| id | name     | salary | start      |
+----+----------+--------+------------+
|  1 | Mohin    | 600000 | 2021-06-26 |
|  2 | Prashant | 700000 | 2021-07-27 |
|  3 | Rushi    | 800000 | 2021-08-28 |
+----+----------+--------+------------+
3 rows in set (0.0626 sec)


===============================================================================================================================================================
UC6_Ability to add Gender to Employee Payroll Table and Update the Rows to
reflect the correct Employee Gender

 MySQL  localhost:3306 ssl  employeepayrollservices  SQL > alter table employee_payroll add gender char(1) after name;
Query OK, 0 rows affected (1.7358 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  employeepayrollservices  SQL > select * from employee_payroll;
+----+----------+--------+--------+------------+
| id | name     | gender | salary | start      |
+----+----------+--------+--------+------------+
|  1 | Mohin    | NULL   | 600000 | 2021-06-26 |
|  2 | Prashant | NULL   | 700000 | 2021-07-27 |
|  3 | Rushi    | NULL   | 800000 | 2021-08-28 |
+----+----------+--------+--------+------------+
3 rows in set (0.0013 sec)
 MySQL  localhost:3306 ssl  employeepayrollservices  SQL > update employee_payroll set gender = 'M' where name = "Mohin";
Query OK, 1 row affected (0.0768 sec)

Rows matched: 1  Changed: 1  Warnings: 0
 MySQL  localhost:3306 ssl  employeepayrollservices  SQL > select * from employee
                                                        -> ^C
 MySQL  localhost:3306 ssl  employeepayrollservices  SQL > select * from employee_payroll ;
+----+----------+--------+--------+------------+
| id | name     | gender | salary | start      |
+----+----------+--------+--------+------------+
|  1 | Mohin    | M      | 600000 | 2021-06-26 |
|  2 | Prashant | NULL   | 700000 | 2021-07-27 |
|  3 | Rushi    | NULL   | 800000 | 2021-08-28 |
+----+----------+--------+--------+------------+
3 rows in set (0.0233 sec)

================================================================================================================================================================

UC7_Ability to find sum, average, min, max and number of male and female employees


 MySQL  localhost:3306 ssl  employeepayrollservices  SQL > select salary from employee_payroll;
+--------+
| salary |
+--------+
| 600000 |
| 700000 |
| 800000 |
+--------+
3 rows in set (0.0017 sec)

 MySQL  localhost:3306 ssl  employeepayrollservices  SQL > select sum(salary) from employee_payroll;
+-------------+
| sum(salary) |
+-------------+
|     2100000 |
+-------------+
1 row in set (0.0258 sec)

 MySQL  localhost:3306 ssl  employeepayrollservices  SQL > select avg(salary) from employee_payroll;
+-------------+
| avg(salary) |
+-------------+
|      700000 |
+-------------+
1 row in set (0.0185 sec)

 MySQL  localhost:3306 ssl  employeepayrollservices  SQL > select min(salary) from employee_payroll;
+-------------+
| min(salary) |
+-------------+
|      600000 |
+-------------+
1 row in set (0.0212 sec)

 MySQL  localhost:3306 ssl  employeepayrollservices  SQL > select max(salary) from employee_payroll;
+-------------+
| max(salary) |
+-------------+
|      800000 |
+-------------+
1 row in set (0.0016 sec)

 MySQL  localhost:3306 ssl  employeepayrollservices  SQL > select count(salary) from employee_payroll;
+---------------+
| count(salary) |
+---------------+
|             3 |
+---------------+
1 row in set (0.0103 sec)

======================================================================================================================================









