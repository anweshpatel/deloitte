# Oracle DB Subqueries

A query within a query used to retrieve info from a db is called a subquery. It is a select statement nested within another select statement.

Consider the below script, used to create two tables:

```SQL
create table stu(
	roll number(20),
	name varchar(20)
);

create table fees(
	roll number(20),
	amount number(10)
);
```

We enter the data into the tables as:-

ROLL | NAME
--- | ---
1 | Rakesh
2 | Ramesh
3 | Harish

ROLL | AMOUNT
--- | ---
1 | 9800
2 | 10800
1 | 1000

If we wish to retrieve the name of the student who deposited 9800, we have to write two queries:

```SQL
select roll from fees where amount = 9800; -- Returns 1
select name from stu where roll = 1; -- As retrieved earlier
```

We can merge the two queries into one to perform our desired task:-

```SQL
select name from stu where roll = (select roll from fees where amount = 9800);
```

 .| Name
 --- | ---
 . | Rakesh

However, if we have multiple rows returned from a subquery, we can replace **=** with **in**:-

ROLL | AMOUNT
--- | ---
1 | 9800
2 | 10800
1 | 1000
3 | 9800
3 | 1000

```SQL
select name from stu where roll in (select roll from fees where amount = 9800);
```

. | Name
 --- | ---
. | Rakesh
. | Harish

The above can be used for single rows as well.

### Special keywords

**ANY** selects the least of values returned by a subquery
**ALL** selects the max of values returned by a subquery
**EXISTS** returns true if a subquery returns any rows

## Corelated subqueries

These are used to iterate through the rows and apply changes to each row. For this example we take the following table:-

```SQL
create table emp100(
    empId integer,
    empName varchar(20),
    sal integer,
    deptno integer
);

insert into emp100 values(1,'Tufail',980000,1);
insert into emp100 values(2,'Ahmed',80000,1);
insert into emp100 values(3,'Khan',90000,2);
insert into emp100 values(4,'Tarun',20000,2);
insert into emp100 values(5,'Neha',950000,2);
```

In this we wish to delete the highest paid employees from each department. We can do it using the following script:-

```SQL
delete from emp100 a where
      a.sal = (select max(sal) from emp100 b 
      where a.deptno = b.deptno);
```

The alias **a** represents the *outer query* which operates one row after another. The alias **b** represents the table in the *inner query* which operates on the entire table on each iteration of the outer query.

In psuedo code:-

```Python
a is an object of emp100
b is an object of emp100

for each row in a:
	if a.row.sal = max of all sal in b && a.row.deptno == b.row.deptno:
		delete a.row
```

