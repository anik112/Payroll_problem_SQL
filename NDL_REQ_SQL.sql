select mas.cardno, mas.start_date, mas.end_date, 
	   per.empname, per.departmentnm, per.sectionnm, per.LINENO, per.designation,per.joining_date
from   TB_MATERNITY_LEAVE_MASTER mas, TB_PERSONAL_INFO per
where  mas.COMPANY  = :p_company
and    mas.COMPANY  = per.COMPANY
-------and    mas.FINYEAR    = :p_year
and    to_char(mas.end_date,'RRRR')          = :p_year
and    rtrim(to_char(mas.end_date,'Month'))  = :p_month
and    mas.CARDNO    = per.CARDNO
and    mas.cardno like decode(nvl(:p_card,'all'),'all','%',:p_card)
order by mas.cardno asc 


--------------------


select mas.cardno, mas.start_date, mas.end_date, 
	   per.empname, per.departmentnm, per.sectionnm, per.LINENO, per.designation,per.joining_date
from   TB_MATERNITY_LEAVE_MASTER mas, TB_PERSONAL_INFO per
where  mas.COMPANY  = :p_company
and    mas.COMPANY  = per.COMPANY
-------and    mas.FINYEAR    = :p_year
and    to_char(mas.start_date,'RRRR')          = :p_year
and    rtrim(to_char(mas.start_date,'Month'))  = :p_month
and    mas.CARDNO    = per.CARDNO
and    mas.cardno like decode(nvl(:p_card,'all'),'all','%',:p_card)
order by mas.cardno asc 

-----------------------------------



select emp.cardno, emp.empname,emp.designation,emp.DEPARTMENTNM,emp.SECTIONNM, emp.JOINING_DATE, mon.PDATE,
       mon.OTHR ,emp.lineno
from   TB_MONTH_EMP_OTHR mon,tb_personal_info emp
where mon.company    = :p_company
and    mon.company   = emp.company
and    mon.finyear   = :p_year
and    mon.finmonth  = :p_month
and    mon.pdate 	 like decode(nvl(:p_date,'all'),'all','%',to_date(:p_date))
and    emp.cardno    = mon.cardno
and    emp.DEPARTMENTNM like decode (nvl(:p_dept,'all'),'all','%',:p_dept)
and    emp.SECTIONNM like decode (nvl(:p_section,'all'),'all','%',:p_section)
and    emp.lineno like decode (nvl(:p_lineno,'all'),'all','%',:p_lineno)
and    emp.WORKERTYPE like decode(nvl(:p_woker,'all'),'all','%',:p_woker)
and    emp.shift       like decode(nvl(:p_shift,'all'),'all','%',:p_shift)
and    emp.cardno  like decode (nvl(:p_card,'all'),'all','%',:p_card)
order by emp.DEPARTMENTNM, emp.SECTIONNM,emp.lineno, mon.PDATE, emp.cardno asc



---------------------------------  single cardno

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

----------





select DEPARTMENTNM, SECTIONNM, LINENO, CARDNO, EMPNAME, 
       JOINING_DATE, DESIGNATION, SALARY_GRADE, GROSSSALARY  GROSSSALARY ,
	   ENMNAME_BANGLA, DESIGNATION_BANGLA, DEPT_BANGLA, SEC_BANGLA,WORKERTYPE
from TB_PERSONAL_INFO
where company= :p_company
and   GROSSSALARY > 0
and   to_char(joining_date,'RRRR') between 2019 and (:p_year - 1)
and   rtrim(to_char(joining_date,'Month')) = :p_month
and   departmentnm like decode(nvl(:p_dept,'all'),'all','%',:p_dept)
and   sectionnm like decode(nvl(:p_sec,'all'),'all','%',:p_sec)
and   lineno like decode(nvl(:p_lineno,'all'),'all','%',:p_lineno)
and   cardno like decode(nvl(:p_card,'all'),'all','%',:p_card)
and   DESIGNATION like decode(nvl(:p_designation,'all'),'all','%',:p_designation)
and   WORKERTYPE like decode(nvl(:p_woker,'all'),'all','%',:p_woker)
and   shift       like decode(nvl(:p_shift,'all'),'all','%',:p_shift) 
and   GENDER like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
and   FLOORNO like decode(nvl(:p_floorno,'all'),'all','%',:p_floorno)
and   ACTIVE like decode(nvl(:p_active,'all'),'all','%',:p_active)
order by DEPARTMENTNM, SECTIONNM, LINENO,cardno asc


----------------------


select DEPARTMENTNM, SECTIONNM, LINENO, CARDNO, EMPNAME, 
       JOINING_DATE, DESIGNATION, SALARY_GRADE, GROSSSALARY  GROSSSALARY ,
	   ENMNAME_BANGLA, DESIGNATION_BANGLA, DEPT_BANGLA, SEC_BANGLA,WORKERTYPE
from TB_PERSONAL_INFO
where company = :p_company
and   GROSSSALARY          > 0
------and   joining_date  <= last_day(to_date('1-'||:p_month||'-'||:p_year,'dd/mm/rrrr'))
AND   TO_CHAR(joining_date,'RRRR') > TO_CHAR(:sdate,'RRRR') 
and   TO_CHAR(joining_date,'RRRR') < :p_year 
AND   RTRIM(TO_CHAR(joining_date,'Month')) = :p_month
-----and   rtrim(to_char(joining_date,'Month')) = :p_month
and   departmentnm like decode(nvl(:p_dept,'all'),'all','%',:p_dept)
and   sectionnm like decode(nvl(:p_sec,'all'),'all','%',:p_sec)
and   lineno like decode(nvl(:p_lineno,'all'),'all','%',:p_lineno)
and   cardno like decode(nvl(:p_card,'all'),'all','%',:p_card)
and   DESIGNATION like decode(nvl(:p_designation,'all'),'all','%',:p_designation)
and   WORKERTYPE like decode(nvl(:p_woker,'all'),'all','%',:p_woker)
and   shift       like decode(nvl(:p_shift,'all'),'all','%',:p_shift) 
and   GENDER like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
and   FLOORNO like decode(nvl(:p_floorno,'all'),'all','%',:p_floorno)
and   ACTIVE like decode(nvl(:p_active,'all'),'all','%',:p_active)
order by DEPARTMENTNM, SECTIONNM, LINENO,cardno asc