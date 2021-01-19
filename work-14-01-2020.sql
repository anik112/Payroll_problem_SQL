ALTER DATABASE DATAFILE 'D:\ORACLE\PRODUCT\10.2.0\ORADATA\PAYROLL\UNDOTBS01.DBF' AUTOEXTEND ON



SELECT * FROM DBA_RECYCLEBIN


delete FROM DBA_RECYCLEBIN


select tablespace_name from all_tables where owner = 'PAYROLL'


SELECT DISTINCT sgm.TABLESPACE_NAME , dtf.*
FROM DBA_SEGMENTS sgm
JOIN DBA_DATA_FILES dtf ON (sgm.TABLESPACE_NAME = dtf.TABLESPACE_NAME)
WHERE sgm.OWNER = 'PAYROLL'


SELECT a.file_name,
       substr(A.tablespace_name,1,14) tablespace_name,
       trunc(decode(A.autoextensible,'YES',A.MAXSIZE-A.bytes+b.free,'NO',b.free)/1024/1024) free_mb,
       trunc(a.bytes/1024/1024) allocated_mb,
       trunc(A.MAXSIZE/1024/1024) capacity,
       a.autoextensible ae
FROM (
     SELECT file_id, file_name,
            tablespace_name,
            autoextensible,
            bytes,
            decode(autoextensible,'YES',maxbytes,bytes) maxsize
     FROM   dba_data_files
     GROUP BY file_id, file_name,
              tablespace_name,
              autoextensible,
              bytes,
              decode(autoextensible,'YES',maxbytes,bytes)
     ) a,
     (SELECT file_id,
             tablespace_name,
             sum(bytes) free
      FROM   dba_free_space
      GROUP BY file_id,
               tablespace_name
      ) b
WHERE a.file_id=b.file_id(+)
AND A.tablespace_name=b.tablespace_name(+)
ORDER BY A.tablespace_name ASC; 




SELECT DATA_FILES.TABLESPACE_NAME,DATA_FILES.FILE_NAME, DATA_FILES.BYTES/1024/1024 AS TOTAL_SIZE,
SUM(FREE_SPACE.BYTES)/1024/1024 AS FREE_SPACE , ((DATA_FILES.BYTES/1024/1024)-(SUM(FREE_SPACE.BYTES)/1024/1024))
FROM DBA_DATA_FILES DATA_FILES, DBA_FREE_SPACE FREE_SPACE
WHERE DATA_FILES.FILE_ID=FREE_SPACE.FILE_ID
GROUP BY DATA_FILES.TABLESPACE_NAME,DATA_FILES.FILE_NAME, DATA_FILES.BYTES



select * from DBA_DATA_FILES


update DBA_DATA_FILES 
set BYTES=3145728000
where file_id=5


SELECT DATA_FILES.TABLESPACE_NAME,DATA_FILES.FILE_NAME, DATA_FILES.BYTES/1024/1024 AS TOTAL_SIZE,
SUM(FREE_SPACE.BYTES)/1024/1024 AS FREE_SPACE , ((DATA_FILES.BYTES/1024/1024)-(SUM(FREE_SPACE.BYTES)/1024/1024)) useing
FROM DBA_DATA_FILES DATA_FILES, DBA_FREE_SPACE FREE_SPACE
WHERE DATA_FILES.FILE_ID=FREE_SPACE.FILE_ID
GROUP BY DATA_FILES.TABLESPACE_NAME,DATA_FILES.FILE_NAME, DATA_FILES.BYTES



select * from tb_personal_info 
where company='Apparel Plus Ltd.'
and	  active=1
and	  RESIGNATION_DATE between '01-Oct-2020' and '31-Dec-2020' 


select * from TB_PERSONAL_INFO_RESIGNATION
where company='Apparel Plus Ltd.'
and	  cardno in (
select cardno from tb_personal_info 
where company='Apparel Plus Ltd.'
and	  active=1
and	  RESIGNATION_DATE between '01-Oct-2020' and '31-Dec-2020' 
)




select cardno from tb_personal_info 
where company='Apparel Plus Ltd.'
and	  active=1
and	  RESIGNATION_DATE between '01-Oct-2020' and '30-Oct-2020'



