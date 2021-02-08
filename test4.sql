select info.CARDNO, info.JOINING_DATE ,info.ENMNAME_BANGLA, info.DESIGNATION_BANGLA, 
info.DEPT_BANGLA, info.SEC_BANGLA,INFO.COMPANY, info.FATHER_NAME_BAN, sum(loan.DEDAMOUNT) loan_amt
from  TB_ADVANCEORLOAN_INFO loan, tb_personal_info info
where loan.company		= :p_company
and	  loan.LOANYEAR	   = :p_year
and	  loan.LOANMONTH   = :p_month
and   loan.LOAN_TYPE   = 'Advance'
and   info.company	   = loan.company
and	  info.CARDNO	   = loan.CARDNO
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
group by info.CARDNO, info.JOINING_DATE ,info.ENMNAME_BANGLA, info.DESIGNATION_BANGLA, 
info.DEPT_BANGLA, info.SEC_BANGLA,INFO.COMPANY, info.FATHER_NAME_BAN
order by info.cardno asc


