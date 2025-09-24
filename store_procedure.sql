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

dhanu=# 

