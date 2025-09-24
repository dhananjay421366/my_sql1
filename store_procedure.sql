─(root㉿kali)-[~]
└─# su postgres                  
postgres@kali:/root$ plsql
Command 'plsql' not found, did you mean:
  command 'psql' from deb postgresql-client-common
Try: apt install <deb name>
postgres@kali:/root$ psql
psql (17.2 (Debian 17.2-1+b2))
Type "help" for help.

postgres=# \c dhanu;
You are now connected to database "dhanu" as user "postgres".
dhanu=# create or replace function adds(a int , b int)returns void 
as $$ 
begin
   raise notice 'Addition=%',a+b;
  end;
  $$
  language 'plpgsql';
  
CREATE FUNCTION
dhanu=# select adds(10,20);
NOTICE:  Addition=30
 adds 
------
 
(1 row)

dhanu=# create or replace function sub(a int , b int)returns void 
as $$ 
begin
   raise notice 'Sub=%',a-b;
  end;
  $$
  
  
dhanu-# select sub(10,20);
ERROR:  syntax error at or near "select"
LINE 9: select sub(10,20);
        ^
dhanu=# create or replace function sub(a int , b int)returns void 
as $$ 
begin
   raise notice 'Sub=%',a-b;
  end;
  $$
  language = 'plpgsql';
  
select sub(10,20);
ERROR:  syntax error at or near "="
LINE 7:   language = 'plpgsql';
                   ^
ERROR:  function sub(integer, integer) does not exist
LINE 1: select sub(10,20);
               ^
HINT:  No function matches the given name and argument types. You might need to add explicit type casts.
dhanu=# create or replace function sub(a int , b int)returns void 
as $$ 
begin
   raise notice 'Sub=%',a-b;
  end;
  $$
  language  'plpgsql';
  
select sub(10,20);
CREATE FUNCTION
NOTICE:  Sub=-10
 sub 
-----
 
(1 row)

dhanu=# create or replace function adds(a int , b int)returns int 
as $$ 
begin
   return a+b;
  end;
  $$
  language 'plpgsql';
  
ERROR:  cannot change return type of existing function
HINT:  Use DROP FUNCTION adds(integer,integer) first.
dhanu=# drop function adds;
DROP FUNCTION
dhanu=# create or replace function adds(a int , b int)returns int 
as $$ 
begin
   return a+b;
  end;
  $$
  language 'plpgsql';
  
CREATE FUNCTION
dhanu=# select adds(10,20);
 adds 
------
   30
(1 row)

dhanu=# create or replace function MinMax(a int , b int)returns int 
as $$ 
begin
   if a >b then 
   raise notice '% is max',a;
   else raise notice '% is max',b;
   end if; 
   if a<b then raise notice '% is min',a
   ;else raise notice '%' is min',b; 
   end if;      
   end;               
  $$                 
  language 'plpgsql';
  

ERROR:  syntax error at or near "is"
LINE 9:    ;else raise notice '%' is min',b; 
                                  ^
dhanu=# create or replace function MinMax(a int , b int)returns int 
as $$ 
begin
   if a >b then 
   raise notice '% is max',a;
   else raise notice '% is max',b;
   end if; 
   if a<b then raise notice '% is min',a
   ;else raise notice '% is min',b; 
   end if;      
   end;               
  $$                 
  language 'plpgsql';
  
CREATE FUNCTION
dhanu=# select MinMax(20,40);
NOTICE:  40 is max
NOTICE:  20 is min
ERROR:  control reached end of function without RETURN
CONTEXT:  PL/pgSQL function minmax(integer,integer)
dhanu=#  create or replace function MinMax(a int)returns void 
as $$ 
begin
   if a%2==0 then 
   raise notice '% is even',a;
   else raise notice '% is odd',a;  
   end;               
  $$                 
  language 'plpgsql';
  

ERROR:  syntax error at or near ";"
LINE 7:    end;               
              ^
dhanu=#  create or replace function MinMax(a int)returns void 
as $$ 
begin
   if a%2==0 then 
   raise notice '% is even',a;
   else raise notice '% is odd',a; end if;  
   end;               
  $$                 
  language 'plpgsql';
  
