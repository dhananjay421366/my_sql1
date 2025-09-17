u postgres        
postgres@kali:/root/dhananjay421366$ psql
psql (17.2 (Debian 17.2-1+b2))
Type "help" for help.

postgres=# \c dhanu;
You are now connected to database "dhanu" as user "postgres".
dhanu=# \c
You are now connected to database "dhanu" as user "postgres".
dhanu=# \dt
             List of relations
 Schema |     Name      | Type  |  Owner   
--------+---------------+-------+----------
 public | actor         | table | postgres
 public | bed           | table | postgres
 public | book          | table | postgres
 public | client_master | table | postgres
 public | department    | table | postgres
 public | doctor        | table | postgres
 public | donar         | table | postgres
 public | emp           | table | postgres
 public | employee      | table | postgres
 public | guest         | table | postgres
 public | hospital      | table | postgres
 public | machine       | table | postgres
 public | movie         | table | postgres
 public | owner         | table | postgres
 public | patient       | table | postgres
 public | project       | table | postgres
 public | property      | table | postgres
 public | room          | table | postgres
 public | sales_order   | table | postgres
 public | works         | table | postgres
(20 rows)

dhanu=# select * from doctor;
 d_no | d_name | city 
------+--------+------
(0 rows)

dhanu=# insert into doctor(d_no , d_name , city) vaules(1,'ramesh','pune'),(2,'Akash','Karjat'),(3,'ganesh','mumbai');
ERROR:  syntax error at or near "vaules"
LINE 1: insert into doctor(d_no , d_name , city) vaules(1,'ramesh','...
                                                 ^
dhanu=# insert into doctor(d_no , d_name , city) values (1,'ramesh','pune'),(2,'Akash','Karjat'),(3,'ganesh','mumbai');
INSERT 0 3
dhanu=# select * emp;
ERROR:  syntax error at or near "emp"
LINE 1: select * emp;
                 ^
dhanu=# select * from emp;
 id | name | salary 
----+------+--------
(0 rows)

dhanu=# select * from employee;
 e_id |  e_name   | e_desg | e_sal 
------+-----------+--------+-------
  100 | Dhananjay | SDE    | 12075
  101 | pratap    | SDE    |  8625
  102 | Ganesh    | abc    | 10350
(3 rows)

dhanu=# select * from department;
 d_id | d_name 
------+--------
(0 rows)

dhanu=# drop table department;
ERROR:  cannot drop table department because other objects depend on it
DETAIL:  constraint project_control_dno_fkey on table project depends on table department
HINT:  Use DROP ... CASCADE to drop the dependent objects too.
dhanu=# create table dept1(d_no int primary key , d_name varchar(20), location varchar(20));
CREATE TABLE
dhanu=# CREATE TABLE dept (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);
CREATE TABLE
dhanu=# CREATE TABLE emp1 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    dept_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (dept_id) REFERENCES dept(dept_id)
);
CREATE TABLE
dhanu=# INSERT INTO dept (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Engineering');
INSERT 0 3
dhanu=# INSERT INTO emp1 (emp_id, emp_name, dept_id, salary) VALUES
(101, 'Alice', 1, 60000),
(102, 'Bob', 2, 70000),
(103, 'Charlie', 3, 80000),
(104, 'David', 3, 75000);
INSERT 0 4
dhanu=# select * from emp1;
 emp_id | emp_name | dept_id |  salary  
--------+----------+---------+----------
    101 | Alice    |       1 | 60000.00
    102 | Bob      |       2 | 70000.00
    103 | Charlie  |       3 | 80000.00
    104 | David    |       3 | 75000.00
(4 rows)

dhanu=# select * from dept;
 dept_id |  dept_name  
---------+-------------
       1 | HR
       2 | Finance
       3 | Engineering
(3 rows)

dhanu=# create view v2 as(select * from emp1 where salary in (select max(salary) from emp , dept  where dept_name = 'HR'));
CREATE VIEW
dhanu=# select * from v2;
 emp_id | emp_name | dept_id | salary 
--------+----------+---------+--------
(0 rows)

