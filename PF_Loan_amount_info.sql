select info.CARDNO, info.JOINING_DATE ,info.ENMNAME_BANGLA, info.DESIGNATION_BANGLA, 
info.DEPT_BANGLA, info.SEC_BANGLA,INFO.COMPANY, info.FATHER_NAME_BAN, loan.LOAN_AMT
from  TB_PF_LOAN_AMT loan, tb_personal_info info
where loan.company	 = :p_company
and   info.company	   = loan.company
and	  loan.FINYEAR	   = :p_year
and	  loan.LOANDATE	   = :p_date
and	  loan.REASON_STATUS ='Pending'
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
where loan.company = :p_company
and   info.company = loan.company
and	  loan.FINYEAR = :p_year
and	  to_char(loan.LOANDATE,'FMMonth')= :p_month
and	  info.CARDNO  = loan.CARDNO
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
order by loan.FINYEAR, info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.cardno asc

----------------------



select info.CARDNO, info.JOINING_DATE ,info.ENMNAME_BANGLA, info.DESIGNATION_BANGLA, 
info.DEPT_BANGLA, info.SEC_BANGLA,INFO.COMPANY, info.FATHER_NAME_BAN, loan.LOAN_AMT,
loan.LOANDATE
from  TB_PF_LOAN_AMT loan, tb_personal_info info
where loan.company	 	   			= :p_company
and   info.company	   				= loan.company
and	  loan.FINYEAR	   	 			= :p_year
and	  to_char(loan.LOANDATE,'FMMonth')= :p_month
and	  info.CARDNO					= loan.CARDNO
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
order by info.cardno asc



select to_char(LOANDATE,'FMMonth') from TB_PF_LOAN_AMT
