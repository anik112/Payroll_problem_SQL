select cardno from TB_MONTH_CONVERT_GENERALDAY where finyear=2019 and finmonth='October' and company='Natural Denims Ltd.' and cardno='10005600';


select * from tb_data_master where PDATE = TO_DATE('10/18/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS') 
and cardno in (select cardno from tb_personal_info where otorg='Y' and cardno='10005600')

select * from tb_data_master where PDATE = TO_DATE('10/18/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
and cardno not in 
(select cardno from TB_MONTH_CONVERT_GENERALDAY where finyear=2019 and finmonth='October' and company='Natural Denims Ltd.' and wk_status='Y' and wk_status_tm='Y'
and cardno in
(select cardno from tb_personal_info where active=0 and otorg='Y' and company='Natural Denims Ltd.'))
and cardno in (select cardno from tb_personal_info where active=0 and company='Natural Denims Ltd.' and otorg='Y');



select cardno from TB_MONTH_CONVERT_GENERALDAY where finyear=2019 and finmonth='October' and company='Natural Denims Ltd.' and cardno='10005510';


select * from tb_data_master where PDATE = TO_DATE('10/18/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS') 
and cardno in
(
select cardno from tb_personal_info where company='Natural Denims Ltd.' and otorg='Y' and active=0 and cardno not in 
(select cardno from TB_MONTH_CONVERT_GENERALDAY where finyear=2019 and finmonth='October' and company='Natural Denims Ltd.')
)


and cardno in (select cardno from tb_personal_info where otorg='Y' and cardno='10005510')
