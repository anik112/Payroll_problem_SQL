-- get data from file and store in database  
DECLARE
--v_inputText VARCHAR2(150) :='001:0000012114:20210922:154001:11';

v_file UTL_FILE.FILE_TYPE;
v_output VARCHAR(150);

BEGIN

v_file := UTL_FILE.FOPEN('DIR_DATALOAD','161120200308.txt','R');

LOOP
BEGIN
UTL_FILE.GET_LINE(v_file,v_output);
DBMS_OUTPUT.PUT_LINE(v_output);

IF LENGTH(RTRIM(LTRIM(v_output))) > 29 THEN

-- INsert data into load table 
INSERT INTO TEST_DATA_LOAD (MACHINENO, SECRETENO, DATADATE, DATATIME, STATUS)
VALUES (SUBSTR(v_output,0,3), SUBSTR(v_output,5,10), SUBSTR(v_output,16,8), SUBSTR(v_output,25,6), SUBSTR(v_output,32,2));

END IF;
EXCEPTION WHEN NO_DATA_FOUND THEN EXIT; 
END;

END LOOP;

UTL_FILE.FCLOSE(v_file);
END;


--  get Data from data load table and store in master data table 
DECLARE 

v_company VARCHAR2(255) :='Woo Ree Apparels Ltd.';
v_worker_type VARCHAR2(85) := 'Worker';
v_shift       VARCHAR2(10) := 'G';

v_cardno VARCHAR(150);

v_inputINTIME VARCHAR2(85);
v_inputOUTIME VARCHAR2(85);
v_inputDATE   VARCHAR2(85);
v_inputSECRECTNO VARCHAR2(150);
v_intime_strt VARCHAR2(85);
v_last_intime VARCHAR2(85);
v_late_time   VARCHAR2(85);
v_exit_time   VARCHAR2(85);

BEGIN

------ get in time and out time  

FOR cls IN ( 
SELECT  SECRETENO, DATADATE, MAX(DATATIME) ottime, MIN(DATATIME) intime 
FROM TEST_DATA_LOAD 
GROUP BY SECRETENO, DATADATE
) LOOP 

-- get duty schedule setup  
SELECT TO_CHAR(instarttime,'hh24mmss'), TO_CHAR(latestarttime,'hh24mmss'), 
	   TO_CHAR(lastintime,'hh24mmss'),  TO_CHAR(exittime,'hh24mmss')
INTO   v_intime_strt, v_late_time , v_last_intime, v_exit_time
FROM TB_DUTY_SCHEDULE_SETUP
WHERE company        = v_company
AND   section_worker = v_worker_type
AND   shift          = v_shift;

IF cls.intime > v_late_time THEN
DBMS_OUTPUT.PUT_LINE(cls.SECRETENO||' > '||cls.DATADATE||' > '||cls.||' >>>> Late');
END IF;

END LOOP;
END;







----------------- Test Code  -------------------========================
--====================================================================

CREATE DIRECTORY DIR_DATALOAD AS 'D:\DATA\';


DECLARE
V1 VARCHAR2(200); --32767
F1 UTL_FILE.FILE_TYPE;
BEGIN
F1 := UTL_FILE.FOPEN('DIR_DATALOAD','161120200308.txt','R');
LOOP
BEGIN
UTL_FILE.GET_LINE(F1,V1);
DBMS_OUTPUT.PUT_LINE(V1);
EXCEPTION WHEN NO_DATA_FOUND THEN EXIT; END;
END LOOP;

IF UTL_FILE.IS_OPEN(F1) THEN
DBMS_OUTPUT.PUT_LINE('File is Open');
END IF;

UTL_FILE.FCLOSE(F1);
END; 



------------- test purpouse 


SELECT LENGTH(RTRIM(LTRIM('  asdjhcnif dhfu'))) FROM dual


SELECT  SECRETENO, DATADATE, MAX(DATATIME), MIN(DATATIME) FROM TEST_DATA_LOAD GROUP BY SECRETENO, DATADATE

SELECT instarttime, TO_CHAR(instarttime,'hh24mmss'), latestarttime, TO_CHAR(latestarttime,'hh24mmss'), 
lastintime, TO_CHAR(lastintime,'hh24mmss'), exittime, TO_CHAR(exittime,'hh24mmss')
FROM TB_DUTY_SCHEDULE_SETUP
WHERE company=:p_company
AND   section_worker = :p_worker
AND   shift = :p_shift

