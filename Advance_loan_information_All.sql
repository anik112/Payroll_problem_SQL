select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
info.EMPNAME, info.DESIGNATION, loan.LOANYEAR, loan.LOANDATE, loan.LOAN_AMT,
adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT
from  TB_ADVANCEORLOAN_MASTER loan, TB_ADVANCEORLOAN_INFO adv, TB_PERSONAL_INFO info, TB_MONTH mon
where info.company  = :p_company
and   loan.company	= info.company
and	  adv.COMPANY  	= info.COMPANY
and	  loan.LOANYEAR	= :p_year
and	  adv.LOANYEAR 	= loan.LOANYEAR
and	  loan.LOANMONTH= :p_month
and	  adv.LOANMONTH	= loan.LOANMONTH
and	  mon.MONTH_NAME= adv.DEDMONTH
and	  loan.CARDNO	= info.CARDNO
and	  adv.CARDNO	= info.CARDNO
and	  adv.LOAN_TYPE = loan.LOAN_TYPE
and	  loan.LOAN_TYPE     in ('Advance', 'Loan')
AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
AND   loan.PAID_STATUS       LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
AND   info.DEPARTMENTNM  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   info.SECTIONNM     LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   info.DESIGNATION   LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.WORKERTYPE    LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.FLOORNO       LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.MACHINENO     LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno        LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
and   info.GENDER        LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active        LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND   info.cardno        LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
order by info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, loan.LOANYEAR, 
loan.LOANDATE,adv.DEDYEAR, mon.SLNO asc

--------------------------------------------------
--- Selected 
--------------------------------------------------