CREATE FUNCTION
dhanu=# create or replace function evenOdd(a int)returns void 
as $$ 
begin
   if a%2==0 then 
   raise notice '% is even',a;
   else raise notice '% is odd',a;
   end if;
   end;               
  $$                 
  language 'plpgsql';
  
CREATE FUNCTION
dhanu=# select evenOdd(10);
ERROR:  operator does not exist: integer == integer
LINE 1: a%2==0
           ^
HINT:  No operator matches the given name and argument types. You might need to add explicit type casts.
QUERY:  a%2==0
CONTEXT:  PL/pgSQL function evenodd(integer) line 3 at IF
dhanu=# create or replace function evenOdd(a int)returns void 
as $$ 
begin
   if a%2=0 then 
   raise notice '% is even',a;
   else raise notice '% is odd',a;
   end if;
   end;               
  $$                 
  language 'plpgsql';
  
CREATE FUNCTION
dhanu=# select evenOdd(10);
NOTICE:  10 is even
 evenodd 
---------
 
(1 row)

dhanu=# select evenOdd(5);
NOTICE:  5 is odd
 evenodd 
---------
 
(1 row)

dhanu=# create or replace function positiveNegative(a int)returns void 
as $$ 
begin
   if a>0 then 
   raise notice '% is positive',a;
   else raise notice '% is negative',a;
   end if;
   if a = 0 then 
      raise notice '% is zero',a;
   else raise notice '% is not zero',a;
   end;               
  $$                 
  language 'plpgsql';
  

ERROR:  syntax error at or near ";"
LINE 11:    end;               
               ^
dhanu=# create or replace function positiveNegative(a int)returns void 
as $$ 
begin
   if a>0 then 
   raise notice '% is positive',a;
   else raise notice '% is negative',a;
   end if;
   if a = 0 then 
      raise notice '% is zero',a;
   else raise notice '% is not zero',a; end if;
   end;               
  $$                 
  language 'plpgsql';
  
CREATE FUNCTION
dhanu=# select positiveNegative(10);
NOTICE:  10 is positive
NOTICE:  10 is not zero
 positivenegative 
------------------
 
(1 row)

dhanu=# create or replace function odd()returns void 
as $$ 

declare i int
begin
     raise notice 'All odd no bet 1 to 50',;
     for i in 1..50 loop 
      if i%2!=0 then 
      raise notice '%',1;
      end if;
   end loop;
   end;
  $$                 
  language 'plpgsql';
  

ERROR:  syntax error at or near "begin"
LINE 5: begin
        ^
CONTEXT:  invalid type name "int
begin
     raise notice 'All odd no bet 1 to 50'"
dhanu=# ^[[200~create or replace function odd()returns void 
dhanu-# as $$ 
dhanu$# 
dhanu$# declare i integer
dhanu$# begin
dhanu$#      raise notice 'All odd no bet 1 to 50',;
dhanu$#      for i in 1..50 loop 
dhanu$#       if i%2!=0 then 
dhanu$#       raise notice '%',1;
dhanu$#       end if;
dhanu$#    end loop;
dhanu$#    end;
dhanu$#   $$                 
dhanu-#   language 'plpgsql';
ERROR:  syntax error at or near "
INE 1: create or replace function odd()returns void 
        ^
dhanu=#   
dhanu=# 
dhanu=# create or replace function odd()returns void 
as $$ 

declare i integer
begin
     raise notice 'All odd no bet 1 to 50',;
     for i in 1..50 loop 
      if i%2!=0 then 
      raise notice '%',1;
      end if;
   end loop;
   end;
  $$                 
  language 'plpgsql';
  

ERROR:  syntax error at or near "begin"
LINE 5: begin
        ^
CONTEXT:  invalid type name "integer
begin
     raise notice 'All odd no bet 1 to 50'"
