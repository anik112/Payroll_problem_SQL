select a.LOANAMOUNT, a.DEDAMOUNT, a.BALAMOUNT, a.LOANMONTH, a.DEDMONTH,
       a.DEDYEAR,a.CARDNO, b.empname, b.designation, a.LOANYEAR, b.departmentnm, b.sectionnm, b.lineno,a.LOAN_TYPE
from  TB_ADVANCEORLOAN_INFO a,tb_personal_info b
where b.company    = :p_company
and   a.LOANYEAR   = :p_year
and   a.LOANMONTH  = :p_month
and   b.company    = a.company
and   a. LOAN_TYPE = :p_type
and   a.DEDAMOUNT is not null
and   a.cardno     = b.cardno
and   b.departmentnm in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
and   b.GENDER       like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
and   b.ACTIVE       like decode(nvl(:p_active,'all'),'all','%',:p_active)
union
select a.LOANAMOUNT, a.DEDAMOUNT, a.BALAMOUNT, a.LOANMONTH, a.DEDMONTH,
       a.DEDYEAR,a.CARDNO, b.empname, b.designation, a.LOANYEAR, b.departmentnm, b.sectionnm, b.lineno,a.LOAN_TYPE
from  TB_ADVANCEORLOAN_INFO a,tb_personal_info b
where b.company   = :p_company
and   a.LOANYEAR  = :p_year
and   a.LOANMONTH = :p_month
and   b.company   = a.company
and   a. LOAN_TYPE= :p_type
and   a.DEDAMOUNT is not null
and   a.cardno    = b.cardno
and   b.sectionnm in ( select ITEM_NAME from TB_SETUP_ITEM where company    =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
and   b.GENDER    like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
and   b.ACTIVE    like decode(nvl(:p_active,'all'),'all','%',:p_active)
union
select a.LOANAMOUNT, a.DEDAMOUNT, a.BALAMOUNT, a.LOANMONTH, a.DEDMONTH,
       a.DEDYEAR,a.CARDNO, b.empname, b.designation, a.LOANYEAR, b.departmentnm, b.sectionnm, b.lineno,a.LOAN_TYPE
from  TB_ADVANCEORLOAN_INFO a,tb_personal_info b
where b.company   = :p_company
and   a.LOANYEAR  = :p_year
and   a.LOANMONTH = :p_month
and   b.company   = a.company
and   a. LOAN_TYPE= :p_type
and   a.DEDAMOUNT is not null
and   a.cardno    = b.cardno
and   b.designation in ( select ITEM_NAME from TB_SETUP_ITEM where company    =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
and   b.GENDER      like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
and   b.ACTIVE      like decode(nvl(:p_active,'all'),'all','%',:p_active)
union
select a.LOANAMOUNT, a.DEDAMOUNT, a.BALAMOUNT, a.LOANMONTH, a.DEDMONTH,
       a.DEDYEAR,a.CARDNO, b.empname, b.designation, a.LOANYEAR, b.departmentnm, b.sectionnm, b.lineno,a.LOAN_TYPE
from  TB_ADVANCEORLOAN_INFO a,tb_personal_info b
where b.company   = :p_company
and   a.LOANYEAR  = :p_year
and   a.LOANMONTH = :p_month
and   b.company   = a.company
and   a. LOAN_TYPE= :p_type
and   a.DEDAMOUNT is not null
and   a.cardno    = b.cardno
and   b.WORKERTYPE in ( select ITEM_NAME from TB_SETUP_ITEM where company    =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
and   b.GENDER     like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
and   b.ACTIVE     like decode(nvl(:p_active,'all'),'all','%',:p_active)
union
select a.LOANAMOUNT, a.DEDAMOUNT, a.BALAMOUNT, a.LOANMONTH, a.DEDMONTH,
       a.DEDYEAR,a.CARDNO, b.empname, b.designation, a.LOANYEAR, b.departmentnm, b.sectionnm, b.lineno,a.LOAN_TYPE
from  TB_ADVANCEORLOAN_INFO a,tb_personal_info b
where b.company   = :p_company
and   a.LOANYEAR  = :p_year
and   a.LOANMONTH = :p_month
and   b.company   = a.company
and   a. LOAN_TYPE= :p_type
and   a.DEDAMOUNT is not null
and   a.cardno    = b.cardno
and   b.lineno  in ( select ITEM_NAME from TB_SETUP_ITEM where company    =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
and   b.GENDER  like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
and   b.ACTIVE  like decode(nvl(:p_active,'all'),'all','%',:p_active)
union
select a.LOANAMOUNT, a.DEDAMOUNT,a.BALAMOUNT,a.LOANMONTH,a.DEDMONTH,
       a.DEDYEAR,a.CARDNO,b.empname,b.designation,a.LOANYEAR, b.departmentnm, b.sectionnm, b.lineno,a.LOAN_TYPE
from  TB_ADVANCEORLOAN_INFO a,tb_personal_info b, TB_IDCARD_MULTIPLE mul
where b.company   = :p_company
and   a.LOANYEAR  = :p_year
and   a.LOANMONTH = :p_month
and   b.company   = a.company
and   b.company   = mul.company
and   a. LOAN_TYPE= :p_type
and   a.DEDAMOUNT is not null
and   a.cardno    = b.cardno
and   a.cardno    = mul.cardno
and   b.GENDER    like decode(nvl(:p_gender,'all'),'all','%',:p_gender)


------------------------------------------------
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

--------------------------------------------




select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
	   info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.PAIDDATE, loan.REASON_STATUS,
	   loan.LOANDATE, loan.OPENING_BAL, loan.LOAN_AMT, 
	   loan.PAID_AMT, loan.DUE_AMT, loan.PAID_STATUS
from  TB_PF_LOAN_AMT loan, tb_personal_info info
where loan.company = :p_company
and  info.company  = loan.company
and  loan.FINYEAR  = :p_year
and  to_char(loan.LOANDATE,'FMMonth') = :p_month
and  loan.CARDNO   = info.CARDNO
AND   info.DEPARTMENTNM  in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
AND   loan.PAID_STATUS   LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
and   info.GENDER		 LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active		 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
	   info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.PAIDDATE, loan.REASON_STATUS,
	   loan.LOANDATE, loan.OPENING_BAL, loan.LOAN_AMT, 
	   loan.PAID_AMT, loan.DUE_AMT, loan.PAID_STATUS
from  TB_PF_LOAN_AMT loan, tb_personal_info info
where loan.company = :p_company
and  info.company  = loan.company
and  loan.FINYEAR  = :p_year
and  to_char(loan.LOANDATE,'FMMonth') = :p_month
and  loan.CARDNO   = info.CARDNO
AND   info.SECTIONNM     in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
AND   loan.PAID_STATUS   LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
and   info.GENDER	     LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active	     LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
	   info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.PAIDDATE, loan.REASON_STATUS,
	   loan.LOANDATE, loan.OPENING_BAL, loan.LOAN_AMT, 
	   loan.PAID_AMT, loan.DUE_AMT, loan.PAID_STATUS
from  TB_PF_LOAN_AMT loan, tb_personal_info info
where loan.company  = :p_company
and  info.company   = loan.company
and  loan.FINYEAR   = :p_year
and  to_char(loan.LOANDATE,'FMMonth') = :p_month
and  loan.CARDNO    = info.CARDNO
AND   info.DESIGNATION   in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
AND   loan.PAID_STATUS   LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
and   info.GENDER	     LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active	     LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
	   info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.PAIDDATE, loan.REASON_STATUS,
	   loan.LOANDATE, loan.OPENING_BAL, loan.LOAN_AMT, 
	   loan.PAID_AMT, loan.DUE_AMT, loan.PAID_STATUS
from  TB_PF_LOAN_AMT loan, tb_personal_info info
where loan.company  = :p_company
and  info.company   = loan.company
and  loan.FINYEAR   = :p_year
and  to_char(loan.LOANDATE,'FMMonth') = :p_month
and  loan.CARDNO    = info.CARDNO
AND   info.WORKERTYPE    in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
AND   loan.PAID_STATUS   LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
and   info.GENDER	     LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active	     LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
	   info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.PAIDDATE, loan.REASON_STATUS,
	   loan.LOANDATE, loan.OPENING_BAL, loan.LOAN_AMT, 
	   loan.PAID_AMT, loan.DUE_AMT, loan.PAID_STATUS
from  TB_PF_LOAN_AMT loan, tb_personal_info info
where loan.company  = :p_company
and  info.company   = loan.company
and  loan.FINYEAR   = :p_year
and  to_char(loan.LOANDATE,'FMMonth') = :p_month
and  loan.CARDNO    = info.CARDNO
AND   info.FLOORNO       in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
AND   loan.PAID_STATUS   LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
and   info.GENDER	     LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active	     LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
	   info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.PAIDDATE, loan.REASON_STATUS,
	   loan.LOANDATE, loan.OPENING_BAL, loan.LOAN_AMT, 
	   loan.PAID_AMT, loan.DUE_AMT, loan.PAID_STATUS
from  TB_PF_LOAN_AMT loan, tb_personal_info info
where loan.company  = :p_company
and  info.company   = loan.company
and  loan.FINYEAR   = :p_year
and  to_char(loan.LOANDATE,'FMMonth') = :p_month
and  loan.CARDNO    = info.CARDNO
AND   info.MACHINENO	 in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
AND   loan.PAID_STATUS   LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
and   info.GENDER		 LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active		 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
	   info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.PAIDDATE, loan.REASON_STATUS,
	   loan.LOANDATE, loan.OPENING_BAL, loan.LOAN_AMT, 
	   loan.PAID_AMT, loan.DUE_AMT, loan.PAID_STATUS
from  TB_PF_LOAN_AMT loan, tb_personal_info info
where loan.company  = :p_company
and  info.company   = loan.company
and  loan.FINYEAR   = :p_year
and  to_char(loan.LOANDATE,'FMMonth') = :p_month
and  loan.CARDNO    = info.CARDNO
AND   info.LINENO	     in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
AND   loan.PAID_STATUS   LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
and   info.GENDER		 LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active		 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
	   info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.PAIDDATE, loan.REASON_STATUS,
	   loan.LOANDATE, loan.OPENING_BAL, loan.LOAN_AMT, 
	   loan.PAID_AMT, loan.DUE_AMT, loan.PAID_STATUS
from  TB_PF_LOAN_AMT loan, tb_personal_info info, TB_IDCARD_MULTIPLE mul
where loan.company  = :p_company
and  info.company   = loan.company
and  mul.COMPANY    = info.COMPANY
and  loan.FINYEAR   = :p_year
and  to_char(loan.LOANDATE,'FMMonth')= :p_month
and  mul.USER_NAME  = :p_user
and  loan.CARDNO    = info.CARDNO
and  info.CARDNO    = mul.CARDNO
AND   loan.REASON_STATUS  LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
AND   loan.PAID_STATUS    LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
and   info.GENDER		  LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active		  LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
