CREATE OR REPLACE FUNCTION UPDATE_TABLESPACE IS

DATABASE_SIZE	  NUMBER:=500;
TB_SPACE_INDEX	  VARCHAR(255 BYTE):='D:\ORACLE\PRODUCT\10.2.0\ORADATA\PAYROLL\INDX01.DBF';
TB_SPACE_SYX	  VARCHAR(255 BYTE):='D:\ORACLE\PRODUCT\10.2.0\ORADATA\PAYROLL\SYSAUX01.DBF';
TB_SPACE_SYS1	  VARCHAR(255 BYTE):='D:\ORACLE\PRODUCT\10.2.0\ORADATA\PAYROLL\SYSTEM01.DBF';
TB_SPACE_SYS2	  VARCHAR(255 BYTE):='D:\ORACLE\PRODUCT\10.2.0\ORADATA\PAYROLL\SYSTEM02.DBF';
TB_SPACE_TEMP	  VARCHAR(255 BYTE):='D:\ORACLE\PRODUCT\10.2.0\ORADATA\PAYROLL\TEMP01.DBF';
TB_SPACE_UNDOT	  VARCHAR(255 BYTE):='D:\ORACLE\PRODUCT\10.2.0\ORADATA\PAYROLL\UNDOTBS01.DBF';
TB_SPACE_USER01	  VARCHAR(255 BYTE):='D:\ORACLE\PRODUCT\10.2.0\ORADATA\PAYROLL\USERS01.DBF';
TB_SPACE_USER02	  VARCHAR(255 BYTE):='D:\ORACLE\PRODUCT\10.2.0\ORADATA\PAYROLL\USERS02.DBF';
TB_SPACE_UPIC	  VARCHAR(255 BYTE):='D:\ORACLE\PRODUCT\10.2.0\ORADATA\PAYROLL\USRPICTURE01.DBF';

USE_SPACE NUMBER:=0;
FREE_SPACE NUMBER:=0;
TOTL_SPACE NUMBER:=0;
FILE_ID DBA_DATA_FILES.FILE_ID%TYPE;
FILE_NAME DBA_DATA_FILES.FILE_NAME%TYPE;

CURSOR SPACE_LIST IS
	   (SELECT FILE_NAME,FILE_ID,ROUND(BYTES/1048579) TOTAL_SPACE
	   FROM DBA_DATA_FILES);

BEGIN

OPEN SPACE_LIST;
LOOP
	FETCH SPACE_LIST INTO FILE_NAME,FILE_ID,TOTL_SPACE;
	EXIT WHEN SPACE_LIST%NOTFOUND;
	
	
	
	IF DATABASE_SIZE>0 && DATABSE_SIZE <500 THEN
	   ALTER DATABASE DATAFILE FILE_NAME RESIZE (200+10)M;
	
	
	
END LOOP;

   EXCEPTION
     WHEN NO_DATA_FOUND THEN
       NULL;
     WHEN OTHERS THEN
       -- Consider logging the error and then re-raise
       RAISE;
END UPDATE_TABLESPACE;
/