dhanu=# -- Create student table
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    age INT,
    grade VARCHAR(10)
);

-- Create teacher table
CREATE TABLE teacher (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(100),
    subject VARCHAR(50)
);

-- Create std_teacher linking table
CREATE TABLE std_teacher (
    student_id INT,
    teacher_id INT,
    PRIMARY KEY (student_id, teacher_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
);

-- Insert data into student table
INSERT INTO student (student_id, student_name, age, grade) VALUES
(1, 'Alice', 14, '8th'),
(2, 'Bob', 15, '9th'),
(3, 'Charlie', 13, '7th');

-- Insert data into teacher table
INSERT INTO teacher (teacher_id, teacher_name, subject) VALUES
(101, 'Mr. Smith', 'Math'),
(102, 'Ms. Johnson', 'Science'),
(103, 'Mrs. Lee', 'English');

-- Insert data into std_teacher table (linking students to teachers)
INSERT INTO std_teacher (student_id, teacher_id) VALUES
(3, 103);  -- Charlie has Mrs. Leen
CREATE TABLE
CREATE TABLE
CREATE TABLE
INSERT 0 3
INSERT 0 3
INSERT 0 4
dhanu=# create view v1 as  (select * from student s , std_teacher) st where s.student_id = st.student_id and subject = 'English');
ERROR:  syntax error at or near "st"
LINE 1: ...ew v1 as  (select * from student s , std_teacher) st where s...
                                                             ^
dhanu=# create view v1 as  (select * from student s , std_teacher st where s.student_id = st.student_id and subject = 'English');
ERROR:  column "subject" does not exist
LINE 1: ...teacher st where s.student_id = st.student_id and subject = ...
                                                             ^
dhanu=# create view v1 as  (select * from student s , std_teacher st where s.student_id = st.student_id and subjec^C
dhanu=# select * from property;
 p_id | p_desc | area 
------+--------+------
(0 rows)

dhanu=# select * from owner;
 name | address | phone_no | p_id 
------+---------+----------+------
(0 rows)

dhanu=# \d property;
                     Table "public.property"
 Column |         Type          | Collation | Nullable | Default 
--------+-----------------------+-----------+----------+---------
 p_id   | integer               |           | not null | 
 p_desc | character varying(50) |           | not null | 
 area   | character varying(20) |           |          | 
Indexes:
    "property_pkey" PRIMARY KEY, btree (p_id)
Referenced by:
    TABLE "owner" CONSTRAINT "owner_p_id_fkey" FOREIGN KEY (p_id) REFERENCES property(p_id)

dhanu=# \d owner;
                       Table "public.owner"
  Column  |         Type          | Collation | Nullable | Default 
----------+-----------------------+-----------+----------+---------
 name     | character varying(20) |           | not null | 
 address  | character varying(20) |           |          | 
 phone_no | integer               |           |          | 
 p_id     | integer               |           |          | 
Indexes:
    "owner_pkey" PRIMARY KEY, btree (name)
Foreign-key constraints:
    "owner_p_id_fkey" FOREIGN KEY (p_id) REFERENCES property(p_id)

dhanu=# -- Insert into property table
INSERT INTO property (p_id, p_desc, area)
VALUES
(1, '3BHK Apartment', 'Downtown'),
(2, '2BHK Condo', 'Uptown');

-- Insert into owner table
INSERT INTO owner (name, address, phone_no, p_id)
VALUES
('John Doe', '123 Elm Street', 9876543210, 1),
('Jane Smith', '456 Oak Avenue', 1234567890, 2);
INSERT 0 2
ERROR:  integer out of range
dhanu=# -- Insert into property table
INSERT INTO property (p_id, p_desc, area)
VALUES
(1, '3BHK Apartment', 'Downtown'),
(2, '2BHK Condo', 'Uptown');

-- Insert into owner table
INSERT INTO owner (name, address, phone_no, p_id)
VALUES
('Kavita', '123^Clm Street', 987, 1),
('Jane Smith', '456 Oak Avenue', 123, 2);
dhanu=# drop table owner;
DROP TABLE
dhanu=# drop table property;
DROP TABLE
dhanu=# create table owner(name varchar(120) address varchar(40) , phone_no int);
ERROR:  syntax error at or near "address"
LINE 1: create table owner(name varchar(120) address varchar(40) , p...
                                             ^
dhanu=# create table owner(name varchar(120), address varchar(40) , phone_no int);
CREATE TABLE
dhanu=# create table property(pno int primary key ,  area int , location varchar(20) , city varchar(20) , name varchar(20) references(owner));
ERROR:  syntax error at or near "("
LINE 1: ...0) , city varchar(20) , name varchar(20) references(owner));
                                                              ^
