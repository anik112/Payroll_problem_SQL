
UPDATE
	--TB_DATA_MASTER
	TB_DATA_MASTER_TEMP
SET
   OUTTIME='17:'||TRUNC(DBMS_RANDOM.VALUE(10, 20))||':'
			||TRUNC(DBMS_RANDOM.VALUE(10, 20))||' PM',
			
   OUTTIME_V='17:'||TRUNC(DBMS_RANDOM.VALUE(10, 20))||':'
			  ||TRUNC(DBMS_RANDOM.VALUE(10, 20))||' PM',
			  
   DURATION='9:'||TRUNC(DBMS_RANDOM.VALUE(10, 20)),
   
   DURATION_V='9:'||TRUNC(DBMS_RANDOM.VALUE(10, 20)),
   
   OTMIN=0,
   OTPART=0,
   OTMIN_V=0
WHERE
	 --PDATE = TO_DATE('02/11/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
	 --AND SECTIONNM='Sewing'
	 AND FINMONTH='April'
	 AND FINYEAR=2019
	 
	 
--- *******************************
	 
-- ** GET char data convart to int and show
	 
SELECT TO_CHAR(SUBSTR(OUTTIME,1,2)-2/*DUCT NUMBER*/)||':'||
	   TO_CHAR((SUBSTR(OUTTIME,4,2)))||':'||
	   TO_CHAR((SUBSTR(OUTTIME,7,2)))||' PM' OUTTIME,
	   
	   TO_CHAR(SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-2/*DUCT NUMBER*/)||':'||
	   SUBSTR(DURATION,INSTR(DURATION,':')+1,2) DUC,
	   
	   ((TO_NUMBER(SUBSTR(DURATION,1,INSTR(DURATION,':')-1))-2/*DUCT NUMBER*/)-9)*60 OT_MIN,
	   
	   OUTTIME
	   
FROM   TB_DATA_MASTER
WHERE  FINYEAR=2019
AND	   FINMONTH='March'
AND	   CARDNO='018917'
ORDER BY PDATE ASC


--- ******************_*************

-- create temp table like tb_data_master
CREATE TABLE new_table AS ( SELECT * FROM tb_data_master WHERE FINYEAR=2019 AND FINMONTH='March');
-- delete temp table
DROP TABLE new_table


-- ** update outtime and duration and ot DYNAMIC
UPDATE 
TB_DATA_MASTER
-- multipol data SET using single sql
SET (OUTTIME,DURATION,OTMIN,OUTTIME_V,DURATION_V,OTMIN_V)=(
	SELECT (TO_CHAR(SUBSTR(OUTTIME,1,2)-:DUCTIME/*DUCT NUMBER*/)||':'||
		   TO_CHAR((SUBSTR(OUTTIME,4,2)))||':'||
		   TO_CHAR((SUBSTR(OUTTIME,7,2)))||' PM'),
		   
		   TO_CHAR(SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-:DUCTIME/*DUCT NUMBER*/)||':'||
		   SUBSTR(DURATION,INSTR(DURATION,':')+1,2),
		   
    	   (((TO_NUMBER(SUBSTR(DURATION,1,INSTR(DURATION,':')-1))-:DUCTIME/*DUCT NUMBER*/)-9)*60),
		   
		   (TO_CHAR(SUBSTR(OUTTIME,1,2)-2/*DUCT NUMBER*/)||':'||
		   TO_CHAR((SUBSTR(OUTTIME,4,2)))||':'||
		   TO_CHAR((SUBSTR(OUTTIME,7,2)))||' PM'),
		   
		   TO_CHAR(SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-:DUCTIME/*DUCT NUMBER*/)||':'||
		   SUBSTR(DURATION,INSTR(DURATION,':')+1,2),
		   
		   (((TO_NUMBER(SUBSTR(DURATION,1,INSTR(DURATION,':')-1))-:DUCTIME/*DUCT NUMBER*/)-9)*60)
		   
	FROM   NEW_TABLE
	WHERE  CARDNO=TB_DATA_MASTER.CARDNO
	AND    PDATE=TB_DATA_MASTER.PDATE
	)
WHERE  FINYEAR=2019
AND	   FINMONTH='March'
AND	   CARDNO='018979'
--AND PDATE = TO_DATE('03/07/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS');





--- **************************************

SELECT mst_tmp.pdate, mst_tmp.intime, mst_tmp.outtime, mst.intime, mst.outtime, ('15:'||TRUNC(DBMS_RANDOM.VALUE(25, 30))||':'||TRUNC(DBMS_RANDOM.VALUE(10, 59))||' PM')
FROM tb_data_master_temp mst_tmp, tb_data_master mst
WHERE mst_tmp.pdate BETWEEN '15-April-2021' AND '11-May-2021'
AND   mst_tmp.pdate=mst.pdate
AND   TO_NUMBER(SUBSTR(mst_tmp.outtime,1,2)) < 10
AND   mst_tmp.cardno=mst.cardno
AND   mst_tmp.cardno IN (SELECT cardno FROM tb_personal_info
	 		   WHERE company='Apparel Plus Limited.'
			   AND   active=0
			   AND   otcom='N')
			   
			   
			   
			   
UPDATE tb_data_master_temp
SET outtime=('15:'||TRUNC(DBMS_RANDOM.VALUE(25, 30))||':'||TRUNC(DBMS_RANDOM.VALUE(10, 59))||' PM'),
    DURATION = '8:'||TRUNC(DBMS_RANDOM.VALUE(25, 30)),
	OTMIN=0,
	OTPART=0
WHERE pdate BETWEEN '15-April-2021' AND '11-May-2021'
AND   TO_NUMBER(SUBSTR(outtime,1,2)) < 10
AND   cardno IN (SELECT cardno FROM tb_personal_info
	 		   WHERE company='Apparel Plus Limited.'
			   AND   active=0
			   AND   otcom='N'
			   )



