--- for H&M salary sheet 
select a.CARDNO,a.atv_status Active_status, a.GENDER Gender, a.WORKERTYPE Emp_type, 
	   a.FS_BONUS F_bonus, b.EL_Amount E_leave, a.EMPNAME_SAL Name, a.SALARY_GRD Grd, 
	   a.DESIGNATION_SAL Desig,a.JOINING_DATE, a.RESIGNATION_DATE, 
	   a.GROSSSAL Gross_salary, a.PROSALARY Emp_increment, a.BASICSAL Basic_salary, a.HOUSERENT,
	   a.MED_BILL, a.FOODALLOW, a.TRANSPORT Conv, a.TOTALDAY Month,
	   a.TOTALWORKINGDAY Working_days, a.WEEK_DAY W_Holiday, a.GOVT_DAY G_Holiday,
	   a.TOTALABSENT Total_absent, a.CASUAL CL, a.ML ML, a.EARNED EL,
	   a.COMPENSIVE CM, a.SP_LEAVE SP, a.REP_LEAVE RL, a.TOTALLEAVE, a.ABSENT_DEDUC Abs_Ded,
	   a.HALF_DUTY_DEDUC De_amt, a.TOTALSALARY Net_Wages, a.ARREAR_AMT Arrear, a.ADVANCE_DEDUC Loan,
	   a.ATTBONUS A_Bonus, a.TOTALSALARY Total_amt, a.Total_OT_Hr, a.OTRATE, a.Total_OT_Amt,
	   a.WK_HOLI_DAY WK_holiday, a.TIFFIN_BILL Tiffin_amount, a.IFTAR_BILL, a.STAMP, 
	   a.TAX_DEDUC, a.TRADE_SUBSCRIPTION TUS, a.ADVANCE_DED_PT Advance, a.TOTAL_PAYMENT Total_payment
from (SELECT per.CARDNO, decode(per.ACTIVE,0,'Active','Inactive') atv_status,
	 		 per.WORKERTYPE, sal.FS_BONUS,
			 sal.EMPNAME EMPNAME_SAL, sal.DESIGNATION DESIGNATION_SAL, 
	       	 sal.SALARY_GRD, sal.GROSSSAL, 
			 sal.BASICSAL, sal.TOTALSALARY, 
			 sal.ATTBONUS, (mon.OTMIN + mon.OTMINPART + mon.HOLIDAY_OT)Total_OT_Hr, 
			 (sal.OTAMOUNT +sal.EXTRA_OTAMT + sal.HOLIDAY_OT_AMT)Total_OT_Amt,
	       	 mon.TOTALDAY, sal.ABSENT_DEDUC,mon.TOTALHOLIDAY, mon.TOTALWORKINGDAY, 
			 mon.TOTALATTDENCE,mon.TOTALPRESENT,mon.TOTALABSENT, 
			 mon.TIFFIN_DAY, sal.TIFFIN_BILL,mon.WK_HOLI_DAY,mon.WEEK_DAY, 
			 mon.GOVT_DAY, mon.TOTALLEAVE, per.JOINING_DATE, per.GENDER, 
			 pro.PROSALARY, sal.IFTAR_BILL, per.RESIGNATION_DATE, sal.HOUSERENT, 
			 sal.MEDICAL MED_BILL , sal.FOODALLOW,sal.TRANSPORT, 
			 mon.CASUAL, mon.EARNED, mon.COMPENSIVE, mon.MEDICAL ML,
			 mon.SP_LEAVE, mon.REP_LEAVE, sal.ADVANCE_DEDUC, sal.STAMP,
			 sal.HALF_DUTY_DEDUC, sal.ARREAR_AMT, sal.OTRATE, sal.TAX_DEDUC, 
			 sal.TRADE_SUBSCRIPTION, sal.ADVANCE_DED_PT, sal.TOTAL_PAYMENT
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per, TB_PROMOTION_INFO pro 
WHERE  mon.company  = :p_comapny
and    sal.company  = per.company 
and    mon.company  = per.company
AND	   pro.COMPANY	= per.COMPANY
AND    mon.finyear  = :p_year
AND    mon.finmonth = :p_month 
AND    mon.finyear  = sal.finyear 
AND    mon.finmonth = sal.finmonth
AND	   pro.PROYEAR	= mon.FINYEAR
and	   pro.FINMONTH	= mon.FINMONTH
and    sal.NETPAYMENT > 0
AND    sal.cardno   = per.cardno 
AND    mon.cardno   = per.cardno
AND	   pro.CARDNO	= per.CARDNO
AND    sal.SAL_STATUS    = 'A'
ORDER BY per.DEPARTMENTNM,per.SECTIONNM,per.lineno,mon.cardno ASC)a,
(select sal.GROSSSAL , per.CARDNO, round((sal.grosssal/30)*20)EL_Amount
from   TB_MONTH_SALARY sal,TB_PERSONAL_INFO per 
WHERE  sal.company  = :p_comapny
and    sal.company  = per.company 
AND    sal.finyear  = :p_year
AND    sal.finmonth = :E_leave_month
AND    to_char(per.joining_date,'RRRR') < :p_year
AND    rtrim(to_char(per.joining_date,'Month')) = :E_leave_month
AND    sal.cardno   = per.cardno 
AND    sal.SAL_STATUS    = 'A'
and    per.active = 0)b
where a.cardno = b.cardno(+)



