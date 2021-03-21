/*
select sum(bytes)/1024/1024 size_in_mb from dba_data_files;


select sum(bytes)/1024/1024 size_in_mb from dba_segments;



select
( select sum(bytes)/1024/1024/1024 data_size from dba_data_files ) +
( select nvl(sum(bytes),0)/1024/1024/1024 temp_size from dba_temp_files ) +
( select sum(bytes)/1024/1024/1024 redo_size from sys.v_$log ) +
( select sum(BLOCK_SIZE*FILE_SIZE_BLKS)/1024/1024/1024 controlfile_size from v$controlfile) "Size in GB"
from
dual;


select sum(size)/1024/1024/1024 from cdb_data_files;


select b.tablespace_name, tbs_size SizeMb, a.free_space FreeMb
from
(select tablespace_name, round(sum(bytes)/1024/1024 ,2) as free_space
from dba_free_space group by tablespace_name) a,
(select tablespace_name, sum(bytes)/1024/1024 as tbs_size
from dba_data_files group by tablespace_name
UNION
select tablespace_name, sum(bytes)/1024/1024 tbs_size
from dba_temp_files
group by tablespace_name ) b
where a.tablespace_name(+)=b.tablespace_name;

SELECT FILE_ID,ROUND(BYTES/1048579) TOTAL_SPACE
	   FROM DBA_DATA_FILES



select s.FILE_NAME,round(sum(s.BYTES)/1024/1024 ,2),round(sum(s.USER_BYTES)/1024/1024 ,2) from dba_data_files s group by s.FILE_NAME


select round(sum(BYTES)/1024/1024 ,2) from dba_free_space 
where file_id in (select file_id from dba_data_files where file_name='D:\ORACLE\PRODUCT\10.2.0\ORADATA\PAYROLL\EXAMPLE01.DBF')

select FILE_NAME,FILE_ID,ROUND(BYTES/1048579) from dba_data_files

select a.file_name, round(sum(a.BYTES)/1024/1024 ,2), 


select
      tablespace_name,
      round(sum(bytes) / 1048576) TotalSpace
   from
      dba_data_files
   group by
      tablespace_name



SELECT DBA_F.FILE_NAME, ROUND(SUM(FREE_SPC.BYTES)/1048579) AS FREE,  round((DBA_F.bytes) / 1048576) AS TotalSpace,
	   Round((DBA_F.bytes) / 1048576)-ROUND(SUM(FREE_SPC.BYTES)/1048579)
FROM   DBA_DATA_FILES DBA_F, DBA_FREE_SPACE FREE_SPC
WHERE  DBA_F.FILE_ID=FREE_SPC.FILE_ID
AND	   DBA_F.FILE_NAME='D:\ORACLE\PRODUCT\10.2.0\ORADATA\PAYROLL\USERS01.DBF'
GROUP BY DBA_F.FILE_NAME, DBA_F.bytes


ALTER DATABASE DATAFILE 'D:\ORACLE\PRODUCT\10.2.0\ORADATA\PAYROLL\USERS01.DBF' RESIZE 500M;




Select TO_CHAR(sysdate, 'DAY') from dual

*/



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

Select
substr(4.50,instr(4.50,'.')+1,1)"10th place",
--substr(54.789,instr(54.789,'.')+1)"all decimal places"
from dual