dhanu=# create or replace function odd()returns void 
as $$ 
declare 
i integer;
begin
     raise notice 'All odd no bet 1 to 50:';
     for i in 1..50 loop 
      if i%2!=0 then 
      raise notice '%',1;
      end if;
   end loop;
   end;
  $$                 
  language 'plpgsql';
  

CREATE FUNCTION
dhanu=# select odd();
NOTICE:  All odd no bet 1 to 50:
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
 odd 
-----
 
(1 row)

dhanu=# create or replace function odd()returns void 
as $$ 
declare 
i integer;
begin
     raise notice 'All odd no bet 1 to 50:';
     for i in 1..50 loop 
      if i%2<>0 then 
      raise notice '%',1;
      end if;
   end loop;
   end;
  $$                 
  language 'plpgsql';
  

CREATE FUNCTION
dhanu=# select odd();
NOTICE:  All odd no bet 1 to 50:
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
 odd 
-----
 
(1 row)

dhanu=# create or replace function odd()returns void 
as $$ 
declare 
i integer;
begin
     raise notice 'All odd no bet 1 to 50:';
     for i in 1..50 loop 
      if i%2<>0 then 
      raise notice '%',i;
      end if;
   end loop;
   end;
  $$                 
  language 'plpgsql';
  

CREATE FUNCTION
dhanu=# select odd();
NOTICE:  All odd no bet 1 to 50:
NOTICE:  1
NOTICE:  3
NOTICE:  5
NOTICE:  7
NOTICE:  9
NOTICE:  11
NOTICE:  13
NOTICE:  15
NOTICE:  17
NOTICE:  19
NOTICE:  21
NOTICE:  23
NOTICE:  25
NOTICE:  27
NOTICE:  29
NOTICE:  31
NOTICE:  33
NOTICE:  35
NOTICE:  37
NOTICE:  39
NOTICE:  41
NOTICE:  43
NOTICE:  45
NOTICE:  47
NOTICE:  49
 odd 
-----
 
(1 row)

dhanu=# └─# su postgres                  
postgres@kali:/root$ plsql
Command 'plsql' not found, did you mean:
  command 'psql' from deb postgresql-client-common
Try: apt install <deb name>
postgres@kali:/root$ psql
psql (17.2 (Debian 17.2-1+b2))
Type "help" for help.

postgres=# \c dhanu;
You are now connected to database "dhanu" as user "postgres".
dhanu=# create or replace function adds(a int , b int)returns void 
as $$ 
begin
   raise notice 'Addition=%',a+b;
  end;
  $$
  language 'plpgsql';
  
CREATE FUNCTION
dhanu=# select adds(10,20);
NOTICE:  Addition=30
 adds 
------
 
(1 row)

dhanu=# create or replace function sub(a int , b int)returns void 
as $$ 
begin
   raise notice 'Sub=%',a-b;
  end;
  $$
  
  
dhanu-# select sub(10,20);
ERROR:  syntax error at or near "select"
LINE 9: select sub(10,20);
        ^
dhanu=# create or replace function sub(a int , b int)returns void 
as $$ 
begin
   raise notice 'Sub=%',a-b;
  end;
  $$
  language = 'plpgsql';
  
select sub(10,20);
ERROR:  syntax error at or near "="
LINE 7:   language = 'plpgsql';
                   ^
ERROR:  function sub(integer, integer) does not exist
LINE 1: select sub(10,20);
               ^
HINT:  No function matches the given name and argument types. You might need to add explicit type casts.
dhanu=# create or replace function sub(a int , b int)returns void 
as $$ 
begin
   raise notice 'Sub=%',a-b;
  end;
  $$
  language  'plpgsql';
  
select sub(10,20);
CREATE FUNCTION
NOTICE:  Sub=-10
 sub 
-----
 
(1 row)

dhanu=# create or replace function adds(a int , b int)returns int 
as $$ 
begin
   return a+b;
  end;
  $$
  language 'plpgsql';
  
ERROR:  cannot change return type of existing function
HINT:  Use DROP FUNCTION adds(integer,integer) first.
dhanu=# drop function adds;
DROP FUNCTION
dhanu=# create or replace function adds(a int , b int)returns int 
as $$ 
begin
   return a+b;
  end;
  $$
  language 'plpgsql';
  
