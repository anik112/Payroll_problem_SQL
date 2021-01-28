select index_name, table_name from all_indexes tbl where tbl.OWNER='MASTERDB'

----------- get all function anme
SELECT object_name, object_type FROM ALL_OBJECTS obj WHERE obj.OBJECT_TYPE IN ('FUNCTION','PROCEDURE','PACKAGE') and obj.OWNER='MASTERDB'



--- get all column name 
SELECT table_name, column_name, data_type, data_length
FROM USER_TAB_COLUMNS
WHERE table_name in (select table_name from all_tables tbl where tbl.OWNER='MASTERDB')
order by table_name, column_name asc


SELECT table_name, column_name, data_type, data_length
FROM USER_TAB_COLUMNS
WHERE table_name='TB_MATERNITY_LEAVE_MASTER'
order by table_name, column_name asc









