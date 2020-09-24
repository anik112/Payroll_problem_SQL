
----------------- ********* update OT without rendom value


--- check
select '17'||substr(mst.OUTTIME,3), '9'||substr(mst.DURATION, instr(mst.DURATION,':')),instr(mst.DURATION,':')
from tb_data_master mst
where finyear=2020
and finmonth='August'


-- update
UPDATE TB_DATA_MASTER_TEMP temp
SET (OUTTIME, OUTTIME_V, DURATION, DURATION_V, OTMIN, OTPART, OTMIN_V)
=(select '17'||substr(mst.OUTTIME,3),
		'17'||substr(mst.OUTTIME_V,3),
		'9'||substr(mst.DURATION, instr(mst.DURATION,':')),
		'9'||substr(mst.DURATION_V, instr(mst.DURATION_V,':')),
		0,
		0,
		0
 from tb_data_master mst
	 WHERE mst.finyear=temp.finyear
	 and mst.finmonth=temp.finmonth
	 and mst.pdate=temp.pdate
	 and mst.CARDNO=temp.cardno)
WHERE finyear=2020
and finmonth='August'
and LENGTH(OUTTIME)<11
--and pdate='2-August-2020'


--- check
select cardno from tb_data_master_temp
where LENGTH(OUTTIME)<11
and finyear=2020
and finmonth='August'
--and pdate='30-August-2020'











--- ********** update in - out time depend on duration
UPDATE 
TB_DATA_MASTER
-- multipol data SET using single sql 
SET (OUTTIME,DURATION,OTMIN,OUTTIME_V,DURATION_V,OTMIN_V)=(
	SELECT -- ** orginal mode
		   (TO_CHAR(SUBSTR(INTIME,1,2)+:DURTION_NUMBER/*DURATION NUMBER*/)||':'||
		   TRUNC(DBMS_RANDOM.VALUE(10, 20))||':'||
		   TRUNC(DBMS_RANDOM.VALUE(10, 59))||' PM'),-- update OUTTIME 
		   
		   :DURTION_NUMBER/*DURATION NUMBER*/||':'||TRUNC(DBMS_RANDOM.VALUE(10, 20)),-- update DURATION
		   
    	   ((:DURTION_NUMBER/*DURATION NUMBER*/-9)*60),-- update OTMIN 
		   
		   -- ** complience mode
		   (TO_CHAR(SUBSTR(INTIME,1,2)+:DURTION_NUMBER/*DURATION NUMBER*/)||':'||
		   TRUNC(DBMS_RANDOM.VALUE(10, 20))||':'||
		   TRUNC(DBMS_RANDOM.VALUE(10, 59))||' PM'), -- update OUTTIME_V 
		   
		   :DURTION_NUMBER/*DURATION NUMBER*/||':'||TRUNC(DBMS_RANDOM.VALUE(10, 20)), -- update DURATION_V
		   
    	   ((:DURTION_NUMBER/*DURATION NUMBER*/-9)*60) -- update OTMIN_V 
		   
	FROM   NEW_TABLE
	WHERE  CARDNO=TB_DATA_MASTER.CARDNO
	AND    PDATE=TB_DATA_MASTER.PDATE
	)
WHERE  FINYEAR=2019
AND	   FINMONTH='March'
AND	   CARDNO='018979'
--AND PDATE = TO_DATE('03/07/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS');



----------- checks


UPDATE TB_DATA_MASTER_TEMP
SET OUTTIME=substr(outtime,1,3)||TRUNC(DBMS_RANDOM.VALUE(10, 20))||substr(outtime,6)
where finyear=2020 and finmonth='June'
and substr(outtime,4,2)> 25