--- for ear leave amount 


select sal.GROSSSAL , per.CARDNO, round((sal.grosssal/30)*20)EL_Amount
from   TB_MONTH_SALARY sal,TB_PERSONAL_INFO per 
WHERE  sal.company  = 'Natural Denims Ltd.'
and    sal.company  = per.company 
AND    sal.finyear  =  2020 
AND    sal.finmonth =  'June' 
AND    to_char(per.joining_date,'RRRR') < 2020 
AND    rtrim(to_char(per.joining_date,'Month')) = 'June'
AND    sal.cardno   =  per.cardno 
AND    sal.SAL_STATUS    = 'A'
--and    per.active = 0


-- for salary sheet 
select * from TB_MONTH_SALARY 
where  company  = 'Natural Denims Ltd.'
AND    finyear  =  2020 
AND    finmonth =  'June' 
and    cardno in (
select cardno
from   TB_PERSONAL_INFO  
WHERE  company  = 'Natural Denims Ltd.'
AND    to_char(joining_date,'RRRR') < 2020 
AND    rtrim(to_char(joining_date,'Month')) = 'June')

and active = 0)





select * from tb_month_salary
where company='Natural Denims Ltd.(B-2)'
and	  finyear=2020
and   finmonth='November'

Natural Denims Ltd.(B-2)



---- final sql  
   
select c.CARDNO,c.atv_status Active_status, c.GENDER Gender, c.WORKERTYPE Emp_type, 
	   c.FS_BONUS F_bonus, d.EL_Amount E_leave, c.EMPNAME_SAL Name, c.SALARY_GRD Grd, 
	   c.DESIGNATION_SAL Desig,c.JOINING_DATE, c.RESIGNATION_DATE, 
	   c.GROSSSAL Gross_salary, c.PROSALARY Emp_increment, c.BASICSAL Basic_salary, c.HOUSERENT,
	   c.MED_BILL, c.FOODALLOW, c.TRANSPORT Conv, c.TOTALDAY Month,
	   c.TOTALWORKINGDAY Working_days, c.WEEK_DAY W_Holiday, c.GOVT_DAY G_Holiday,
	   c.TOTALABSENT Total_absent, c.CASUAL CL, c.ML ML, c.EARNED EL,
	   c.COMPENSIVE CM, c.SP_LEAVE SP, c.REP_LEAVE RL, c.TOTALLEAVE, c.ABSENT_DEDUC Abs_Ded,
	   c.HALF_DUTY_DEDUC De_amt, c.TOTALSALARY Net_Wages, c.ARREAR_AMT Arrear, c.ADVANCE_DEDUC Loan,
	   c.ATTBONUS A_Bonus, c.TOTALSALARY Total_amt, c.Total_OT_Hr, c.OTRATE, c.Total_OT_Amt,
	   c.WK_HOLI_DAY WK_holiday, c.TIFFIN_BILL Tiffin_amount, c.IFTAR_BILL, c.STAMP, 
	   c.TAX_DEDUC, c.TRADE_SUBSCRIPTION TUS, c.ADVANCE_DED_PT Advance, c.TOTAL_PAYMENT Total_payment
	   from 