CREATE FUNCTION
dhanu=# select adds(10,20);
 adds 
------
   30
(1 row)

dhanu=# create or replace function MinMax(a int , b int)returns int 
as $$ 
begin
   if a >b then 
   raise notice '% is max',a;
   else raise notice '% is max',b;
   end if; 
   if a<b then raise notice '% is min',a
   ;else raise notice '%' is min',b; 
   end if;      
   end;               
  $$                 
  language 'plpgsql';
  

ERROR:  syntax error at or near "is"
LINE 9:    ;else raise notice '%' is min',b; 
                                  ^
dhanu=# create or replace function MinMax(a int , b int)returns int 
as $$ 
begin
   if a >b then 
   raise notice '% is max',a;
   else raise notice '% is max',b;
   end if; 
   if a<b then raise notice '% is min',a
   ;else raise notice '% is min',b; 
   end if;      
   end;               
  $$                 
  language 'plpgsql';
  
CREATE FUNCTION
dhanu=# select MinMax(20,40);
NOTICE:  40 is max
NOTICE:  20 is min
ERROR:  control reached end of function without RETURN
CONTEXT:  PL/pgSQL function minmax(integer,integer)
dhanu=#  create or replace function MinMax(a int)returns void 
as $$ 
begin
   if a%2==0 then 
   raise notice '% is even',a;
   else raise notice '% is odd',a;  
   end;               
  $$                 
  language 'plpgsql';
  

ERROR:  syntax error at or near ";"
LINE 7:    end;               
              ^
dhanu=#  create or replace function MinMax(a int)returns void 
as $$ 
begin
   if a%2==0 then 
   raise notice '% is even',a;
   else raise notice '% is odd',a; end if;  
   end;               
  $$                 
  language 'plpgsql';
  
CREATE FUNCTION
dhanu=# create or replace function evenOdd(a int)returns void 
as $$ 
begin
   if a%2==0 then 
   raise notice '% is even',a;
   else raise notice '% is odd',a;
   end if;
   end;               
  $$                 
  language 'plpgsql';
  
CREATE FUNCTION
dhanu=# select evenOdd(10);
ERROR:  operator does not exist: integer == integer
LINE 1: a%2==0
           ^
HINT:  No operator matches the given name and argument types. You might need to add explicit type casts.
QUERY:  a%2==0
CONTEXT:  PL/pgSQL function evenodd(integer) line 3 at IF
dhanu=# create or replace function evenOdd(a int)returns void 
as $$ 
begin
   if a%2=0 then 
   raise notice '% is even',a;
   else raise notice '% is odd',a;
   end if;
   end;               
  $$                 
  language 'plpgsql';
  
CREATE FUNCTION
dhanu=# select evenOdd(10);
NOTICE:  10 is even
 evenodd 
---------
 
(1 row)

dhanu=# select evenOdd(5);
NOTICE:  5 is odd
 evenodd 
---------
 
(1 row)

dhanu=# create or replace function positiveNegative(a int)returns void 
as $$ 
begin
   if a>0 then 
   raise notice '% is positive',a;
   else raise notice '% is negative',a;
   end if;
   if a = 0 then 
      raise notice '% is zero',a;
   else raise notice '% is not zero',a;
   end;               
  $$                 
  language 'plpgsql';
  

ERROR:  syntax error at or near ";"
LINE 11:    end;               
               ^
dhanu=# create or replace function positiveNegative(a int)returns void 
as $$ 
begin
   if a>0 then 
   raise notice '% is positive',a;
   else raise notice '% is negative',a;
   end if;
   if a = 0 then 
      raise notice '% is zero',a;
   else raise notice '% is not zero',a; end if;
   end;               
  $$                 
  language 'plpgsql';
  
CREATE FUNCTION
dhanu=# select positiveNegative(10);
NOTICE:  10 is positive
NOTICE:  10 is not zero
 positivenegative 
------------------
 
(1 row)

dhanu=# create or replace function odd()returns void 
as $$ 

