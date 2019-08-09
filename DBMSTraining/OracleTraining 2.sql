-- SUBQUERIES --

create table stu(
	roll number(20),
	name varchar(20)
);

create table fees(
	roll number(20),
	amount number(10)
);

insert into stu values (1, 'Rakesh');
insert into stu values (2, 'Ramesh');
insert into stu values (3, 'Harish');

insert into fees values (1, 9800);
insert into fees values (2, 10800);
insert into fees values (1, 1000);


-- NEXT Table --

create table marks(
	roll number(20),
	marks number(10),
);

select s.roll, s.name, m.marks
	from stu s join marks m
	on s.roll = m. roll
	where m.marks = (select max(marks) from marks);
	
select roll, name from stu where roll in (
	select roll from marks where marks >= all(
		select max(marks) from marks));
		

-- Corelated subquery --

update marks a
	set marks = (select avg(marks) from marks b where a.roll = b.roll)
	where marks < (select avg(marks) from marks c where a.roll = c.roll);

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

delete from emp100 a where
      a.sal = (select max(sal) from emp b 
      where a.deptno = b.deptno);
