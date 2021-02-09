select * from
(select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
          info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.LOANDATE, loan.LOAN_AMT,
          adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT, mon.SLNO
from  TB_PF_LOAN_AMT loan, TB_ADVANCEORLOAN_INFO adv, TB_PERSONAL_INFO info, TB_MONTH mon
where info.company  = :p_company
and    loan.company	= info.company
and    adv.COMPANY 	= info.COMPANY
and    loan.FINYEAR	= :p_year
and    adv.LOANYEAR	= loan.FINYEAR
and    to_char(loan.LOANDATE,'FMMonth')= :p_month
and    adv.LOANMONTH= :p_month
and    adv.DEDMONTH	= mon.MONTH_NAME
and    adv.LOAN_TYPE= 'PF'
and    loan.CARDNO	= info.CARDNO
and    adv.CARDNO	= info.CARDNO
AND   info.SECTIONNM     in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
AND   loan.PAID_STATUS   LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
and   info.GENDER		 LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active		 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
          info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.LOANDATE, loan.LOAN_AMT,
          adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT, mon.SLNO
from  TB_PF_LOAN_AMT loan, TB_ADVANCEORLOAN_INFO adv, TB_PERSONAL_INFO info, TB_MONTH mon
where info.company  = :p_company
and    loan.company	= info.company
and    adv.COMPANY 	= info.COMPANY
and    loan.FINYEAR	= :p_year
and    adv.LOANYEAR	= loan.FINYEAR
and    to_char(loan.LOANDATE,'FMMonth') = :p_month
and    adv.LOANMONTH= :p_month
and    adv.DEDMONTH	= mon.MONTH_NAME
and    adv.LOAN_TYPE= 'PF'
and    loan.CARDNO	= info.CARDNO
and    adv.CARDNO	= info.CARDNO
AND   info.DEPARTMENTNM  in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
AND   loan.PAID_STATUS   LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
and   info.GENDER		 LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active		 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
          info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.LOANDATE, loan.LOAN_AMT,
          adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT, mon.SLNO
from  TB_PF_LOAN_AMT loan, TB_ADVANCEORLOAN_INFO adv, TB_PERSONAL_INFO info, TB_MONTH mon
where info.company  = :p_company
and    loan.company	= info.company
and    adv.COMPANY 	= info.COMPANY
and    loan.FINYEAR	= :p_year
and    adv.LOANYEAR	= loan.FINYEAR
and    to_char(loan.LOANDATE,'FMMonth') = :p_month
and    adv.LOANMONTH= :p_month
and    adv.DEDMONTH	= mon.MONTH_NAME
and    adv.LOAN_TYPE= 'PF'
and    loan.CARDNO	= info.CARDNO
and    adv.CARDNO	= info.CARDNO
AND   info.DESIGNATION   in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
AND   loan.PAID_STATUS   LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
and   info.GENDER		 LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active        LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
          info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.LOANDATE, loan.LOAN_AMT,
          adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT, mon.SLNO
from  TB_PF_LOAN_AMT loan, TB_ADVANCEORLOAN_INFO adv, TB_PERSONAL_INFO info, TB_MONTH mon
where info.company  = :p_company
and    loan.company	= info.company
and    adv.COMPANY 	= info.COMPANY
and    loan.FINYEAR	= :p_year
and    adv.LOANYEAR	= loan.FINYEAR
and    to_char(loan.LOANDATE,'FMMonth') = :p_month
and    adv.LOANMONTH= :p_month
and    adv.DEDMONTH = mon.MONTH_NAME
and    adv.LOAN_TYPE= 'PF'
and    loan.CARDNO  = info.CARDNO
and    adv.CARDNO   = info.CARDNO
AND   info.WORKERTYPE    in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
AND   loan.PAID_STATUS   LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
and   info.GENDER	     LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active        LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
          info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.LOANDATE, loan.LOAN_AMT,
          adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT, mon.SLNO
from  TB_PF_LOAN_AMT loan, TB_ADVANCEORLOAN_INFO adv, TB_PERSONAL_INFO info, TB_MONTH mon
where info.company  = :p_company
and    loan.company	= info.company
and    adv.COMPANY 	= info.COMPANY
and    loan.FINYEAR	= :p_year
and    adv.LOANYEAR	= loan.FINYEAR
and    to_char(loan.LOANDATE,'FMMonth') = :p_month
and    adv.LOANMONTH= :p_month
and    adv.DEDMONTH	= mon.MONTH_NAME
and    adv.LOAN_TYPE= 'PF'
and    loan.CARDNO  = info.CARDNO
and    adv.CARDNO   = info.CARDNO
AND   info.FLOORNO	     in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
AND   loan.PAID_STATUS   LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
and   info.GENDER		 LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active		 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
          info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.LOANDATE, loan.LOAN_AMT,
          adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT, mon.SLNO
from  TB_PF_LOAN_AMT loan, TB_ADVANCEORLOAN_INFO adv, TB_PERSONAL_INFO info, TB_MONTH mon
where info.company  = :p_company
and    loan.company	= info.company
and    adv.COMPANY 	= info.COMPANY
and    loan.FINYEAR	= :p_year
and    adv.LOANYEAR	= loan.FINYEAR
and    to_char(loan.LOANDATE,'FMMonth') = :p_month
and    adv.LOANMONTH= :p_month
and    adv.DEDMONTH	= mon.MONTH_NAME
and    adv.LOAN_TYPE= 'PF'
and    loan.CARDNO	= info.CARDNO
and    adv.CARDNO	= info.CARDNO
AND   info.MACHINENO	 in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
AND   loan.PAID_STATUS   LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
and   info.GENDER		 LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active		 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
          info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.LOANDATE, loan.LOAN_AMT,
          adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT, mon.SLNO
from  TB_PF_LOAN_AMT loan, TB_ADVANCEORLOAN_INFO adv, TB_PERSONAL_INFO info, TB_MONTH mon
where info.company  = :p_company
and    loan.company	= info.company
and    adv.COMPANY 	= info.COMPANY
and    loan.FINYEAR	= :p_year
and    adv.LOANYEAR	= loan.FINYEAR
and    to_char(loan.LOANDATE,'FMMonth') = :p_month
and    adv.LOANMONTH= :p_month
and    adv.DEDMONTH	= mon.MONTH_NAME
and    adv.LOAN_TYPE= 'PF'
and    loan.CARDNO	= info.CARDNO
and    adv.CARDNO	= info.CARDNO
AND   info.LINENO	     in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
AND   loan.PAID_STATUS   LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
and   info.GENDER		 LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active		 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
          info.EMPNAME, info.DESIGNATION, loan.FINYEAR, loan.LOANDATE, loan.LOAN_AMT,
          adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT, mon.SLNO
from  TB_PF_LOAN_AMT loan, TB_ADVANCEORLOAN_INFO adv, 
         TB_PERSONAL_INFO info, TB_MONTH mon, TB_IDCARD_MULTIPLE mul
where info.company  = :p_company
and    loan.company	= info.company
and    adv.COMPANY 	= info.COMPANY
and    info.COMPANY = mul.COMPANY
and    loan.FINYEAR	= :p_year
and    adv.LOANYEAR	= loan.FINYEAR
and    to_char(loan.LOANDATE,'FMMonth') = :p_month
and    adv.LOANMONTH= :p_month
and    adv.DEDMONTH	= mon.MONTH_NAME
and    mul.USER_NAME= :p_user
and    adv.LOAN_TYPE= 'PF'
and    loan.CARDNO	= info.CARDNO
and    adv.CARDNO	= info.CARDNO
and     info.CARDNO = mul.CARDNO
AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
AND   loan.PAID_STATUS   LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
and   info.GENDER		 LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active		 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active))
order by DEPARTMENTNM, SECTIONNM, LINENO, CARDNO, FINYEAR, LOANDATE,DEDYEAR, SLNO asc