dhanu=# create table property(pno int primary key ,  area int , location varchar(20) , city varchar(20) , name varchar(20) references (owner));
ERROR:  syntax error at or near "("
LINE 1: ...) , city varchar(20) , name varchar(20) references (owner));
                                                              ^
dhanu=# drop   table owner;
DROP TABLE
dhanu=# CREATE TABLE property (
    p_id integer PRIMARY KEY,
    p_desc varchar(50) NOT NULL,
    area varchar(20)
);

CREATE TABLE owner (
    name varchar(20) PRIMARY KEY,
    address varchar(20),
    phone_no integer,
    p_id integer REFERENCES property(p_id)
);
CREATE TABLE
CREATE TABLE
dhanu=# -- Insert into property table
INSERT INTO property (p_id, p_desc, area) VALUES
(1, '3 BHK Apartment', 'Downtown'),
(2, '2 BHK Condo', 'Uptown'),
(3, 'Villa', 'Suburbs');

-- Insert into owner table
INSERT INTO owner (name, address, phone_no, p_id) VALUES
('Alice', '123 Maple St', 5551234, 1),
('Bob', '456 Oak St', 5555678, 1),
('Charlie', '789 Pine St', 5558765, 2),
('David', '321 Elm St', 5554321, 3);
INSERT 0 3
INSERT 0 4
dhanu=# drop table property;
ERROR:  cannot drop table property because other objects depend on it
DETAIL:  constraint owner_p_id_fkey on table owner depends on table property
HINT:  Use DROP ... CASCADE to drop the dependent objects too.
dhanu=# drop table owner;
DROP TABLE
dhanu=# drop table property;
DROP TABLE
dhanu=# CREATE TABLE owner (
    name varchar(20) PRIMARY KEY,
    address varchar(20),
    phone_no integer,
    p_id integer REFERENCES property(p_id)
);
ERROR:  relation "property" does not exist
dhanu=# CREATE TABLE property (
    p_id integer PRIMARY KEY,
    area int,
      location varchar(20),
);
ERROR:  syntax error at or near ")"
LINE 5: );
        ^
dhanu=# CREATE TABLE property (
    p_id integer PRIMARY KEY,
    area int,
      location varchar(20),city varchar(30) name varchar(20) references (owner) on delete cascade
);
ERROR:  syntax error at or near "name"
LINE 4:       location varchar(20),city varchar(30) name varchar(20)...
                                                    ^
dhanu=# CREATE TABLE owner (
    name varchar(20) PRIMARY KEY,
    address varchar(20),
    phone_no integer,                                                                      
                                          
);
ERROR:  syntax error at or near ")"
LINE 6: );
        ^
dhanu=# CREATE TABLE owner (
    name varchar(20) PRIMARY KEY,
    address varchar(20),
    phone_no integer 
  
);
CREATE TABLE
dhanu=# drop tablw owner;
ERROR:  syntax error at or near "tablw"
LINE 1: drop tablw owner;
             ^
dhanu=# drop table owner;
DROP TABLE
dhanu=# CREATE TABLE owner (
    name varchar(20) PRIMARY KEY,
    address varchar(20),
    phone_no integer  on delete cascade
  
);
ERROR:  syntax error at or near "on"
LINE 4:     phone_no integer  on delete cascade
                              ^
dhanu=# CREATE TABLE owner (
    name varchar(20) PRIMARY KEY,
    address varchar(20),
    phone_no integer , on delete cascade
  
);
ERROR:  syntax error at or near "on"
LINE 4:     phone_no integer , on delete cascade
                               ^
