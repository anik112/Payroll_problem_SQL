
/*
create table new_table as ( select * from tb_data_master where FINYEAR=2019 and FINMONTH='March');

drop table new_table

select otmin+1 from new_table where  new_table.cardno=tb_data_master.cardno


SELECT TO_CHAR('5' + 1) 
FROM dual;


select otmin+1 from new_table where  new_table.cardno='018917' and PDATE = TO_DATE('03/06/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
*/
SELECT LENGTH('w3resource.com') "Length in characters"
FROM DUAL;

/* ** get hours like: 14:15.
 	  1=1
	  4=2
	  :=3
	  1=4
	  5=5
*/
select to_char(SUBSTR(DURATION,2,1) + 1) from tb_data_master where cardno='018917' and FINYEAR=2019 and FINMONTH='March';

/* ** get min like: 14:15.
 	  1=-5
	  4=-4
	  :=-3
	  1=-2
	  5=-1
*/
-- get min 
-- INSTR(DURATION,':') this function get the postion of ':' char 
-- INSTR(DURATION,':')+1 this method get next positon 
select SUBSTR(DURATION,INSTR(DURATION,':')+1,2) from tb_data_master where cardno='018917' and FINYEAR=2019 and FINMONTH='March';
-- get hours
-- INSTR(DURATION,':')-1 this method get previous position of ':" char
select SUBSTR(DURATION,1,INSTR(DURATION,':')-1) from tb_data_master where cardno='018917' and FINYEAR=2019 and FINMONTH='March';


select SUBSTR(DURATION,INSTR(DURATION,':')+1,2) 
from tb_data_master 
where FINYEAR=2019 and FINMONTH='March';





--- **** update ot hour

update tb_data_master
set
OTMIN=(select otmin+60 from new_table where  new_table.cardno=tb_data_master.cardno and PDATE = TO_DATE('03/06/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS'))
where 
PDATE = TO_DATE('03/06/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
and otmin>0
and cardno='000849';




--- ****** update duration with add some hours

UPDATE TB_DATA_MASTER	   -- update master table Duration
SET    DURATION=(
-- get old Duration from anathor table
-- SUBSTR use for split string using str location
-- TO_CHAR use for add int value with string value
SELECT TO_CHAR(SUBSTR(DURATION,1,INSTR(DURATION,':')-1)+2)||':'||SUBSTR(DURATION,INSTR(DURATION,':')+1,2)
FROM   NEW_TABLE 
WHERE  CARDNO=TB_DATA_MASTER.CARDNO
AND	   PDATE=TB_DATA_MASTER.PDATE )
-- filtering master data
WHERE  FINYEAR=2019
AND	   FINMONTH='March'
AND	   CARDNO='018917'
--AND PDATE = TO_DATE('03/03/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS');

