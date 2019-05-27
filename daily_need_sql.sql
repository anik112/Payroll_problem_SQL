select * from TB_MONTH_SALARY_DT where finyear=2019 and finmonth='May' and cardno in (select cardno from tb_personal_info where sectionnm='Store')
