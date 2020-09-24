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
WHERE condition ---[if any have]

``````````

##### Update row with another table data using SUBSTR()
`````sql
--- DATA UPDATE IN TB_DATA_MASTER_TEMP
--- DATA TAKE FROM TB_DATA_MASTER
UPDATE TB_DATA_MASTER_TEMP temp
SET (OUTTIME, OUTTIME_V)
=(select '17'||substr(mst.OUTTIME,3), '17'||substr(mst.OUTTIME_V,3)
   FROM tb_data_master mst
	 WHERE mst.finyear=temp.finyear
	 AND mst.finmonth=temp.finmonth
	 AND mst.pdate=temp.pdate
	 AND mst.CARDNO=temp.cardno)
WHERE finyear=2020
AND finmonth='August'
AND LENGTH(OUTTIME)<11
```````````````
There outtime like '17:01:12 PM' or substr(mst.OUTTIME,3) like ':01:12 PM'. 