declare i int
begin
     raise notice 'All odd no bet 1 to 50',;
     for i in 1..50 loop 
      if i%2!=0 then 
      raise notice '%',1;
      end if;
   end loop;
   end;
  $$                 
  language 'plpgsql';
  

ERROR:  syntax error at or near "begin"
LINE 5: begin
        ^
CONTEXT:  invalid type name "int
begin
     raise notice 'All odd no bet 1 to 50'"
dhanu=# ^[[200~create or replace function odd()returns void 
dhanu-# as $$ 
dhanu$# 
dhanu$# declare i integer
dhanu$# begin
dhanu$#      raise notice 'All odd no bet 1 to 50',;
dhanu$#      for i in 1..50 loop 
dhanu$#       if i%2!=0 then 
dhanu$#       raise notice '%',1;
dhanu$#       end if;
dhanu$#    end loop;
dhanu$#    end;
dhanu$#   $$                 
dhanu-#   language 'plpgsql';
ERROR:  syntax error at or near "
INE 1: create or replace function odd()returns void 
        ^
dhanu=#   
dhanu=# 
dhanu=# create or replace function odd()returns void 
as $$ 

declare i integer
begin
     raise notice 'All odd no bet 1 to 50',;
     for i in 1..50 loop 
      if i%2!=0 then 
      raise notice '%',1;
      end if;
   end loop;
   end;
  $$                 
  language 'plpgsql';
  

ERROR:  syntax error at or near "begin"
LINE 5: begin
        ^
CONTEXT:  invalid type name "integer
begin
     raise notice 'All odd no bet 1 to 50'"
dhanu=# create or replace function odd()returns void 
as $$ 
declare 
i integer;
begin
     raise notice 'All odd no bet 1 to 50:';
     for i in 1..50 loop 
      if i%2!=0 then 
      raise notice '%',1;
      end if;
   end loop;
   end;
  $$                 
  language 'plpgsql';
  

CREATE FUNCTION
dhanu=# select odd();
NOTICE:  All odd no bet 1 to 50:
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
 odd 
-----
 
(1 row)

dhanu=# create or replace function odd()returns void 
as $$ 
declare 
i integer;
begin
     raise notice 'All odd no bet 1 to 50:';
     for i in 1..50 loop 
      if i%2<>0 then 
      raise notice '%',1;
      end if;
   end loop;
   end;
  $$                 
  language 'plpgsql';
  

CREATE FUNCTION
dhanu=# select odd();
NOTICE:  All odd no bet 1 to 50:
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
NOTICE:  1
 odd 
-----
 
(1 row)

dhanu=# create or replace function odd()returns void 
as $$ 
declare 
i integer;
begin
     raise notice 'All odd no bet 1 to 50:';
     for i in 1..50 loop 
      if i%2<>0 then 
      raise notice '%',i;
      end if;
   end loop;
   end;
  $$                 
  language 'plpgsql';
  

CREATE FUNCTION
dhanu=# select odd();
NOTICE:  All odd no bet 1 to 50:
NOTICE:  1
NOTICE:  3
NOTICE:  5
NOTICE:  7
NOTICE:  9
NOTICE:  11
NOTICE:  13
NOTICE:  15
NOTICE:  17
NOTICE:  19
NOTICE:  21
NOTICE:  23
NOTICE:  25
NOTICE:  27
NOTICE:  29
NOTICE:  31
NOTICE:  33
NOTICE:  35
NOTICE:  37
NOTICE:  39
NOTICE:  41
NOTICE:  43
NOTICE:  45
NOTICE:  47
NOTICE:  49
 odd 
-----
 
(1 row)

dhanu=# \d Tech
                       Table "public.tech"
 Column |         Type          | Collation | Nullable | Default 
--------+-----------------------+-----------+----------+---------
 t_no   | integer               |           | not null | 
 t_name | character varying(20) |           |          | 
 age    | integer               |           |          | 
 yr_exp | integer               |           |          | 
Indexes:
    "tech_pkey" PRIMARY KEY, btree (t_no)
Referenced by:
    TABLE "techsub" CONSTRAINT "techsub_t_no_fkey" FOREIGN KEY (t_no) REFERENCES tech(t_no)

dhanu=# select * from Sub;
 scode | sub_name 
-------+----------
     1 | DBMS
     2 | CC
     3 | DSA
     4 | PHP
(4 rows)

dhanu=# \dt
             List of relations
 Schema |     Name      | Type  |  Owner   
--------+---------------+-------+----------
 public | actor         | table | postgres
 public | bed           | table | postgres
 public | book          | table | postgres
 public | client_master | table | postgres
 public | department    | table | postgres
 public | dept          | table | postgres
 public | dept1         | table | postgres
 public | doctor        | table | postgres
 public | donar         | table | postgres
 public | emp           | table | postgres
 public | emp1          | table | postgres
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
 public | std           | table | postgres
 public | std_sub       | table | postgres
 public | std_teacher   | table | postgres
 public | student       | table | postgres
 public | sub           | table | postgres
 public | teacher       | table | postgres
 public | tech          | table | postgres
 public | techsub       | table | postgres
 public | works         | table | postgres
(31 rows)

dhanu=# select std;
ERROR:  column "std" does not exist
LINE 1: select std;
               ^
dhanu=# select * std;
ERROR:  syntax error at or near "std"
LINE 1: select * std;
                 ^
dhanu=# select * from  std;
 roll_no |   name    | address  |   class   
---------+-----------+----------+-----------
       1 | Dhananjay | pune     | FyMsc(CA)
       2 | pratap    | pune     | FyMsc(CA)
       3 | Ram       | Mumbai   | BCS
       4 | Ganesh    | Hydrabad | TyBCS
(4 rows)

dhanu=# select * from  std_teacher;
 student_id | teacher_id 
------------+------------
          1 |        101
          1 |        102
          2 |        101
          3 |        103
(4 rows)

dhanu=# select * from student;
 student_id | student_name | age | grade 
------------+--------------+-----+-------
          1 | Alice        |  14 | 8th
          2 | Bob          |  15 | 9th
          3 | Charlie      |  13 | 7th
(3 rows)

dhanu=# select * from  std_teacher;
 student_id | teacher_id 
------------+------------
          1 |        101
          1 |        102
          2 |        101
          3 |        103
(4 rows)

dhanu=# select * from  teacher;
 teacher_id | teacher_name | subject 
------------+--------------+---------
        101 | Mr. Smith    | Math
        102 | Ms. Johnson  | Science
        103 | Mrs. Lee     | English
(3 rows)

dhanu=# select * from student;
 student_id | student_name | age | grade 
------------+--------------+-----+-------
          1 | Alice        |  14 | 8th
          2 | Bob          |  15 | 9th
          3 | Charlie      |  13 | 7th
(3 rows)

dhanu=# select * from  teacher;
 teacher_id | teacher_name | subject 
------------+--------------+---------
        101 | Mr. Smith    | Math
        102 | Ms. Johnson  | Science
        103 | Mrs. Lee     | English
(3 rows)

dhanu=# select * from  std_teacher;
 student_id | teacher_id 
------------+------------
          1 |        101
          1 |        102
          2 |        101
          3 |        103
(4 rows)

dhanu=# alter table teacher drop subject;
ALTER TABLE
dhanu=# select * from  teacher;
 teacher_id | teacher_name 
------------+--------------
        101 | Mr. Smith
        102 | Ms. Johnson
        103 | Mrs. Lee
(3 rows)

dhanu=# alter table std_teacher add column sub varchar(20);
ALTER TABLE
dhanu=# select * from  std_teacher;
 student_id | teacher_id | sub 
------------+------------+-----
          1 |        101 | 
          1 |        102 | 
          2 |        101 | 
          3 |        103 | 
(4 rows)

dhanu=# update std_teacher set sub = 'Math' where student_id =1;
UPDATE 2
dhanu=# update std_teacher set sub = 'English' where student_id =2;
UPDATE 1
dhanu=# update std_teacher set sub = 'Computer Science' where student_id =3;
UPDATE 1
dhanu=# select * from student;
 student_id | student_name | age | grade 
