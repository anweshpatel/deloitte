create table employee(
	empID integer,
	empName varchar(20),
	empAddrss varchar(20),
	salary integer
)

insert into employee values(1, 'Om', 'Pune', 90000);

desc employee; -- Describe the schema

select * from employee; -- Retreives all columns from employee table
select empName from employee; -- get only column of names

select distinct(empAddrss) from employee; -- get only distinct values eg. departments

select empID, empName, salary, salary+100  from employee; -- operators like +, -, and * can be used to compute from numeric tables

insert into employee values(6, 'Kapoor', null, null); -- null can be used for blank values

insert into employee (empID, empName) values(7, 'Pooja'); -- All "not null" columns must be present here

select * from employee where salary is null; -- Where can be used to provide conditions for each column

select * from employee where salary is not null order by salary desc; -- order by can be used to sort the table by a column

select salary, salary+1000 as newSalary from employee; -- "as" keyword can be used to assign alias to columns 

select * from employee where salary between 20000 and 60000; -- between can be used to provide a range

select * from employee where  empName like 'T%'; -- like is used to provide wildcards

select * from employee where empAddrss not in ('Delhi', 'Pune'); -- "in" operator can be used to filter the columns

select * from employee where empaddrss in 'Delhi' or empName like 'P%'; -- logical operators like and, or & not can be used in expressions


-- Next table --

create table emp(
	empid integer,
	empname varchar(20),
	dob date,
	doj date
)

insert into emp values (1, 'Rakesh', '09/02/1997', '10/02/2019'); -- mm/dd/yyyy format

-- Next Table - Keys --

create table emp45(
	empID integer primary key,
	empName varchar(20),
	empAddrss varchar(20),
	mobile char(10),
	salary integer
)

-- CONSTRAINTS --

create table student_T(
	roll varchar(10) CONSTRAINT studentPK primary key,
	name varchar(20) constraint StudentNameNotNull not null,
	address varchar(20) CONSTRAINT addressCheck check(address in ('Delhi', 'Mumbai', 'Chennai')),
	Marks number CONSTRAINT marksCheck check(marks between 0 and 100)
)

-- DEFAULT -- 

create table LOAN_PAYMENT(
	loanno number(4) primary key,
	loanStatus varchar2(10) CONSTRAINT loanStatusCheck check(loanStatus=upper(loanStatus)),
	amount number(10) not null,
	updateDate date default sysdate,
	prodKey varchar2(5)
)

insert into LOAN_PAYMENT values(124,'PAID',250000,default,'90');

-- ASSIGNMENT --

create table Employee1(
	employeeID varchar(10) CONSTRAINT emp_id_PK primary key,
	employeeName varchar2(20) CONSTRAINT NameNotNull not null,
	employeeAddress varchar2(20) CONSTRAINT AddressCheck check(employeeAddress not in ('Newyork', 'London', 'Paris')),
	salary integer CONSTRAINT SalaryCheck check(salary between 20000 and 30000),
	companyAddress varchar2(20) DEFAULT 'ASV Suntech Park'
)

-- ALTER TABLE --

alter table employee rename column empAddrss to empAddress;

alter table employee add email varchar(20);

-- FOREIGN KEY --

create table dept_table(
	dept_no integer primary key,
	dept_name varchar2(20),
	location varchar2(20) not null
)

create table emp(
	emp_id integer primary key,
	empname varchar2(20) not null,
	salary integer,
	desig varchar2(20),
	dept_no integer
)

alter table emp add constraint fkdept foreign key(dept_no) references dept(dept_no);


-- CASCADE --

CREATE TABLE SECTION (
SECTION_ID INTEGER CONSTRAINT S_ID CHECK (SECTION_ID > 0),
SECTION_NAME CHAR(30) CONSTRAINT S_NAME NOT NULL,
BOOK_COUNT INTEGER,
CONSTRAINT SECT_PRIME PRIMARY KEY (SECTION_ID));

CREATE TABLE BOOK
(
ISBN INTEGER CONSTRAINT B_ISBN CHECK (ISBN BETWEEN 1 AND 2000),
TITLE VARCHAR2(200) CONSTRAINT B_TITLE NOT NULL,
AUTHOR VARCHAR2(50) CONSTRAINT B_AUTH NOT NULL,
LENT_DATE DATE,
RETURNED_DATE DATE,
TIMES_LENT NUMBER(6),
SECTION_ID NUMBER(3),
CONSTRAINT BOOK_PRIME PRIMARY KEY (ISBN),
CONSTRAINT BOOK_SECT FOREIGN KEY (SECTION_ID) REFERENCES SECTION(SECTION_ID)
ON DELETE CASCADE);

INSERT INTO SECTION values(1,'ABC',78);

INSERT INTO SECTION values(2,'XYZ',65);

insert into BOOK values(1,'java','james',to_date('3/3/09','mm/dd/yy'),to_date('3/4/09','mm/dd/yy'),10,1);

select * from section;

select * from book;

delete from section where section_id = 1;

-- JOINS --

create table Suppliers
(
   supplier_id varchar(20),
   supplier_name varchar(20)
)
 
create table Orders
(
  order_id varchar(20),
  supplier_id varchar(20),
  order_date date
)
 
insert into Suppliers values('10000','IBM');
insert into Suppliers values('10001','Hewlett Packard');
insert into Suppliers values('10002','Microsoft');
insert into Suppliers values('10003','TCS');
 
insert into Orders values('1','10000',to_date('3/3/09','mm/dd/yy'));
insert into Orders values('2','10000',to_date('7/5/10','mm/dd/yy'));
insert into Orders values('3','10001',to_date('12/8/10','mm/dd/yy'));

select order_id, supplier_name
from orders, suppliers 
where orders.supplier_id = suppliers.supplier_id; -- Without aliases

select order_id, supplier_name, s.supplier_id 
from orders o, suppliers s 
where o.supplier_id = s.supplier_id; -- With aliases

select order_id, supplier_name, s.supplier_id 
from orders o join suppliers s 
on o.supplier_id = s.supplier_id; -- JOIN

select order_id, supplier_name, s.supplier_id 
from orders o right outer join suppliers s 
on o.supplier_id = s.supplier_id; -- outer join (right) - from suppliers, all data

select order_id, supplier_name, s.supplier_id 
from orders o left outer join suppliers s 
on o.supplier_id = s.supplier_id; -- outer join (left) - from orders, all data

select order_id, supplier_name, s.supplier_id 
from orders o full outer join suppliers s 
on o.supplier_id = s.supplier_id; -- outer join on all data