(select a.CARDNO, a.atv_status,a.WORKERTYPE, a.FS_BONUS,
			 a.EMPNAME_SAL, a.DESIGNATION_SAL, 
	       	 a.SALARY_GRD, a.GROSSSAL,a.BASICSAL, a.TOTALSALARY, 
			 a.ATTBONUS, a.Total_OT_Hr, a.Total_OT_Amt, a.TOTALDAY, 
			 a.ABSENT_DEDUC, a.TOTALHOLIDAY, a.TOTALWORKINGDAY, 
			 a.TOTALATTDENCE, a.TOTALPRESENT,a.TOTALABSENT, 
			 a.TIFFIN_DAY, a.TIFFIN_BILL, a.WK_HOLI_DAY, a.WEEK_DAY, 
			 a.GOVT_DAY, a.TOTALLEAVE, a.JOINING_DATE, a.GENDER, 
			 a.IFTAR_BILL, a.RESIGNATION_DATE, a.HOUSERENT, 
			 a.MED_BILL , a.FOODALLOW, a.TRANSPORT, a.CASUAL, a.EARNED, a.COMPENSIVE, 
			 a.ML, a.SP_LEAVE, a.REP_LEAVE, a.ADVANCE_DEDUC, a.STAMP,
			 a.HALF_DUTY_DEDUC, a.ARREAR_AMT, a.OTRATE, a.TAX_DEDUC, 
			 a.TRADE_SUBSCRIPTION, a.ADVANCE_DED_PT, a.TOTAL_PAYMENT,
			 b.PROSALARY from
(SELECT per.CARDNO, decode(per.ACTIVE,0,'Active','Inactive') atv_status,
	 		 per.WORKERTYPE, sal.FS_BONUS,
			 sal.EMPNAME EMPNAME_SAL, sal.DESIGNATION DESIGNATION_SAL, 
	       	 sal.SALARY_GRD, sal.GROSSSAL,sal.BASICSAL, sal.TOTALSALARY, 
			 sal.ATTBONUS, (mon.OTMIN + mon.OTMINPART + mon.HOLIDAY_OT)Total_OT_Hr, 
			 (sal.OTAMOUNT +sal.EXTRA_OTAMT + sal.HOLIDAY_OT_AMT)Total_OT_Amt,
	       	 mon.TOTALDAY, sal.ABSENT_DEDUC,mon.TOTALHOLIDAY, mon.TOTALWORKINGDAY, 
			 mon.TOTALATTDENCE,mon.TOTALPRESENT,mon.TOTALABSENT, 
			 mon.TIFFIN_DAY, sal.TIFFIN_BILL,mon.WK_HOLI_DAY,mon.WEEK_DAY, 
			 mon.GOVT_DAY, mon.TOTALLEAVE, per.JOINING_DATE, per.GENDER, 
			 sal.IFTAR_BILL, per.RESIGNATION_DATE, sal.HOUSERENT, 
			 sal.MEDICAL MED_BILL , sal.FOODALLOW,sal.TRANSPORT, 
			 mon.CASUAL, mon.EARNED, mon.COMPENSIVE, mon.MEDICAL ML,
			 mon.SP_LEAVE, mon.REP_LEAVE, sal.ADVANCE_DEDUC, sal.STAMP,
			 sal.HALF_DUTY_DEDUC, sal.ARREAR_AMT, sal.OTRATE, sal.TAX_DEDUC, 
			 sal.TRADE_SUBSCRIPTION, sal.ADVANCE_DED_PT, sal.TOTAL_PAYMENT
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per
WHERE  mon.company  = :p_comapny
and    sal.company  = per.company 
and    mon.company  = per.company
AND    mon.finyear  = :p_year
AND    mon.finmonth = :p_month 
AND    mon.finyear  = sal.finyear 
AND    mon.finmonth = sal.finmonth
and    sal.NETPAYMENT > 0
AND    sal.cardno   = per.cardno 
AND    mon.cardno   = per.cardno
AND    sal.SAL_STATUS    = 'A'
ORDER BY per.DEPARTMENTNM,per.SECTIONNM,per.lineno,mon.cardno ASC) a,
(select pro.CARDNO, pro.PROSALARY 
from TB_PROMOTION_INFO pro
where pro.COMPANY=:p_comapny
and	  pro.PROYEAR=:p_year
and	  pro.FINMONTH=:p_month)b
where a.cardno=b.cardno(+))c,
(select sal.GROSSSAL , per.CARDNO, round((sal.grosssal/30)*20)EL_Amount
from   TB_MONTH_SALARY sal,TB_PERSONAL_INFO per 
WHERE  sal.company  = :p_comapny
and    sal.company  = per.company 
AND    sal.finyear  = :p_year
AND    sal.finmonth = :E_leave_month
AND    to_char(per.joining_date,'RRRR') < :p_year
AND    rtrim(to_char(per.joining_date,'Month')) = :E_leave_month
AND    sal.cardno   = per.cardno 
AND    sal.SAL_STATUS    = 'A'
and    per.active = 0)d
where c.cardno=d.cardno(+)
order by c.cardno asc