------------+--------------+-----+-------
          1 | Alice        |  14 | 8th
          2 | Bob          |  15 | 9th
          3 | Charlie      |  13 | 7th
(3 rows)

dhanu=# select * from  teacher;
 teacher_id | teacher_name 
------------+--------------
        101 | Mr. Smith
        102 | Ms. Johnson
        103 | Mrs. Lee
(3 rows)

dhanu=# select * from  std_teacher;
 student_id | teacher_id |       sub        
------------+------------+------------------
          1 |        101 | Math
          1 |        102 | Math
          2 |        101 | English
          3 |        103 | Computer Science
(4 rows)

dhanu=# alter table teacher add column  age int ;
ALTER TABLE
dhanu=# alter table teacher add column  exp int ;
ALTER TABLE
dhanu=# select * from  std_teacher;
 student_id | teacher_id |       sub        
------------+------------+------------------
          1 |        101 | Math
          1 |        102 | Math
          2 |        101 | English
          3 |        103 | Computer Science
(4 rows)

dhanu=# select * from student;
 student_id | student_name | age | grade 
------------+--------------+-----+-------
          1 | Alice        |  14 | 8th
          2 | Bob          |  15 | 9th
          3 | Charlie      |  13 | 7th
(3 rows)

dhanu=# select * from  teacher;
 teacher_id | teacher_name | age | exp 
------------+--------------+-----+-----
        101 | Mr. Smith    |     |    
        102 | Ms. Johnson  |     |    
        103 | Mrs. Lee     |     |    
(3 rows)

dhanu=# select * from  std_teacher;
 student_id | teacher_id |       sub        
------------+------------+------------------
          1 |        101 | Math
          1 |        102 | Math
          2 |        101 | English
          3 |        103 | Computer Science
(4 rows)

dhanu=# update teacher set age = 20 where teacher_id=101;
UPDATE 1
dhanu=# update teacher set age = 25 where teacher_id=102;
UPDATE 1
dhanu=# update teacher set age = 30 where teacher_id=103;
UPDATE 1
dhanu=# update teacher set exp = 3 where teacher_id=103;
UPDATE 1
dhanu=# update teacher set exp = 5 where teacher_id=102;
UPDATE 1
dhanu=# update teacher set exp = 10 where teacher_id=101;
UPDATE 1
dhanu=# select * from student;
 student_id | student_name | age | grade 
------------+--------------+-----+-------
          1 | Alice        |  14 | 8th
          2 | Bob          |  15 | 9th
          3 | Charlie      |  13 | 7th
(3 rows)

dhanu=# select * from  teacher;
 teacher_id | teacher_name | age | exp 
------------+--------------+-----+-----
        103 | Mrs. Lee     |  30 |   3
        102 | Ms. Johnson  |  25 |   5
        101 | Mr. Smith    |  20 |  10
(3 rows)

dhanu=# select * from  std_teacher;
 student_id | teacher_id |       sub        
------------+------------+------------------
          1 |        101 | Math
          1 |        102 | Math
          2 |        101 | English
          3 |        103 | Computer Science
(4 rows)

