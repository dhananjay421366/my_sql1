postgres=# \c dhanu;
You are now connected to database "dhanu" as user "postgres".
dhanu=# 
dhanu=# \dt
             List of relations
 Schema |     Name      | Type  |  Owner   
--------+---------------+-------+----------
 public | actor         | table | postgres
 public | book          | table | postgres
 public | client_master | table | postgres
 public | department    | table | postgres
 public | doctor        | table | postgres
 public | donar         | table | postgres
 public | employee      | table | postgres
 public | guest         | table | postgres
 public | hospital      | table | postgres
 public | movie         | table | postgres
 public | owner         | table | postgres
 public | project       | table | postgres
 public | property      | table | postgres
 public | room          | table | postgres
 public | sales_order   | table | postgres
 public | works         | table | postgres
(16 rows)

dhanu=# create table patient(p_no int primary key , name varchar(50) not null,Adddress varchar(60));
CREATE TABLE
dhanu=# create table Bed(b_no int , r_no int ,p_no int , desc varchar(20) primary key(b_no , r_no) p_no referensec patient(p_no) );
ERROR:  syntax error at or near "desc"
LINE 1: create table Bed(b_no int , r_no int ,p_no int , desc varcha...
                                                         ^
dhanu=# create table Bed(b_no int , r_no int , desc varchar(20) primary key(b_no , r_no) p_no referensec patient(p_no) );
ERROR:  syntax error at or near "desc"
LINE 1: create table Bed(b_no int , r_no int , desc varchar(20) prim...
                                               ^
dhanu=# create table Bed(b_no int , r_no int , desc varchar(20) primary key(b_no , r_no) p_no int referensec patient );
ERROR:  syntax error at or near "desc"
LINE 1: create table Bed(b_no int , r_no int , desc varchar(20) prim...
                                               ^
dhanu=# create table Bed(b_no int , r_no int , desc varchar(20), primary key(b_no , r_no) p_no int referensec patient );
ERROR:  syntax error at or near "desc"
LINE 1: create table Bed(b_no int , r_no int , desc varchar(20), pri...
                                               ^
dhanu=# create table Bed(b_no int , r_no int,description varchar(20), primary key(b_no , r_no) p_no int referensec patient );
ERROR:  syntax error at or near "p_no"
LINE 1: ...description varchar(20), primary key(b_no , r_no) p_no int r...
                                                             ^
dhanu=# create table Bed(b_no int , r_no int,description varchar(20), primary key(b_no , r_no), p_no int referensec patient );
ERROR:  syntax error at or near "referensec"
LINE 1: ...n varchar(20), primary key(b_no , r_no), p_no int referensec...
                                                             ^
dhanu=# create table Bed(b_no int , r_no int,description varchar(20), primary key(b_no , r_no), p_no int references patient );
CREATE TABLE
dhanu=# select * from Bed;
 b_no | r_no | description | p_no 
------+------+-------------+------
(0 rows)

dhanu=# \d Bed;
                          Table "public.bed"
   Column    |         Type          | Collation | Nullable | Default 
-------------+-----------------------+-----------+----------+---------
 b_no        | integer               |           | not null | 
 r_no        | integer               |           | not null | 
 description | character varying(20) |           |          | 
 p_no        | integer               |           |          | 
Indexes:
    "bed_pkey" PRIMARY KEY, btree (b_no, r_no)
Foreign-key constraints:
    "bed_p_no_fkey" FOREIGN KEY (p_no) REFERENCES patient(p_no)

dhanu=# \h

[1]+  Stopped                 psql
postgres@kali:/root/dhananjay421366$ psql
psql (17.2 (Debian 17.2-1+b2))
Type "help" for help.

postgres=# \c dhanu;
You are now connected to database "dhanu" as user "postgres".
dhanu=# clear
dhanu-# \dt
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
 public | employee      | table | postgres
 public | guest         | table | postgres
 public | hospital      | table | postgres
 public | movie         | table | postgres
 public | owner         | table | postgres
 public | patient       | table | postgres
 public | project       | table | postgres
 public | property      | table | postgres
 public | room          | table | postgres
 public | sales_order   | table | postgres
 public | works         | table | postgres
(18 rows)

dhanu-# create table Machine(m_id int primary key , m_name varchar(20) not null  uppercaese , m_type varchar(30), m_price float , m_cost float, checek m_cost < m_price);
ERROR:  syntax error at or near "clear"
LINE 1: clear
        ^
dhanu=# create table Machine(m_id int primary key , m_name varchar(20) not null  uppercaese , m_type varchar(30), m_price float , m_cost float, checek m_cost < m_price);
ERROR:  syntax error at or near "uppercaese"
LINE 1: ...id int primary key , m_name varchar(20) not null  uppercaese...
                                                             ^
dhanu=# create table Machine(m_id int primary key , m_name varchar(20) not null  uppercase , m_type varchar(30), m_price float , m_cost float, checek m_cost < m_price);ERROR:  syntax error at or near "uppercase"
LINE 1: ...id int primary key , m_name varchar(20) not null  uppercase ...
                                                             ^
dhanu=# create table Machine(m_id int primary key , m_name varchar(20) not null,  uppercase , m_type varchar(30), m_price float , m_cost float, checek m_cost < m_price);
ERROR:  syntax error at or near ","
LINE 1: ...ary key , m_name varchar(20) not null,  uppercase , m_type v...
                                                             ^
dhanu=# create table Machine(m_id int primary key , m_name varchar(20) not null, m_type varchar(30), m_price float , m_cost float, checek m_cost < m_price);
ERROR:  syntax error at or near "<"
LINE 1: ...(30), m_price float , m_cost float, checek m_cost < m_price)...
                                                             ^
dhanu=# create table Machine(m_id int primary key , m_name varchar(20) not null, m_type varchar(30), m_price float , m_cost float, checek (m_cost) < (m_price));
ERROR:  syntax error at or near "("
LINE 1: ...varchar(30), m_price float , m_cost float, checek (m_cost) <...
                                                             ^
dhanu=# create table Machine(m_id int primary key , m_name varchar(20) not null, m_type varchar(30), m_price float , m_cost float, (m_cost) < check (m_price));
ERROR:  syntax error at or near "("
LINE 1: ...m_type varchar(30), m_price float , m_cost float, (m_cost) <...
                                                             ^
dhanu=# create table Machine(m_id int primary key , m_name varchar(20) not null, m_type varchar(30), m_price float , m_cost float check (m_cost) < (m_price));
ERROR:  syntax error at or near "<"
LINE 1: ...(30), m_price float , m_cost float check (m_cost) < (m_price...
                                                             ^
dhanu=# create table Machine(m_id int primary key , m_name varchar(20) not null, m_type varchar(30), m_price float , m_cost float,check(m_cost < m_price));
CREATE TABLE
dhanu=# drop table if exists Employee;
DROP TABLE
dhanu=# create table Employee(id int primary key, e_name varchar(20) not null ,e_desg varchar(20) , e_sal float , e_uid text unique , check(e_uid != id))
dhanu-#  create table Employee(id int primary key, e_name varchar(20) not null ,e_desg varchar(20) , e_sal float , e_uid text unique , check(e_uid != id))
;
ERROR:  syntax error at or near "create"
LINE 2:  create table Employee(id int primary key, e_name varchar(20...
         ^
dhanu=# create table Employee(id int primary key, e_name varchar(20) not null ,e_desg varchar(20) , e_sal float , e_uid text unique , check(e_uid != id));
ERROR:  operator does not exist: text <> integer
LINE 1: ...20) , e_sal float , e_uid text unique , check(e_uid != id));
                                                               ^
HINT:  No operator matches the given name and argument types. You might need to add explicit type casts.
dhanu=# create table Employee(id int primary key, e_name varchar(20) not null ,e_desg varchar(20) , e_sal float , e_uid text unique , check(e_uid not eqaual id));
ERROR:  syntax error at or near "not"
LINE 1: ...) , e_sal float , e_uid text unique , check(e_uid not eqaual...
                                                             ^
dhanu=# create table Employee(id int primary key, e_name varchar(20) not null ,e_desg varchar(20) , e_sal float , e_uid text unique , check(e_uid <> id));
ERROR:  operator does not exist: text <> integer
LINE 1: ...20) , e_sal float , e_uid text unique , check(e_uid <> id));
                                                               ^
HINT:  No operator matches the given name and argument types. You might need to add explicit type casts.
dhanu=# create table Employee(id int primary key, e_name varchar(20) not null ,e_desg varchar(20) , e_sal float , e_uid text unique , check(e_uid <> id));
ERROR:  operator does not exist: text <> integer
LINE 1: ...20) , e_sal float , e_uid text unique , check(e_uid <> id));
                                                               ^
