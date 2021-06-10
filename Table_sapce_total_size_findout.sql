
SELECT SUM(bytes)/1024/1024 size_in_mb FROM dba_data_files;


SELECT SUM(bytes)/1024/1024 size_in_mb FROM dba_segments;



SELECT
( SELECT SUM(bytes)/1024/1024/1024 data_size FROM dba_data_files ) +
( SELECT NVL(SUM(bytes),0)/1024/1024/1024 temp_size FROM dba_temp_files ) +
( SELECT SUM(bytes)/1024/1024/1024 redo_size FROM sys.v_$log ) +
( SELECT SUM(BLOCK_SIZE*FILE_SIZE_BLKS)/1024/1024/1024 controlfile_size FROM v$controlfile) "Size in GB"
FROM
dual;


SELECT SUM(SIZE)/1024/1024/1024 FROM cdb_data_files;


SELECT b.tablespace_name, tbs_size SizeMb, a.free_space FreeMb
FROM
(SELECT tablespace_name, ROUND(SUM(bytes)/1024/1024 ,2) AS free_space
FROM dba_free_space GROUP BY tablespace_name) a,
(SELECT tablespace_name, SUM(bytes)/1024/1024 AS tbs_size
FROM dba_data_files GROUP BY tablespace_name
UNION
SELECT tablespace_name, SUM(bytes)/1024/1024 tbs_size
FROM dba_temp_files
GROUP BY tablespace_name ) b
WHERE a.tablespace_name(+)=b.tablespace_name;

SELECT FILE_ID,ROUND(BYTES/1048579) TOTAL_SPACE
	   FROM DBA_DATA_FILES



SELECT s.FILE_NAME,ROUND(SUM(s.BYTES)/1024/1024 ,2),ROUND(SUM(s.USER_BYTES)/1024/1024 ,2) FROM dba_data_files s GROUP BY s.FILE_NAME


SELECT ROUND(SUM(BYTES)/1024/1024 ,2) FROM dba_free_space 
WHERE file_id IN (SELECT file_id FROM dba_data_files WHERE file_name='D:\ORACLE\PRODUCT\10.2.0\ORADATA\PAYROLL\EXAMPLE01.DBF')

SELECT FILE_NAME,FILE_ID,ROUND(BYTES/1048579) FROM dba_data_files

SELECT a.file_name, ROUND(SUM(a.BYTES)/1024/1024 ,2), 


SELECT
      tablespace_name,
      ROUND(SUM(bytes) / 1048576) TotalSpace
   FROM
      dba_data_files
   GROUP BY
      tablespace_name



SELECT DBA_F.FILE_NAME, ROUND(SUM(FREE_SPC.BYTES)/1048579) AS FREE,  ROUND((DBA_F.bytes) / 1048576) AS TotalSpace,
	   ROUND((DBA_F.bytes) / 1048576)-ROUND(SUM(FREE_SPC.BYTES)/1048579)
FROM   DBA_DATA_FILES DBA_F, DBA_FREE_SPACE FREE_SPC
WHERE  DBA_F.FILE_ID=FREE_SPC.FILE_ID
AND	   DBA_F.FILE_NAME='D:\ORACLE\PRODUCT\10.2.0\ORADATA\PAYROLL\USERS01.DBF'
GROUP BY DBA_F.FILE_NAME, DBA_F.bytes


ALTER DATABASE DATAFILE 'D:\ORACLE\PRODUCT\10.2.0\ORADATA\PAYROLL\USERS01.DBF' RESIZE 500M;




SELECT TO_CHAR(SYSDATE, 'DAY') FROM dual



SELECT DBA_F.FILE_NAME, ROUND(SUM(FREE_SPC.BYTES)/1048579) AS FREE,  ROUND((DBA_F.bytes) / 1048576) AS TotalSpace,
	   ROUND((DBA_F.bytes) / 1048576)-ROUND(SUM(FREE_SPC.BYTES)/1048579), free_spc.BLOCK_ID, free_spc.BLOCKS, free_spc.BYTES, 'Free'
FROM   DBA_DATA_FILES DBA_F, DBA_FREE_SPACE FREE_SPC
WHERE  DBA_F.FILE_ID=FREE_SPC.FILE_ID
AND	   DBA_F.FILE_NAME='D:\ORACLE\PRODUCT\10.2.0\ORADATA\PAYROLL\USERS01.DBF'
GROUP BY DBA_F.FILE_NAME, DBA_F.bytes, free_spc.BLOCK_ID, free_spc.BLOCKS, free_spc.BYTES



SELECT file_id, block_id, blocks, bytes FROM dba_free_space
WHERE tablespace_name = 'USRPICTURE'
AND file_id = 194
AND ROWNUM < 7
ORDER BY block_id DESC;


------------------------------------------------ Others  




DECLARE
V_DATE DATE:='30-July-2020';
V_DAY VARCHAR(50 BYTE);

TYPE DATES IS VARRAY(5) OF DATE;
FRIDAY DATES:=DATES();

I NUMBER:=1;
J NUMBER:=0;
BEGIN
LOOP
	EXIT WHEN I>30;
		 V_DATE:=(I||'-July-2020');
		 SELECT TO_CHAR(V_DATE, 'DAY') INTO V_DAY FROM DUAL;
		 DBMS_OUTPUT.PUT_LINE(V_DATE||' => '||V_DAY);
		 
		IF V_DAY='FRIDAY' THEN
		 	FRIDAY(J):=V_DAY;
		END IF;
			
	I:=I+1;
	J:=J+1;
END LOOP;

DBMS_OUTPUT.PUT_LINE('====================');

I:=0;
LOOP 
EXIT WHEN I>5;
	 DBMS_OUTPUT.PUT_LINE('FRI-DAY: '||FRIDAY(I));
	 I:=I+1;
END LOOP;
END;


----------------------------------------------

UPDATE TB_DATA_MASTER
SET INTIME= SUBSTR(INTIME,1,INSTR(INTIME,':')-1)



SELECT (SUBSTR(INTIME,INSTR(INTIME,':')+1,INSTR(INTIME,':')-1))+:DUCT_MIN, INTIME FROM TB_DATA_MASTER 
WHERE (SUBSTR(INTIME,INSTR(INTIME,':')+1,INSTR(INTIME,':')-1))<(59-:DUCT_MIN)


SELECT SUBSTR(INTIME,1,INSTR(INTIME,':')-1) FROM TB_DATA_MASTER

SELECT SUBSTR(INTIME,6,11), INTIME FROM TB_DATA_MASTER

SELECT
SUBSTR(4.50,INSTR(4.50,'.')+1,1)"10th place",
--substr(54.789,instr(54.789,'.')+1)"all decimal places"
FROM dual


-------------------------------------

-- CHECK AUTO extande
SELECT tablespace_name, file_name, autoextensible FROM dba_data_files;

-- set curser size 
ALTER SYSTEM SET open_cursors = 5000 SCOPE=BOTH;