dhanu=# select * from teacher where exp=(select max(exp) from teacher t . std_teacher st where sub = 'Math' and t.teacher_id= st.teacher_id);
ERROR:  syntax error at or near "."
LINE 1: ...teacher where exp=(select max(exp) from teacher t . std_teac...
                                                             ^
dhanu=# select * from teacher where exp=(select max(exp) from teacher t , std_teacher st where sub = 'Math' and t.teacher_id= st.teacher_id);
 teacher_id | teacher_name | age | exp 
------------+--------------+-----+-----
        101 | Mr. Smith    |  20 |  10
(1 row)

dhanu=# create or replace function MaxExpWithMathSub(sub1 varchar(20))returns void 
as $$ 
declare
t_record teacher%rowtype;//  return teacher row 
begin
select * from teacher where exp=(
select max(exp) from teacher t . std_teacher st where sub = 'sub1' and t.teacher_id= st.teacher_id
);

raise notice 'T_id = %,T_Name = %,T_Exp=%',t_record.teacher_id,t_record.teacher_name,t_record.exp;
   end;
  $$                 
  language 'plpgsql';
  
ERROR:  syntax error at or near "//"
LINE 4: t_record teacher%rowtype;//  return teacher row 
                                 ^
dhanu=# create or replace function MaxExpWithMathSub(sub1 varchar(20))returns void 
as $$ 
declare
t_record teacher%rowtype;//  return teacher row 
begin
select * from teacher where exp=(
select max(exp) from teacher t . std_teacher st where sub = 'sub1' and t.teacher_id= st.teacher_id
);

raise notice 'T_id = %,T_Name = %,T_Exp=%',t_record.teacher_id,t_record.teacher_name,t_record.exp;
   end;
  $$                 
  language 'plpgsql';
  
ERROR:  syntax error at or near "//"
LINE 4: t_record teacher%rowtype;//  return teacher row 
                                 ^
dhanu=# create or replace function MaxExpWithMathSub(sub1 varchar(20))returns void 
as $$ 
declare
t_record teacher%rowtype;
begin
select * from teacher where exp=(
select max(exp) from teacher t . std_teacher st where sub = 'sub1' and t.teacher_id= st.teacher_id
);

raise notice 'T_id = %,T_Name = %,T_Exp=%',t_record.teacher_id,t_record.teacher_name,t_record.exp;
   end;
  $$                 
  language 'plpgsql';
  
ERROR:  syntax error at or near "."
LINE 7: select max(exp) from teacher t . std_teacher st where sub = ...
                                       ^
dhanu=# create or replace function MaxExpWithMathSub(sub1 varchar(20))returns void 
as $$ 
declare
t_record teacher%rowtype;
begin
select * from teacher where exp=(
select max(exp) from teacher t ,std_teacher st where sub = 'sub1' and t.teacher_id= st.teacher_id
);

raise notice 'T_id = %,T_Name = %,T_Exp=%',t_record.teacher_id,t_record.teacher_name,t_record.exp;
   end;
  $$                 
  language 'plpgsql';
  
CREATE FUNCTION
dhanu=# select MaxExpWithMathSub('Math');
ERROR:  query has no destination for result data
HINT:  If you want to discard the results of a SELECT, use PERFORM instead.
CONTEXT:  PL/pgSQL function maxexpwithmathsub(character varying) line 5 at SQL statement
dhanu=# create or replace function MaxExpWithMathSub(sub1 varchar(20))returns void 
as $$ 
declare
t_record teacher%rowtype;
begin
select * into t_record from teacher where exp=(
select max(exp) from teacher t ,std_teacher st where sub = 'sub1' and t.teacher_id= st.teacher_id
);

raise notice 'T_id = %,T_Name = %,T_Exp=%',t_record.teacher_id,t_record.teacher_name,t_record.exp;
   end;
  $$                 
  language 'plpgsql';
  
CREATE FUNCTION
dhanu=# select MaxExpWithMathSub('Math');
NOTICE:  T_id = <NULL>,T_Name = <NULL>,T_Exp=<NULL>
 maxexpwithmathsub 
-------------------
 
(1 row)

dhanu=# create or replace function MaxExpWithMathSub(sub1 varchar(20))returns void 
as $$ 
declare
t_record teacher%rowtype;
begin
select * into t_record from teacher where exp=(
select max(exp) from teacher t ,std_teacher st where sub = sub1 and t.teacher_id= st.teacher_id
);

raise notice 'T_id = %,T_Name = %,T_Exp=%',t_record.teacher_id,t_record.teacher_name,t_record.exp;
   end;
  $$                 
  language 'plpgsql';
  
CREATE FUNCTION
dhanu=# select MaxExpWithMathSub('Math');
NOTICE:  T_id = 101,T_Name = Mr. Smith,T_Exp=10
 maxexpwithmathsub 
-------------------
 
(1 row)

dhanu=# 












