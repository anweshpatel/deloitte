# Oracle db functions

Oracle db is provided with the following functions to work with data in tables. Each column can be passed as a parameter to these functions. Take care of trype string (varchar) and char.

### Basic formatting

- **UPPER()** Temporarily change to UPPERCASE
```SQL
select upper(empName) from employee;
```
- **LOWER()** Temporarily change to lowercase
```SQL
select lower(empName) from employee;
```
- **INITCAP()** Temporarily change to Capital Case
```SQL
select initcap(empName) from employee;
```
- **CONACT( STR, STR)** Concatenate two strings
```SQL
select concat(empName, empAddrss) from employee;
```
- **LENGTH(STR)** find the length of the strings in the column
```SQL
select length(empName) from employee;
```
- **SUBSTR( STR, init_index, fin_index)** Get a substring from one index to another
```SQL
select substr('HelloWorld', 1, 5) from dual;
```
- **INSTR(STR, CHAR)** Find a character position (first in line) from the string
```SQL
select instr('HelloWorld','W') from dual;
```
- **LPAD( , marker)** Create padding on output list on left
```SQL
select lpad(salary, 7, '*') from employee;
```
- **RPAD( , marker)** Create padding on output list on right
```SQL
select rpad(salary, 7, '*') from employee;
```
- **TRIM(CHAR from STR)** Trim the character from the ends of the string
```SQL
select trim('H' from 'HelloWorld') from dual;
```

### Date functions

- **ADD_MONTHS(date, offset)** Returns the date after the offset
```SQL
select empname, add_months(doj, 6) from emp;
```
- **MONTHS_BETWEEN(date, date)** Returns number of months between the dates
```SQL
select empname, months_between(doj, dob)/12 from emp;
```
> To work with days, you can use the + operator

- **TO_DATE(date, format)** Accepts the date in the given format string
```SQL
insert into Orders values('1','10000',to_date('3/3/09','mm/dd/yy'));
```

### General functions

- **NVL(expr1, expr2)** Converts null value to actual value
```SQL
select empname, nvl(salary,0) from employee;
```
Actual data

EMPNAME | SALARY
--- | ---
Om | 90000
Rajesh | 190000
Neha | 20000
Isha | 190000
Tarun | 49000
Kapoor | - 
Pooja | - 

NVL o/p

EMPNAME | SALARY
--- | ---
Om | 90000
Rajesh | 190000
Neha | 20000
Isha | 190000
Tarun | 49000
Kapoor | 0 
Pooja | 0

The type of the column must match with the replacement in NVL

- **NVL2(expr1, expr2, expr3)** If expr1 is not null, expr2 is returned, else expr3 is returne
```SQL
select empname, nvl2(salary,'Salaried','Non-salaried') from employee;
```

EMPNAME | NVL2(SALARY,'SALARIED','NON-SALARIED')
--- | ---
Om | Salaried
Rajesh | Salaried
Neha | Salaried
Isha | Salaried
Tarun | Salaried
Kapoor | Non-salaried
Pooja | Non-salaried

Any data type is allowed in NVL2 unlike NVL

- **NULLIF(expr1, expr2)** If expr1 equals expr2 then it returns null, else, expr1
```SQL
select empname, nullif(salary, 190000) from employee;
```

EMPNAME | NULLIF(SALARY,190000)
--- | ---
Om | 90000
Rajesh | - 
Neha | 20000
Isha | - 
Tarun | 49000
Kapoor | - 
Pooja | - 

- **COALESCE(expr1, expr2, ..., exprn)** Returns the first not null encounter
```SQL
select empID, coalesce(empname, empaddrss) from employee;
```

Actual table

EMPID | EMPNAME | EMPADDRSS | SALARY
--- | --- | --- | ---
1  | Om | Pune | 90000
2 | Rajesh | - | 190000
3 | - | Mumbai | 20000
4 | Isha | Pune | 190000
5 | Tarun | Pune | 49000

COALESCE o/p

EMPID | COALESCE(EMPNAME,EMPADDRSS)
--- | ---
1 | Om
2 | **Rajesh**
3 | **Mumbai**
4 | Isha
5 | Tarun

The highlighted elements have been adjusted by the function. COALESCE can be used with columns of the same dataype only.

- **DECODE** Applies logic similar to case() or if-else-then ladder
```SQL
select empID, empName, empAddrss, DECODE(empaddrss, 'Delhi', 2000, 'Pune', 3000, 4000) from employee;
```

EMPID | EMPNAME | EMPADDRSS | DECODE(EMPADDRSS,'DELHI',2000,'PUNE',3000,4000)
--- | --- | --- | ---
1 | Om | Pune | 3000
2 | Rajesh | Delhi | 2000
3 | Neha | Mumbai | 4000
4 | Isha | Pune  | 3000
5 | Tarun | Pune | 3000
6 | Kapoor | - | 4000
7 | Pooja | -  | 4000

The above table gives an example of varrying HRA based on city

### Aggregation functions

- **COUNT()** Counts the number of rows
```SQL
select count(*) from employee where salary is not null;
```

- **Group By** Groups the output based on a distinct column
- **SUM()**
- **AVG()**
- **MIN()**
- **MAX()**