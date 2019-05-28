
------------------- update out time and generat min ,sec dynamic --------------------
/*
TRUNC(DBMS_RANDOM.VALUE(30, 40)) this method return a int value between given range
*/
UPDATE
	TB_DATA_MASTER
SET
   OUTTIME_V='15:'||TRUNC(DBMS_RANDOM.VALUE(30, 40))||':'
			||TRUNC(DBMS_RANDOM.VALUE(10, 20))||' PM'
WHERE
	 OUTTIME_V is null
	 and finyear=2019
	 and finmonth='May';

	
------------------------------------- create new table like as tb_data_master ----------------------------	

create table new_table as ( select * from tb_data_master where FINYEAR=2019 and FINMONTH='May');

drop table new_table; -- Drop new table



---------------------------- Update OT min, OT min_v and insert round ot figure ------------------------------------------------
/*
=> INSTR(DURATION,':') this function have two perametter. First one is get string and second one is get a char.
    This function using for get the location of given char.
=> SUBSTR(DURATION,1,5) this function have three perametter. First one get string, second and thard one is get vhar location.
    This function using for split string between given range/char location. 
=> CASE WHEN (Condition) THEN (Result) END; this keyword stractur like as if else statement.
*/

UPDATE TB_DATA_MASTER
SET (OTMIN)=(
	SELECT 
	CASE 
	-- in this statement SUBSTR(DURATION,1,INSTR(DURATION,':')-1) get hours of Duration.
	-- then -8.5 using for substract 8.5 hours from main hours.
	-- * 60 using for multiply 60 with get hours and find out OT min.
	WHEN (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) < 30 THEN 0

	WHEN (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) >= 28
	 	  AND (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) < 60 THEN 30
		  
	WHEN (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) >= 58
	 	  AND (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) < 88 THEN 60
		  
	WHEN (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) >= 88
	 	  AND (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) < 116 THEN 90
		  
	WHEN (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) >= 116
	 	  AND (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) < 148 THEN 120
		  
	WHEN (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) >= 148
	 	  AND (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) < 178 THEN 150
		  
	WHEN (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) >= 178
	 	  AND (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) < 206 THEN 180
		  
	WHEN (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) >= 206
	 	  AND (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) < 238 THEN 210
		  
	WHEN (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) >= 238
	 	  AND (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) < 268 THEN 240
		  
	WHEN (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) >= 268
	 	  AND (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) < 298 THEN 270
		  
	WHEN (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) >= 298
	 	  AND (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) < 328 THEN 300
		  
	WHEN (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) >= 328
	 	  AND (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) < 358 THEN 330
		  
	WHEN (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) > 358
	 	  AND (((SUBSTR(DURATION,1,INSTR(DURATION,':')-1)-8.5))*60)+SUBSTR(DURATION,INSTR(DURATION,':')+1,2) < 388 THEN 360
		  		  
END
	FROM NEW_TABLE 
	WHERE 
	NEW_TABLE.FINYEAR=TB_DATA_MASTER.FINYEAR
	AND NEW_TABLE.FINMONTH=TB_DATA_MASTER.FINMONTH
	AND NEW_TABLE.CARDNO=TB_DATA_MASTER.CARDNO
	AND NEW_TABLE.PDATE=TB_DATA_MASTER.PDATE
)
WHERE
SUBSTR(DURATION,1,INSTR(DURATION,':')-1) <= 11 -- check Duration hours lower and equal to 11 ?
AND FINMONTH='May'
AND FINYEAR=2019
AND PDATE = TO_DATE('05/27/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
--OR PDATE != TO_DATE('05/10/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
--OR PDATE != TO_DATE('05/17/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
--OR PDATE != TO_DATE('05/24/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS')