SELECT SCN_TO_TIMESTAMP(MAX(ORA_ROWSCN)) FROM tb_data_master


SELECT * FROM all_tab_modifications ck WHERE ck.TABLE_NAME='TB_DATA_MASTER';

SELECT MAX(ORA_ROWSCN) FROM os_ondemand_logs


SELECT * FROM ALL_OBJECTS obj WHERE obj.OBJECT_NAME='TB_DATA_MASTER'