SELECT * FROM all_tables where owner='PAYROLL' and initial_extent > 16999;

select * from user_tab_columns 

select table_name, column_name, column_id  from user_tab_columns 
where table_name in (SELECT table_name FROM all_tables where owner='payroll')
order by table_name, column_id asc