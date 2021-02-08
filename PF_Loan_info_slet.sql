
select emp.cardno, emp.empname,emp.designation,emp.DEPARTMENTNM,emp.SECTIONNM, emp.JOINING_DATE, mon.PDATE,
       mon.OTHR, emp.lineno
from   TB_MONTH_EMP_OTHR mon,tb_personal_info emp  
where  mon.company   = :p_company
and    mon.company     = emp.company
and    mon.finyear     = :p_year
and    mon.finmonth  = :p_month
and    mon.pdate 	 like decode(nvl(:p_date,'all'),'all','%',to_date(:p_date))
and    emp.cardno    = mon.cardno
and    emp.DEPARTMENTNM in (select item_name from tb_setup_item where item_name is not null)
union
select emp.cardno, emp.empname,emp.designation,emp.DEPARTMENTNM,emp.SECTIONNM,  emp.JOINING_DATE,mon.PDATE,
       mon.OTHR, emp.lineno
from   TB_MONTH_EMP_OTHR mon,tb_personal_info emp  
where  mon.company   = :p_company
and    mon.company    = emp.company
and    mon.finyear     = :p_year
and    mon.finmonth  = :p_month
and    mon.pdate 	 like decode(nvl(:p_date,'all'),'all','%',to_date(:p_date))
and    emp.cardno    = mon.cardno
and    emp.SECTIONNM in (select item_name from tb_setup_item where item_name is not null)
union
select emp.cardno, emp.empname,emp.designation,emp.DEPARTMENTNM,emp.SECTIONNM,  emp.JOINING_DATE,mon.PDATE,
       mon.OTHR, emp.lineno
from   TB_MONTH_EMP_OTHR mon,tb_personal_info emp  
where  mon.company   = :p_company
and    mon.company     = emp.company
and    mon.finyear     = :p_year
and    mon.finmonth  = :p_month
and    mon.pdate 	 like decode(nvl(:p_date,'all'),'all','%',to_date(:p_date))
and    emp.cardno    = mon.cardno
and    emp.WORKERTYPE in (select item_name from tb_setup_item where item_name is not null)
union
select emp.cardno, emp.empname,emp.designation,emp.DEPARTMENTNM,emp.SECTIONNM,  emp.JOINING_DATE,mon.PDATE,
       mon.OTHR, emp.lineno
from   TB_MONTH_EMP_OTHR mon,tb_personal_info emp  
where  mon.company   = :p_company
and    mon.company     = emp.company
and    mon.finyear     = :p_year
and    mon.finmonth  = :p_month
and    mon.pdate 	 like decode(nvl(:p_date,'all'),'all','%',to_date(:p_date))
and    emp.cardno    = mon.cardno
and    emp.lineno in (select item_name from tb_setup_item where item_name is not null)
union
select emp.cardno, emp.empname,emp.designation,emp.DEPARTMENTNM,emp.SECTIONNM,  emp.JOINING_DATE,mon.PDATE,
       mon.OTHR, emp.lineno
from   TB_MONTH_EMP_OTHR mon,tb_personal_info emp  
where  mon.company   = :p_company
and    mon.company     = emp.company
and    mon.finyear     = :p_year
and    mon.finmonth  = :p_month
and    mon.pdate 	 like decode(nvl(:p_date,'all'),'all','%',to_date(:p_date))
and    emp.cardno    = mon.cardno
and    emp.shift in (select item_name from tb_setup_item where item_name is not null)
union
select emp.cardno, emp.empname,emp.designation,emp.DEPARTMENTNM,emp.SECTIONNM,  emp.JOINING_DATE,mon.PDATE,
       mon.OTHR, emp.lineno
from   TB_MONTH_EMP_OTHR mon,tb_personal_info emp, TB_IDCARD_MULTIPLE mul  
where  mon.company   = :p_company
and    mon.company   = emp.company
and    mon.company   = mul.company
and    mon.finyear     = :p_year
and    mon.finmonth  = :p_month
and    mon.pdate 	 like decode(nvl(:p_date,'all'),'all','%',to_date(:p_date))
and    emp.cardno    = mon.cardno
and    emp.cardno    = mul.cardno



-------------------------



select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.PAIDDATE, loan.REASON_STATUS,
loan.LOANDATE, loan.OPENING_BAL, loan.LOAN_AMT, 
loan.PAID_AMT, loan.DUE_AMT, loan.PAID_STATUS
from  TB_PF_LOAN_AMT loan, tb_personal_info info, TB_IDCARD_MULTIPLE mul
where info.company	 	   			= :p_company
and   loan.company	   				= info.company
and	  mul.COMPANY					= info.COMPANY
and	  loan.FINYEAR	   	 			= :p_year
and	  to_char(loan.LOANDATE,'FMMonth')= :p_month
and   mul.USER_NAME					= :p_user
and	  loan.CARDNO					= mul.CARDNO
and	  info.CARDNO					= mul.CARDNO
order by loan.FINYEAR, info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.cardno asc
