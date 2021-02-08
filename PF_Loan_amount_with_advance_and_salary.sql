
select * from
(select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.LOANDATE, loan.LOAN_AMT
from  TB_PF_LOAN_AMT loan, TB_PERSONAL_INFO info
where info.company	   = :p_company
and   info.company	   = loan.company
and	  info.CARDNO	   = loan.CARDNO
and	  loan.FINYEAR 	   	   LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
and	  loan.PAID_STATUS	   LIKE DECODE(NVL(:p_status,'all'),'all','%',:p_status)
AND   info.DEPARTMENTNM    LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   info.SECTIONNM	   LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION	   LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   info.WORKERTYPE	   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.FLOORNO		   LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.MACHINENO	   LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno		   LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   info.SHIFT		   LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
and   info.GENDER		   LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active		   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND   info.cardno		   LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno)) a,
(select adv.CARDNO, adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT 
from TB_ADVANCEORLOAN_INFO adv, TB_PF_LOAN_AMT loan 
where info.COMPANY = :p_company
and	  loan.COMPANY = info.COMPANY 
and	  adv.COMPANY  = info.COMPANY
and	  adv.LOANYEAR = loan.FINYEAR
and	  adv.CARDNO   = loan.CARDNO
and	  loan.FINYEAR         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
and	  loan.PAID_STATUS	   LIKE DECODE(NVL(:p_status,'all'),'all','%',:p_status)
AND   info.DEPARTMENTNM    LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   info.SECTIONNM	   LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION	   LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   info.WORKERTYPE	   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.FLOORNO		   LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.MACHINENO	   LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno		   LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   info.SHIFT		   LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
and   info.GENDER		   LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active		   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND   info.cardno		   LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno)) b,
(select sal.CARDNO, sal.FINYEAR, sal.FINMONTH, sal.LOAN_PF_AMT
from TB_MONTH_SALARY sal, TB_PF_LOAN_AMT loan, TB_PERSONAL_INFO info
where info.COMPANY  = :p_company
and	  sal.COMPANY  = info.COMPANY
and	  loan.COMPANY = info.COMPANY
and	  sal.FINYEAR  = loan.FINYEAR
and	  sal.CARDNO   = loan.CARDNO
and	  loan.FINYEAR     LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
and	  loan.PAID_STATUS LIKE DECODE(NVL(:p_status,'all'),'all','%',:p_status)
AND   info.DEPARTMENTNM    LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   info.SECTIONNM	   LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION	   LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   info.WORKERTYPE	   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.FLOORNO		   LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.MACHINENO	   LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno		   LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   info.SHIFT		   LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
and   info.GENDER		   LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active		   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND   info.cardno		   LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno)) c
where a.cardno=b.cardno(+)
and	  a.cardno=c.cardno(+)



---------------------------------------------------------

