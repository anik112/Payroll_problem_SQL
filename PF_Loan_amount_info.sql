select info.CARDNO, info.JOINING_DATE ,info.ENMNAME_BANGLA, info.DESIGNATION_BANGLA, 
info.DEPT_BANGLA, info.SEC_BANGLA,INFO.COMPANY, info.FATHER_NAME_BAN, loan.LOAN_AMT
from  TB_PF_LOAN_AMT loan, tb_personal_info info
where loan.company	 = :p_company
and	  loan.FINYEAR	   = :p_year
and	  loan.LOANDATE	   = :p_date
and	  loan.PAID_STATUS ='Pending'
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
order by info.cardno asc


-------------------------------------------



select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.PAIDDATE, loan.REASON_STATUS,
loan.LOANDATE, loan.OPENING_BAL, loan.LOAN_AMT, 
loan.PAID_AMT, loan.DUE_AMT, loan.PAID_STATUS
from  TB_PF_LOAN_AMT loan, tb_personal_info info
where loan.company	   = :p_company
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
AND   info.cardno		   LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno)
order by loan.FINYEAR, info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.cardno asc