dhanu=# CREATE TABLE owner (
    name varchar(20) PRIMARY KEY,
    address varchar(20),
    phone_no integer                   
  
);
CREATE TABLE
dhanu=# CREATE TABLE property (
    p_id integer PRIMARY KEY,
    area int,
      location varchar(20),city varchar(30) name varchar(20) references (owner) on delete cascade
);
ERROR:  syntax error at or near "name"
LINE 4:       location varchar(20),city varchar(30) name varchar(20)...
                                                    ^
dhanu=# CREATE TABLE property (
    p_id integer PRIMARY KEY,
    area int,
      location varchar(20),city varchar(30), name varchar(20) references (owner) on delete cascade
);
ERROR:  syntax error at or near "("
LINE 4: ...20),city varchar(30), name varchar(20) references (owner) on...
                                                             ^
dhanu=# CREATE TABLE property (
    p_id INTEGER PRIMARY KEY,
    area INT,
    location VARCHAR(20),
    city VARCHAR(30),
    name VARCHAR(20),
    FOREIGN KEY (name) REFERENCES owner(name) ON DELETE CASCADE
);
CREATE TABLE
dhanu=# -- Insert records into owner table
INSERT INTO owner (name, address, phone_no) VALUES
('Alice', '123 Maple St', 5551234),
('Bob', '456 Oak Ave', 5555678),
('Charlie', '789 Pine Rd', 5559012);
                     
-- Insert records into property table
INSERT INTO property (p_id, area, location, city, name) VALUES
(1, 1200, 'Downtown', 'New York', 'Alice'),
(2, 850, 'Uptown', 'Chicago', 'Bob'),
(3, 1500, 'Suburbs', 'San Francisco', 'Charlie'),
(4, 900, 'Midtown', 'pune', 'Alice');
INSERT 0 3
INSERT 0 4
dhanu=# select * from property;
 p_id | area | location |     city      |  name   
------+------+----------+---------------+---------
    1 | 1200 | Downtown | New York      | Alice
    2 |  850 | Uptown   | Chicago       | Bob
    3 | 1500 | Suburbs  | San Francisco | Charlie
    4 |  900 | Midtown  | pune          | Alice
(4 rows)

dhanu=# select * from owner;
  name   |   address    | phone_no 
---------+--------------+----------
 Alice   | 123 Maple St |  5551234
 Bob     | 456 Oak Ave  |  5555678
 Charlie | 789 Pine Rd  |  5559012
(3 rows)

dhanu=# delete from property where city = 'pune' and name = 'Alice';
DELETE 1
dhanu=# select name from owner where name like '%a';
 name 
------
(0 rows)

dhanu=# INSERT INTO owner (name, address, phone_no) VALUES
('dhna', '123 Maple St', 5551234),
dhanu-# select name from owner where name like '%a';
ERROR:  syntax error at or near "select"
LINE 4: select name from owner where name like '%a';
        ^
dhanu=#                                                   
select name from owner where name like '%a';
 name 
------
(0 rows)

dhanu=# select * from owner;
  name   |   address    | phone_no 
---------+--------------+----------
 Alice   | 123 Maple St |  5551234
 Bob     | 456 Oak Ave  |  5555678
 Charlie | 789 Pine Rd  |  5559012
(3 rows)

dhanu=# INSERT INTO owner (name, address, phone_no) VALUES
('dhna', '123 Maple St', 5551234) 
dhanu-# select * from owner;
ERROR:  syntax error at or near "select"
LINE 4: select * from owner;
        ^
dhanu=#                                                   
select * from owner;             
  name   |   address    | phone_no 
---------+--------------+----------
 Alice   | 123 Maple St |  5551234
 Bob     | 456 Oak Ave  |  5555678
 Charlie | 789 Pine Rd  |  5559012
(3 rows)