select e.cardno, e.LOANYEAR, e.DEDYEAR, e.DEDMONTH, e.DEDAMOUNT,
f.FINYEAR, f.FINMONTH, f.LOAN_PF_AMT from
(select adv.CARDNO, adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT , adv.LOANYEAR
from TB_ADVANCEORLOAN_INFO adv, TB_PF_LOAN_AMT loan, TB_PERSONAL_INFO info
where info.COMPANY = :p_company
and	  loan.COMPANY = info.COMPANY 
and	  adv.COMPANY  = info.COMPANY
and	  adv.LOANYEAR = loan.FINYEAR
and	  adv.CARDNO   = info.CARDNO
and	  loan.CARDNO  = info.CARDNO
and	  loan.FINYEAR         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
and	  loan.PAID_STATUS	   LIKE DECODE(NVL(:p_status,'all'),'all','%',:p_status)
AND   info.DEPARTMENTNM    LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   info.SECTIONNM	   LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION	   LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   info.WORKERTYPE	   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.FLOORNO		   LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.MACHINENO	   LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno		   LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   info.SHIFT		   LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
and   info.GENDER		   LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active		   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND   info.cardno		   LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno)) e,
(select sal.CARDNO, sal.FINYEAR, sal.FINMONTH, sal.LOAN_PF_AMT
from TB_MONTH_SALARY sal, TB_PF_LOAN_AMT loan, TB_PERSONAL_INFO info
where info.COMPANY  = :p_company
and	  sal.COMPANY  = info.COMPANY
and	  loan.COMPANY = info.COMPANY
and	  sal.FINYEAR  = loan.FINYEAR
and	  sal.CARDNO   = info.CARDNO
and	  loan.CARDNO  = info.CARDNO
and	  loan.FINYEAR         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
and	  loan.PAID_STATUS     LIKE DECODE(NVL(:p_status,'all'),'all','%',:p_status)
AND   info.DEPARTMENTNM    LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   info.SECTIONNM	   LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION	   LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   info.WORKERTYPE	   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.FLOORNO		   LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.MACHINENO	   LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno		   LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   info.SHIFT		   LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
and   info.GENDER		   LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active		   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND   info.cardno		   LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno)) f
where e.cardno   = f.cardno(+)
and	  e.DEDYEAR	 = f.FINYEAR(+)
and	  e.DEDMONTH = f.FINMONTH(+)


------------------------------------


select a.DEPARTMENTNM, a.SECTIONNM, a.LINENO, a.CARDNO, a.EMPNAME, a.DESIGNATION, 
a.FINYEAR, a.LOANDATE, a.LOAN_AMT, b.DEDYEAR, b.DEDMONTH, b.DEDAMOUNT, b.FINYEAR sal_year, 
b.FINMONTH sal_month, b.LOAN_PF_AMT sal_dedAmt  from
(select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.LOANDATE, loan.LOAN_AMT
	from  TB_PF_LOAN_AMT loan, TB_PERSONAL_INFO info
	where loan.company	   = :p_company
	and   info.company	   = loan.company
	and	  info.CARDNO	   = loan.CARDNO
	and	  loan.FINYEAR 	   	   LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
	and	  loan.REASON_STATUS   LIKE DECODE(NVL(:p_status,'all'),'all','%',:p_status)
	AND   info.DEPARTMENTNM    LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
	AND   info.SECTIONNM	   LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
	AND   info.DESIGNATION	   LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
	AND   info.WORKERTYPE	   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
	AND   info.FLOORNO		   LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
	AND   info.MACHINENO	   LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
	AND   info.lineno		   LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
	AND   info.SHIFT		   LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
	and   info.GENDER		   LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
	and   info.active		   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
	AND   info.cardno		   LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno)
) a,
(select e.cardno, e.LOANYEAR, e.DEDYEAR, e.DEDMONTH, e.DEDAMOUNT, f.FINYEAR, f.FINMONTH, f.LOAN_PF_AMT 
from
	(select adv.CARDNO, adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT, adv.LOANYEAR 
	from TB_ADVANCEORLOAN_INFO adv, TB_PF_LOAN_AMT loan, TB_PERSONAL_INFO info
	where info.COMPANY = :p_company
	and	  loan.COMPANY = info.COMPANY 
	and	  adv.COMPANY  = info.COMPANY
	and	  adv.LOAN_TYPE= 'PF'
	and	  adv.LOANYEAR = loan.FINYEAR
	and	  adv.CARDNO   = info.CARDNO
	and	  loan.CARDNO  = info.CARDNO
	and	  loan.FINYEAR         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
	and	  loan.REASON_STATUS   LIKE DECODE(NVL(:p_status,'all'),'all','%',:p_status)
	AND   info.DEPARTMENTNM    LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
	AND   info.SECTIONNM	   LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
	AND   info.DESIGNATION	   LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
	AND   info.WORKERTYPE	   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
	AND   info.FLOORNO		   LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
	AND   info.MACHINENO	   LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
	AND   info.lineno		   LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
	AND   info.SHIFT		   LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
	and   info.GENDER		   LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
	and   info.active		   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
	AND   info.cardno		   LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno)) e,
	(select sal.CARDNO, sal.FINYEAR, sal.FINMONTH, sal.LOAN_PF_AMT
	from TB_MONTH_SALARY sal, TB_PF_LOAN_AMT loan, TB_PERSONAL_INFO info
	where info.COMPANY  = :p_company
	and	  sal.COMPANY  = info.COMPANY
	and	  loan.COMPANY = info.COMPANY
	and	  sal.FINYEAR  = loan.FINYEAR
	and	  sal.CARDNO   = info.CARDNO
	and	  loan.CARDNO  = info.CARDNO
	and	  loan.FINYEAR         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
	and	  loan.REASON_STATUS   LIKE DECODE(NVL(:p_status,'all'),'all','%',:p_status)
	AND   info.DEPARTMENTNM    LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
	AND   info.SECTIONNM	   LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
	AND   info.DESIGNATION	   LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
	AND   info.WORKERTYPE	   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
	AND   info.FLOORNO		   LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
	AND   info.MACHINENO	   LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
	AND   info.lineno		   LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
	AND   info.SHIFT		   LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
	and   info.GENDER		   LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
	and   info.active		   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
	AND   info.cardno		   LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno)) f
	where e.DEDYEAR	 = f.FINYEAR(+)
	and	  e.DEDMONTH = f.FINMONTH(+)
	and	  e.cardno   = f.cardno(+)
) b
where  a.FINYEAR = b.LOANYEAR
and	   a.cardno  = b.cardno(+)
order by a.DEPARTMENTNM, a.SECTIONNM, a.LINENO, a.CARDNO, a.FINYEAR, 
a.LOANDATE,b.DEDYEAR asc







