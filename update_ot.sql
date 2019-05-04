create table new_table as ( select * from tb_data_master where FINYEAR=2019 and FINMONTH='March');

drop table new_table

select otmin+1 from new_table where  new_table.cardno=tb_data_master.cardno


SELECT TO_CHAR('5' + 1) 
FROM dual;


select otmin+1 from new_table where  new_table.cardno='018917' and PDATE = TO_DATE('03/06/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS')


select to_char(SUBSTR(DURATION,1,2) + 1) from tb_data_master where cardno='018917' and FINYEAR=2019 and FINMONTH='March';


--- ** update ot hour

update tb_data_master
set
OTMIN=(select otmin+60 from new_table where  new_table.cardno=tb_data_master.cardno and PDATE = TO_DATE('03/06/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS'))
where 
PDATE = TO_DATE('03/06/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
and otmin>0
and cardno='000849';