HINT:  No operator matches the given name and argument types. You might need to add explicit type casts.
dhanu=# create table Employee(e_id int primary key, e_name varchar(20) not null ,e_desg varchar(20) , e_sal float , e_uid text unique , check(e_uid <> e_id));
ERROR:  operator does not exist: text <> integer
LINE 1: ...) , e_sal float , e_uid text unique , check(e_uid <> e_id));
                                                             ^
HINT:  No operator matches the given name and argument types. You might need to add explicit type casts.
dhanu=# create table Employee(e_id int primary key, e_name varchar(20) not null ,e_desg varchar(20) , e_sal float , e_uid text unique , check(e_uid NOT EQUAL e_id));
ERROR:  syntax error at or near "NOT"
LINE 1: ...) , e_sal float , e_uid text unique , check(e_uid NOT EQUAL ...
                                                             ^
dhanu=# create table Employee(e_id int primary key, e_name varchar(20) not null ,e_desg varchar(20) , e_sal float , e_uid text unique , check(CAST(e_uid as int) <> e_id));
CREATE TABLE
dhanu=# select * from Employee;
 e_id | e_name | e_desg | e_sal | e_uid 
------+--------+--------+-------+-------
(0 rows)

dhanu=# 
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
(19 rows)

dhanu=# \d Employee
                     Table "public.employee"
 Column |         Type          | Collation | Nullable | Default 
--------+-----------------------+-----------+----------+---------
 e_id   | integer               |           | not null | 
 e_name | character varying(20) |           | not null | 
 e_desg | character varying(20) |           |          | 
 e_sal  | double precision      |           |          | 
 e_uid  | text                  |           |          | 
Indexes:
    "employee_pkey" PRIMARY KEY, btree (e_id)
    "employee_e_uid_key" UNIQUE CONSTRAINT, btree (e_uid)
Check constraints:
    "employee_check" CHECK (e_uid::integer <> e_id)

dhanu=# select * from machine;
 m_id | m_name | m_type | m_price | m_cost 
------+--------+--------+---------+--------
(0 rows)

dhanu=# insert into machine(m_id , m_name , m_type , m_price , m_cost) values(1,'d','drilling',1000,5000),(2,'m','milling',3000,7000),(3,'l','lathe',3500,6000),(4,'t','turning',2000,3400),(5,'g','griding',4500,8000);
ERROR:  new row for relation "machine" violates check constraint "machine_check"
DETAIL:  Failing row contains (1, d, drilling, 1000, 5000).
dhanu=# insert into machine(m_id , m_name , m_type , m_price , m_cost) values(1,'d','drilling',5000,1000),(2,'m','milling',7000,3000),(3,'l','lathe',6000,3000),(4,'t','turning',34000,2000),(5,'g','griding',8500,4000);
INSERT 0 5
dhanu=# select * from machine;
 m_id | m_name |  m_type  | m_price | m_cost 
------+--------+----------+---------+--------
    1 | d      | drilling |    5000 |   1000
    2 | m      | milling  |    7000 |   3000
    3 | l      | lathe    |    6000 |   3000
    4 | t      | turning  |   34000 |   2000
    5 | g      | griding  |    8500 |   4000
(5 rows)

dhanu=# select * from Employee;
 e_id | e_name | e_desg | e_sal | e_uid 
------+--------+--------+-------+-------
(0 rows)

dhanu=# insert into employee(1,'Dhananjay', 'SDE',70000,'passinate about solving high technical chellanges'),(2,'pratap' , 'SDE', 50000 , 'web developement'),(3, 'Ganeh','Full Stack developer' , 'solving real world chellanges');
ERROR:  syntax error at or near "1"
LINE 1: insert into employee(1,'Dhananjay', 'SDE',70000,'passinate a...
                             ^
dhanu=# \d employee
                     Table "public.employee"
 Column |         Type          | Collation | Nullable | Default 
--------+-----------------------+-----------+----------+---------
 e_id   | integer               |           | not null | 
 e_name | character varying(20) |           | not null | 
 e_desg | character varying(20) |           |          | 
 e_sal  | double precision      |           |          | 
 e_uid  | text                  |           |          | 
Indexes:
    "employee_pkey" PRIMARY KEY, btree (e_id)
    "employee_e_uid_key" UNIQUE CONSTRAINT, btree (e_uid)
Check constraints:
    "employee_check" CHECK (e_uid::integer <> e_id)

dhanu=# insert into employee(1,'Dhananjay', 'SDE',70000,'passinate about solving high technical chellanges'),(2,'pratap' , 'SDE', 50000 , 'web developement'),(3, 'Ganeh','Full Stack developer' , 'solving real world chellanges');
ERROR:  syntax error at or near "1"
LINE 1: insert into employee(1,'Dhananjay', 'SDE',70000,'passinate a...
                             ^
dhanu=# insert into employee(1,'Dhananjay', 'SDE',70000,'solveing real world problem'),(2,'pratap' , 'SDE', 50000 , 'web developement'),(3, 'Ganeh','Full Stack developer' , 'technical challanges');
ERROR:  syntax error at or near "1"
LINE 1: insert into employee(1,'Dhananjay', 'SDE',70000,'solveing re...
                             ^
dhanu=# insert into employee(1,'Dhananjay', 'SDE',70000,'Technical challenges'),(2,'pratap' , 'SDE', 50000 , 'web developement'),(3, 'Ganeh','Full Stack developer' , 'technical challanges');
ERROR:  syntax error at or near "1"
LINE 1: insert into employee(1,'Dhananjay', 'SDE',70000,'Technical c...
                             ^
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
(19 rows)

dhanu=#  select * from department;
 d_id | d_name 
------+--------
(0 rows)

dhanu=#  select * from movie;
 m_no | name | release_year 
------+------+--------------
(0 rows)

dhanu=#  select * from machine;
 m_id | m_name |  m_type  | m_price | m_cost 
------+--------+----------+---------+--------
    1 | d      | drilling |    5000 |   1000
    2 | m      | milling  |    7000 |   3000
    3 | l      | lathe    |    6000 |   3000
    4 | t      | turning  |   34000 |   2000
    5 | g      | griding  |    8500 |   4000
(5 rows)

dhanu=# insert into employee(1,'Dhananjay', 'SDE',70000,'.net'),(2,'pratap' , 'SDE', 50000 , 'web'),(3, 'Ganesh','abc' , 'abc');
ERROR:  syntax error at or near "1"
LINE 1: insert into employee(1,'Dhananjay', 'SDE',70000,'.net'),(2,'...
                             ^
dhanu=# insert into Employee(1,'Dhananjay', 'SDE',70000,'.net'),(2,'pratap' , 'SDE', 50000 , 'web'),(3, 'Ganesh','abc' , 'abc');
ERROR:  syntax error at or near "1"
LINE 1: insert into Employee(1,'Dhananjay', 'SDE',70000,'.net'),(2,'...
                             ^
dhanu=# select * from Employee;
 e_id | e_name | e_desg | e_sal | e_uid 
------+--------+--------+-------+-------
(0 rows)

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
(19 rows)

dhanu=# \d Employee
                     Table "public.employee"
 Column |         Type          | Collation | Nullable | Default 
--------+-----------------------+-----------+----------+---------
 e_id   | integer               |           | not null | 
 e_name | character varying(20) |           | not null | 
 e_desg | character varying(20) |           |          | 
 e_sal  | double precision      |           |          | 
 e_uid  | text                  |           |          | 
Indexes:
    "employee_pkey" PRIMARY KEY, btree (e_id)
    "employee_e_uid_key" UNIQUE CONSTRAINT, btree (e_uid)
Check constraints:
    "employee_check" CHECK (e_uid::integer <> e_id)

dhanu=# insert into Employee(1,'Dhananjay', 'SDE',70000.00,'.net'),(2,'pratap' , 'SDE', 50000.00 , 'web'),(3, 'Ganesh','abc',60000.00 , 'abc');
ERROR:  syntax error at or near "1"
LINE 1: insert into Employee(1,'Dhananjay', 'SDE',70000.00,'.net'),(...
                             ^
dhanu=# insert into Employee(2,'Dhananjay', 'SDE',70000.00,'.net'),(3,'pratap' , 'SDE', 50000.00 , 'web'),(4, 'Ganesh','abc',60000.00 , 'abc');
ERROR:  syntax error at or near "2"
LINE 1: insert into Employee(2,'Dhananjay', 'SDE',70000.00,'.net'),(...
                             ^
dhanu=# insert into Employee(1,'Dhananjay', 'SDE',70000.00,'.net'),(2,'pratap' , 'SDE', 50000.00 , 'web'),(3, 'Ganesh','abc',60000.00 , 'abc');
ERROR:  syntax error at or near "1"
LINE 1: insert into Employee(1,'Dhananjay', 'SDE',70000.00,'.net'),(...
                             ^
dhanu=# insert into Employee(100,'Dhananjay', 'SDE',70000.00,'.net'),(101,'pratap' , 'SDE', 50000.00 , 'web'),(102, 'Ganesh','abc',60000.00 , 'abc');
ERROR:  syntax error at or near "100"
LINE 1: insert into Employee(100,'Dhananjay', 'SDE',70000.00,'.net')...
                             ^
dhanu=# insert into Employee values(100,'Dhananjay', 'SDE',70000.00,'.net'),(101,'pratap' , 'SDE', 50000.00 , 'web'),(102, 'Ganesh','abc',60000.00 , 'abc');
ERROR:  invalid input syntax for type integer: ".net"
dhanu=# insert into Employee values(100,'Dhananjay', 'SDE',70000,'.net'),(101,'pratap' , 'SDE', 50000 , 'web'),(102, 'Ganesh','abc',60000 , 'abc');
ERROR:  invalid input syntax for type integer: ".net"
dhanu=# insert into Employee values(100,'Dhananjay', 'SDE',70000,'net'),(101,'pratap' , 'SDE', 50000 , 'web'),(102, 'Ganesh','abc',60000 , 'abc');
ERROR:  invalid input syntax for type integer: "net"
dhanu=# insert into Employee values(100,'Dhananjay', 'SDE',70000,'Full Stack developer),(101,'pratap' , 'SDE', 50000 , 'web'),(102, 'Ganesh','abc',60000 , 'abc');
dhanu'# select * from Employee;
dhanu'# ^C
dhanu=# insert into Employee values(100,'Dhananjay', 'SDE',70000,'java'),(101,'pratap' , 'SDE', 50000 , 'web'),(102, 'Ganesh','abc',60000 , 'abc');
ERROR:  invalid input syntax for type integer: "java"
dhanu=# insert into Employee values(100,'Dhananjay', 'SDE',70000,100),(101,'pratap' , 'SDE', 50000 , 'web'),(102, 'Ganesh','abc',60000 , 'abc');
ERROR:  new row for relation "employee" violates check constraint "employee_check"
DETAIL:  Failing row contains (100, Dhananjay, SDE, 70000, 100).
dhanu=# insert into Employee values(100,'Dhananjay', 'SDE',70000,80000),(101,'pratap' , 'SDE', 50000 , 'web'),(102, 'Ganesh','abc',60000 , 'abc');
ERROR:  invalid input syntax for type integer: "web"
dhanu=# insert into Employee values(100,'Dhananjay', 'SDE',70000,80000),(101,'pratap' , 'SDE', 50000 , '6999),(102, 'Ganesh','abc',60000 , 11000);
dhanu'# ^C
dhanu=# insert into Employee values(100,'Dhananjay', 'SDE',70000,'3'),(101,'pratap' , 'SDE', 50000 , '2'),(102, 'Ganesh','abc',60000 , '1');
INSERT 0 3
dhanu=#  
dhanu=#  \d movie
                         Table "public.movie"
    Column    |         Type          | Collation | Nullable | Default 
--------------+-----------------------+-----------+----------+---------
 m_no         | integer               |           | not null | 
 name         | character varying(20) |           |          | 
 release_year | integer               |           |          | 
Indexes:
    "movie_pkey" PRIMARY KEY, btree (m_no)

dhanu=# insert into movie(m_no , name , release_year) values(1,'Stree2', '2025-02-20'),(2,'Kill','2024-10,23');
ERROR:  invalid input syntax for type integer: "2025-02-20"
LINE 1: ...ie(m_no , name , release_year) values(1,'Stree2', '2025-02-2...
                                                             ^
dhanu=# insert into movie(m_no , name , release_year) values(1,'Stree2', 2025-02-20),(2,'Kill',2024-10,23);
ERROR:  VALUES lists must all be the same length
LINE 1: ...e , release_year) values(1,'Stree2', 2025-02-20),(2,'Kill',2...
                                                             ^
dhanu=# insert into movie(m_no , name , release_year) values(1,'Stree2', 2025-02-20),(2,'Kill',2024-10-23);
INSERT 0 2
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
(19 rows)

dhanu=# \d room
                         Table "public.room"
   Column    |         Type          | Collation | Nullable | Default 
-------------+-----------------------+-----------+----------+---------
 id          | integer               |           | not null | 
 description | character varying(30) |           |          | 
 charge      | integer               |           |          | 
Indexes:
    "room_pkey" PRIMARY KEY, btree (id)
Referenced by:
    TABLE "guest" CONSTRAINT "guest_room_no_fkey" FOREIGN KEY (room_no) REFERENCES room(id)

dhanu=# insert into room(id, description , charge) values(1,'great',4000),(2,'clean',5000),(3,'AC',6000),(4,'Fan',4500);
INSERT 0 4
dhanu=# \d actor
                        Table "public.actor"
   Column   |         Type          | Collation | Nullable | Default 
------------+-----------------------+-----------+----------+---------
 act_id     | integer               |           | not null | 
 act_name   | character varying(30) |           |          | 
 birth_date | date                  |           |          | 
Indexes:
    "actor_pkey" PRIMARY KEY, btree (act_id)

dhanu=# insert into actor(act_id,act_name,birth_date)values(1,'raj',2004-2-02),(2,'ganesh',2003-3-3)
dhanu-# create table Emp(id int , name varchar(20));
ERROR:  syntax error at or near "create"
LINE 2: create table Emp(id int , name varchar(20));
        ^
dhanu=# create table Emp(id int , name varchar(30));
CREATE TABLE
dhanu=# 
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

dhanu=# alter table emp (add primary key(id))
dhanu-# \d emp
                       Table "public.emp"
 Column |         Type          | Collation | Nullable | Default 
--------+-----------------------+-----------+----------+---------
 id     | integer               |           |          | 
 name   | character varying(30) |           |          | 

dhanu-# alter table emp(Add primary key(id));
ERROR:  syntax error at or near "("
LINE 1: alter table emp (add primary key(id))
                        ^
dhanu=# alter table emp Add primary key(id);
ALTER TABLE
dhanu=# \d emp
                       Table "public.emp"
 Column |         Type          | Collation | Nullable | Default 
--------+-----------------------+-----------+----------+---------
 id     | integer               |           | not null | 
 name   | character varying(30) |           |          | 
Indexes:
    "emp_pkey" PRIMARY KEY, btree (id)

dhanu=# alter table emp change name char(20);
ERROR:  syntax error at or near "change"
LINE 1: alter table emp change name char(20);
                        ^
dhanu=# alter table emp modify name varchar(60);
ERROR:  syntax error at or near "modify"
LINE 1: alter table emp modify name varchar(60);
                        ^
dhanu=# alter table emp modify column name varchar(60);
ERROR:  syntax error at or near "modify"
LINE 1: alter table emp modify column name varchar(60);
                        ^
dhanu=# alter table emp modify ( name varchar(60));
ERROR:  syntax error at or near "modify"
LINE 1: alter table emp modify ( name varchar(60));
                        ^
dhanu=# alter table emp modify ' name' varchar(60);
ERROR:  syntax error at or near "modify"
LINE 1: alter table emp modify ' name' varchar(60);
                        ^
dhanu=# alter table emp modify column  name type varchar(60);
ERROR:  syntax error at or near "modify"
LINE 1: alter table emp modify column  name type varchar(60);
                        ^
dhanu=# alter table emp Alter column  name type varchar(60);
ALTER TABLE
dhanu=# alter table emp add salary float;
ALTER TABLE
dhanu=# create table supplier_master(supplier_no int ,supplier_name varchar(20), city varchar(30),phone_no int , amount int);
CREATE TABLE
dhanu=# alter table supplier_master add primary key(supplier_no);
ALTER TABLE
dhanu=# \d supplier_master
                     Table "public.supplier_master"
    Column     |         Type          | Collation | Nullable | Default 
---------------+-----------------------+-----------+----------+---------
 supplier_no   | integer               |           | not null | 
 supplier_name | character varying(20) |           |          | 
 city          | character varying(30) |           |          | 
 phone_no      | integer               |           |          | 
 amount        | integer               |           |          | 
Indexes:
    "supplier_master_pkey" PRIMARY KEY, btree (supplier_no)

dhanu=# alter table supplier_master add constraint city_check check(city in('pune','mumbai','calcutta') );
ALTER TABLE
dhanu=# \d supplier_master
                     Table "public.supplier_master"
    Column     |         Type          | Collation | Nullable | Default 
---------------+-----------------------+-----------+----------+---------
 supplier_no   | integer               |           | not null | 
 supplier_name | character varying(20) |           |          | 
 city          | character varying(30) |           |          | 
 phone_no      | integer               |           |          | 
 amount        | integer               |           |          | 
Indexes:
    "supplier_master_pkey" PRIMARY KEY, btree (supplier_no)
Check constraints:
    "city_check" CHECK (city::text = ANY (ARRAY['pune'::character varying, 'mumbai'::character varying, 'calcutta'::character varying]::text[]))

dhanu=# alter table supplier_master drop column phone_no;
ALTER TABLE
dhanu=# alter table supplier_master alter column supplier_name type varchar(50);
ALTER TABLE
dhanu=# alter table supplier_master drop constraint city_check;
ALTER TABLE
dhanu=# drop table supplier_master;
DROP TABLE
dhanu=# \d sales_order
               Table "public.sales_order"
   Column    |  Type   | Collation | Nullable | Default 
-------------+---------+-----------+----------+---------
 no          | integer |           | not null | 
 order_date  | date    |           |          | 
 salesman_no | integer |           |          | 
Indexes:
    "sales_order_pkey" PRIMARY KEY, btree (no)

dhanu=# alter table sales_order Alter column  no type varchar(60);
ALTER TABLE
dhanu=# \d employee
                     Table "public.employee"
 Column |         Type          | Collation | Nullable | Default 
--------+-----------------------+-----------+----------+---------
 e_id   | integer               |           | not null | 
 e_name | character varying(20) |           | not null | 
 e_desg | character varying(20) |           |          | 
 e_sal  | double precision      |           |          | 
 e_uid  | text                  |           |          | 
Indexes:
    "employee_pkey" PRIMARY KEY, btree (e_id)
    "employee_e_uid_key" UNIQUE CONSTRAINT, btree (e_uid)
Check constraints:
    "employee_check" CHECK (e_uid::integer <> e_id)

dhanu=# select * from employee
dhanu-# select * from employee;
ERROR:  syntax error at or near "select"
LINE 2: select * from employee;
        ^
dhanu=# select * from employee;
 e_id |  e_name   | e_desg | e_sal | e_uid 
------+-----------+--------+-------+-------
  100 | Dhananjay | SDE    | 70000 | 3
  101 | pratap    | SDE    | 50000 | 2
  102 | Ganesh    | abc    | 60000 | 1
(3 rows)

dhanu=# alter table employee drop constraint e-UID
dhanu-# ALTER table employee drop constraint e_uid;
ERROR:  syntax error at or near "-"
LINE 1: alter table employee drop constraint e-UID
                                              ^
dhanu=# alter table employee drop constraint e_uid;
ERROR:  constraint "e_uid" of relation "employee" does not exist
dhanu=# alter table employee drop constraint employee_e_uid_key;
ALTER TABLE
dhanu=# \d employee
                     Table "public.employee"
 Column |         Type          | Collation | Nullable | Default 
--------+-----------------------+-----------+----------+---------
 e_id   | integer               |           | not null | 
 e_name | character varying(20) |           | not null | 
 e_desg | character varying(20) |           |          | 
 e_sal  | double precision      |           |          | 
 e_uid  | text                  |           |          | 
Indexes:
    "employee_pkey" PRIMARY KEY, btree (e_id)
Check constraints:
    "employee_check" CHECK (e_uid::integer <> e_id)

dhanu=# alter table employee drop column e_uid;
ALTER TABLE
dhanu=# \d employee
                     Table "public.employee"
 Column |         Type          | Collation | Nullable | Default 
--------+-----------------------+-----------+----------+---------
 e_id   | integer               |           | not null | 
 e_name | character varying(20) |           | not null | 
 e_desg | character varying(20) |           |          | 
 e_sal  | double precision      |           |          | 
Indexes:
    "employee_pkey" PRIMARY KEY, btree (e_id)

dhanu=# select * from employee;
 e_id |  e_name   | e_desg | e_sal 
------+-----------+--------+-------
  100 | Dhananjay | SDE    | 70000
  101 | pratap    | SDE    | 50000
  102 | Ganesh    | abc    | 60000
(3 rows)

dhanu=# update employee set e_sal *0.15;
ERROR:  syntax error at or near "*"
LINE 1: update employee set e_sal *0.15;
                                  ^
dhanu=# update employee set e_sal = e_sal *0.15;
UPDATE 3
dhanu=# select * from employee;
 e_id |  e_name   | e_desg | e_sal 
------+-----------+--------+-------
  100 | Dhananjay | SDE    | 10500
  101 | pratap    | SDE    |  7500
  102 | Ganesh    | abc    |  9000
(3 rows)

dhanu=# update employee set e_sal += e_sal *0.15;
ERROR:  syntax error at or near "+="
LINE 1: update employee set e_sal += e_sal *0.15;
                                  ^
dhanu=# update employee set e_sal = e_sal + e_sal *0.15;
UPDATE 3
dhanu=# select * from employee;
 e_id |  e_name   | e_desg | e_sal 
------+-----------+--------+-------
  100 | Dhananjay | SDE    | 12075
  101 | pratap    | SDE    |  8625
  102 | Ganesh    | abc    | 10350
(3 rows)

dhanu=# 