------------------------------ final v2 

select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.LOANDATE, loan.LOAN_AMT,
adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT
from  TB_PF_LOAN_AMT loan, TB_ADVANCEORLOAN_INFO adv, TB_PERSONAL_INFO info, tb_month mon
where info.company  = :p_company
and   loan.company	= info.company
and	  adv.COMPANY  	= info.COMPANY
and	  loan.FINYEAR	= :p_year
and	  adv.LOANYEAR 	= loan.FINYEAR
and	  to_char(loan.LOANDATE,'FMMonth')= :p_month
and	  adv.LOANMONTH	= :p_month
and	  adv.DEDMONTH	= mon.MONTH_NAME
and	  adv.LOAN_TYPE	= 'PF'
and	  loan.CARDNO	= info.CARDNO
and	  adv.CARDNO	= info.CARDNO
AND   loan.REASON_STATUS   LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
AND   loan.PAID_STATUS     LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
AND   info.DEPARTMENTNM    LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   info.SECTIONNM	   LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   info.DESIGNATION	   LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.WORKERTYPE	   LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.FLOORNO		   LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.MACHINENO	   LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno		   LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
and   info.GENDER		   LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active		   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND   info.cardno		   LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno)
order by info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, loan.FINYEAR, 
loan.LOANDATE,adv.DEDYEAR, mon.SLNO asc


---------------------------------- for salary 

select LOAN_PF_AMT
	from TB_MONTH_SALARY
	where COMPANY  = :p_company
	and	  FINYEAR  = :p_year
	and	  FINMONTH = :p_month
	and	  CARDNO   = :p_cardno;


	
declare
v_pf_amount number:=0;
begin

	begin
  	select LOAN_PF_AMT into v_pf_amount
	from TB_MONTH_SALARY
	where COMPANY  = :p_company
	and	  FINYEAR  = :p_year
	and	  FINMONTH = :p_month
	and	  CARDNO   = :p_cardno;
	exception
	when no_data_found then v_pf_amount :=0;
	       when others then v_pf_amount :=0;
	end;
	 
	dbms_output.put_line(v_pf_amount);
end;
/