dhanu=# INSERT INTO owner (name, address, phone_no) VALUES
('dhna', '123 Maple St', 5551234),
dhanu-# INSERT INTO owner (name, address, phone_no) VALUES
('dhna', '123 Maple St', 5551234);
ERROR:  syntax error at or near "INSERT"
LINE 4: INSERT INTO owner (name, address, phone_no) VALUES
        ^
dhanu=#                                                   
INSERT INTO owner (name, address, phone_no) VALUES
('dhna', '123 Maple St', 5551234);
INSERT 0 1
dhanu=#                                                   
select * from owner;
  name   |   address    | phone_no 
---------+--------------+----------
 Alice   | 123 Maple St |  5551234
 Bob     | 456 Oak Ave  |  5555678
 Charlie | 789 Pine Rd  |  5559012
 dhna    | 123 Maple St |  5551234
(4 rows)

dhanu=#                     
select name from owner where name like '%a';
 name 
------
 dhna
(1 row)

dhanu=# update owner set phone_no=999999 where name = 'dhna';
UPDATE 1
dhanu=#                                                      
select * from owner;
  name   |   address    | phone_no 
---------+--------------+----------
 Alice   | 123 Maple St |  5551234
 Bob     | 456 Oak Ave  |  5555678
 Charlie | 789 Pine Rd  |  5559012
 dhna    | 123 Maple St |   999999
(4 rows)

dhanu=# update owner set phone_no=999999 where name = 'dhna';
UPDATE 1
dhanu=#                                                      
select name from owner where name like '%a';
 name 
------
 dhna
(1 row)

dhanu=# 
select * from owner where name like '%a';
 name |   address    | phone_no 
------+--------------+----------
 dhna | 123 Maple St |   999999
(1 row)

dhanu=# alter table property add column rate float;
ALTER TABLE
dhanu=#                                                      
select * from owner;
  name   |   address    | phone_no 
---------+--------------+----------
 Alice   | 123 Maple St |  5551234
 Bob     | 456 Oak Ave  |  5555678
 Charlie | 789 Pine Rd  |  5559012
 dhna    | 123 Maple St |   999999
(4 rows)

dhanu=#                                            
select * from property;
 p_id | area | location |     city      |  name   | rate 
------+------+----------+---------------+---------+------
    1 | 1200 | Downtown | New York      | Alice   |     
    2 |  850 | Uptown   | Chicago       | Bob     |     
    3 | 1500 | Suburbs  | San Francisco | Charlie |     
(3 rows)

dhanu=# update table propery set rate = 150 where p_id = 1;
ERROR:  syntax error at or near "table"
LINE 1: update table propery set rate = 150 where p_id = 1;
               ^
dhanu=# update propery set rate = 150 where p_id = 1;
ERROR:  relation "propery" does not exist
LINE 1: update propery set rate = 150 where p_id = 1;
               ^
dhanu=# update property set rate = 150 where p_id = 1;
UPDATE 1
dhanu=# update property set rate = 250 where p_id = 2;
UPDATE 1
dhanu=# update property set rate = 200 where p_id = 3;
UPDATE 1
dhanu=#                                                    
select * from property;
 p_id | area | location |     city      |  name   | rate 
------+------+----------+---------------+---------+------
    1 | 1200 | Downtown | New York      | Alice   |  150
    2 |  850 | Uptown   | Chicago       | Bob     |  250
    3 | 1500 | Suburbs  | San Francisco | Charlie |  200
(3 rows)

dhanu=#                                                    
select * from owner;
  name   |   address    | phone_no 
---------+--------------+----------
 Alice   | 123 Maple St |  5551234
 Bob     | 456 Oak Ave  |  5555678
 Charlie | 789 Pine Rd  |  5559012
 dhna    | 123 Maple St |   999999
(4 rows)

dhanu=# create view ownerDeails as(select * from owner where name in (select name from property group by name having count(*)>2));
CREATE VIEW
dhanu=#                                                                                                                           
select * from ownerDetails;
ERROR:  relation "ownerdetails" does not exist
LINE 1: select * from ownerDetails;
                      ^
dhanu=# 
select * from ownerDeails;
 name | address | phone_no 
------+---------+----------
(0 rows)

dhanu=# 
