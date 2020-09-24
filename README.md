# Payroll_problem_SQL
All problem SQL of PAYROLL

>> There have all SQL file which i used in support of payroll system.
>> Vistasoft IT Bangladesh Ltd.

##### Insert data dynamically one table to another
````sql
---- static
INSERT INTO table (col1, col2, col3) VALUES (val1, val2, val);

--- dynamic
INSERT INTO table (col1, col2, col3)
SELECT col1, col2, col3 FROM table2
WHERE condition //[if any have]

``````````