select DEPARTMENTNM, SECTIONNM, LINENO, CARDNO, EMPNAME, 
DESIGNATION, LOANYEAR, LOANDATE, LOAN_AMT, DEDYEAR, 
DEDMONTH, DEDAMOUNT, SLNO
from
(
	select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
	info.EMPNAME, info.DESIGNATION, loan.LOANYEAR, loan.LOANDATE, loan.LOAN_AMT,
	adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT, mon.SLNO
	from  TB_ADVANCEORLOAN_MASTER loan, TB_ADVANCEORLOAN_INFO adv, TB_PERSONAL_INFO info, TB_MONTH mon
	where info.company         = :p_company
	and   loan.company	         = info.company
	and   adv.COMPANY       = info.COMPANY
	and   loan.LOANYEAR     = :p_year
	and   adv.LOANYEAR      = loan.LOANYEAR
	and   loan.LOANMONTH  = :p_month
	and   adv.LOANMONTH   = loan.LOANMONTH
	and   mon.MONTH_NAME= adv.DEDMONTH
	and   loan.CARDNO          =  info.CARDNO
	and   adv.CARDNO           = info.CARDNO
	and   adv.LOAN_TYPE     = loan.LOAN_TYPE
	and   loan.LOAN_TYPE             in ('Advance', 'Loan')
	AND   info.DEPARTMENTNM   in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
	AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
	AND   loan.PAID_STATUS        LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
	and   info.GENDER                    LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
	and   info.active                          LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
	union
	select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
	info.EMPNAME, info.DESIGNATION, loan.LOANYEAR, loan.LOANDATE, loan.LOAN_AMT,
	adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT, mon.SLNO
	from  TB_ADVANCEORLOAN_MASTER loan, TB_ADVANCEORLOAN_INFO adv, TB_PERSONAL_INFO info, TB_MONTH mon
	where info.company         = :p_company
	and   loan.company	         = info.company
	and   adv.COMPANY       = info.COMPANY
	and   loan.LOANYEAR     = :p_year
	and   adv.LOANYEAR      = loan.LOANYEAR
	and   loan.LOANMONTH  = :p_month
	and   adv.LOANMONTH   = loan.LOANMONTH
	and   mon.MONTH_NAME= adv.DEDMONTH
	and   loan.CARDNO          = info.CARDNO
	and   adv.CARDNO           = info.CARDNO
	and   adv.LOAN_TYPE     = loan.LOAN_TYPE
	and   loan.LOAN_TYPE             in ('Advance', 'Loan')
	AND   info.SECTIONNM            in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
	AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
	AND   loan.PAID_STATUS        LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
	and   info.GENDER                    LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
	and   info.active                         LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
	union
	select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
	info.EMPNAME, info.DESIGNATION, loan.LOANYEAR, loan.LOANDATE, loan.LOAN_AMT,
	adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT, mon.SLNO
	from  TB_ADVANCEORLOAN_MASTER loan, TB_ADVANCEORLOAN_INFO adv, TB_PERSONAL_INFO info, TB_MONTH mon
	where info.company         =  :p_company
	and   loan.company	         =  info.company
	and   adv.COMPANY       =  info.COMPANY
	and   loan.LOANYEAR     =  :p_year
	and   adv.LOANYEAR      =  loan.LOANYEAR
	and   loan.LOANMONTH  =  :p_month
	and   adv.LOANMONTH   =  loan.LOANMONTH
	and   mon.MONTH_NAME=  adv.DEDMONTH
	and   loan.CARDNO          =  info.CARDNO
	and   adv.CARDNO           = info.CARDNO
	and   adv.LOAN_TYPE     = loan.LOAN_TYPE
	and   loan.LOAN_TYPE             in ('Advance', 'Loan')
	AND   info.DESIGNATION         in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
	AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
	AND   loan.PAID_STATUS        LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
	and   info.GENDER                    LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
	and   info.active                         LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
	union
	select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
	info.EMPNAME, info.DESIGNATION, loan.LOANYEAR, loan.LOANDATE, loan.LOAN_AMT,
	adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT, mon.SLNO
	from  TB_ADVANCEORLOAN_MASTER loan, TB_ADVANCEORLOAN_INFO adv, TB_PERSONAL_INFO info, TB_MONTH mon
	where info.company         =  :p_company
	and   loan.company	         = info.company
	and   adv.COMPANY       = info.COMPANY
	and   loan.LOANYEAR     = :p_year
	and   adv.LOANYEAR      = loan.LOANYEAR
	and   loan.LOANMONTH  = :p_month
	and   adv.LOANMONTH   = loan.LOANMONTH
	and   mon.MONTH_NAME= adv.DEDMONTH
	and   loan.CARDNO          =  info.CARDNO
	and   adv.CARDNO           = info.CARDNO
	and   adv.LOAN_TYPE     = loan.LOAN_TYPE
	and   loan.LOAN_TYPE             in ('Advance', 'Loan')
	AND   info.WORKERTYPE        in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
	AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
	AND   loan.PAID_STATUS        LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
	and   info.GENDER                    LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
	and   info.active                          LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)	
	union
	select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
	info.EMPNAME, info.DESIGNATION, loan.LOANYEAR, loan.LOANDATE, loan.LOAN_AMT,
	adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT, mon.SLNO
	from  TB_ADVANCEORLOAN_MASTER loan, TB_ADVANCEORLOAN_INFO adv, TB_PERSONAL_INFO info, TB_MONTH mon
	where info.company           = :p_company
	and   loan.company	           = info.company
	and   adv.COMPANY          = info.COMPANY
	and   loan.LOANYEAR       = :p_year
	and   adv.LOANYEAR        = loan.LOANYEAR
	and   loan.LOANMONTH    = :p_month
	and   adv.LOANMONTH     =  loan.LOANMONTH
	and   mon.MONTH_NAME  = adv.DEDMONTH
	and   loan.CARDNO            = info.CARDNO
	and   adv.CARDNO             = info.CARDNO
	and   adv.LOAN_TYPE       = loan.LOAN_TYPE
	and   loan.LOAN_TYPE             in ('Advance', 'Loan')
	AND   info.FLOORNO                in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
	AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
	AND   loan.PAID_STATUS        LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
	and   info.GENDER                    LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
	and   info.active                          LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
	union
	select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
	info.EMPNAME, info.DESIGNATION, loan.LOANYEAR, loan.LOANDATE, loan.LOAN_AMT,
	adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT, mon.SLNO
	from  TB_ADVANCEORLOAN_MASTER loan, TB_ADVANCEORLOAN_INFO adv, TB_PERSONAL_INFO info, TB_MONTH mon
	where info.company           = :p_company
	and   loan.company	           = info.company
	and   adv.COMPANY         = info.COMPANY
	and   loan.LOANYEAR       = :p_year
	and   adv.LOANYEAR        = loan.LOANYEAR
	and   loan.LOANMONTH    = :p_month
	and   adv.LOANMONTH     = loan.LOANMONTH
	and   mon.MONTH_NAME  = adv.DEDMONTH
	and   loan.CARDNO            = info.CARDNO
	and   adv.CARDNO             = info.CARDNO
	and   adv.LOAN_TYPE       = loan.LOAN_TYPE
	and   loan.LOAN_TYPE             in ('Advance', 'Loan')
	AND   info.MACHINENO            in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
	AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
	AND   loan.PAID_STATUS        LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
	and   info.GENDER                    LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
	and   info.active                         LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
	union
	select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
	info.EMPNAME, info.DESIGNATION, loan.LOANYEAR, loan.LOANDATE, loan.LOAN_AMT,
	adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT, mon.SLNO
	from  TB_ADVANCEORLOAN_MASTER loan, TB_ADVANCEORLOAN_INFO adv, TB_PERSONAL_INFO info, TB_MONTH mon
	where info.company          = :p_company
	and   loan.company	          = info.company
	and   adv.COMPANY        = info.COMPANY
	and   loan.LOANYEAR      = :p_year
	and   adv.LOANYEAR       = loan.LOANYEAR
	and   loan.LOANMONTH   = :p_month
	and   adv.LOANMONTH    = loan.LOANMONTH
	and   mon.MONTH_NAME = adv.DEDMONTH
	and   loan.CARDNO           = info.CARDNO
	and   adv.CARDNO            = info.CARDNO
	and   adv.LOAN_TYPE      = loan.LOAN_TYPE
	and   loan.LOAN_TYPE             in ('Advance', 'Loan')
	AND   info.lineno                        in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
	AND   loan.REASON_STATUS LIKE DECODE(NVL(:p_reason_status,'all'),'all','%',:p_reason_status)
	AND   loan.PAID_STATUS        LIKE DECODE(NVL(:p_paid_status,'all'),'all','%',:p_paid_status)
	and   info.GENDER                    LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
	and   info.active                          LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
	union
	select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
	info.EMPNAME, info.DESIGNATION, loan.LOANYEAR, loan.LOANDATE, loan.LOAN_AMT,
	adv.DEDYEAR, adv.DEDMONTH, adv.DEDAMOUNT, mon.SLNO
	from  TB_ADVANCEORLOAN_MASTER loan, TB_ADVANCEORLOAN_INFO adv, 
	         TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul, TB_MONTH mon
	where info.company            = :p_company
	and   loan.company	            = info.company
	and   adv.COMPANY          = info.COMPANY
	and   info.COMPANY          = mul.COMPANY
	and   loan.LOANYEAR        =  :p_year
	and   adv.LOANYEAR         = loan.LOANYEAR
	and   loan.LOANMONTH     =  :p_month
	and   adv.LOANMONTH     =  loan.LOANMONTH
	and   mon.MONTH_NAME  =  adv.DEDMONTH
	and   loan.CARDNO            =  info.CARDNO
	and   adv.CARDNO             = info.CARDNO
	and   info.CARDNO             = mul.CARDNO
	and   adv.LOAN_TYPE       = loan.LOAN_TYPE
	and   mul.USER_NAME      = :p_user
	and   loan.LOAN_TYPE      in ('Advance', 'Loan')
)order by DEPARTMENTNM, SECTIONNM, LINENO, CARDNO, LOANYEAR, LOANDATE, DEDYEAR, SLNO asc