select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
info.EMPNAME, info.DESIGNATION, loan.LOANYEAR , loan.LOANDATE, loan.LOAN_AMT,
loan.REASON_STATUS, loan.PAID_STATUS, loan.LOAN_TYPE
from  TB_ADVANCEORLOAN_MASTER loan, tb_personal_info info
where loan.company        = :p_company
and   info.company           = loan.company
and   loan.LOANYEAR     = :p_year
and   loan.LOANMONTH = :p_month
and   loan.CARDNO          = info.CARDNO
AND   info.DEPARTMENTNM   LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   info.SECTIONNM            LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   info.DESIGNATION         LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.WORKERTYPE        LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.FLOORNO                LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.MACHINENO            LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                        LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
and   info.GENDER                    LIKE DECODE(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.active                         LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND   info.cardno                      LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
order by loan.LOANYEAR, info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.cardno asc

----------------------------------------------
select DEPARTMENTNM, SECTIONNM, LINENO, CARDNO, EMPNAME, DESIGNATION, 
          LOANYEAR , LOANDATE, LOAN_AMT, REASON_STATUS, PAID_STATUS, LOAN_TYPE 
from (
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
           info.EMPNAME, info.DESIGNATION, loan.LOANYEAR , loan.LOANDATE, loan.LOAN_AMT,
           loan.REASON_STATUS, loan.PAID_STATUS, loan.LOAN_TYPE
from  TB_ADVANCEORLOAN_MASTER loan, tb_personal_info info
where loan.company = :p_company
and   info.company    = loan.company
and   loan.LOANYEAR     = :p_year
and   loan.LOANMONTH = :p_month
and   loan.CARDNO         = info.CARDNO
AND   info.DEPARTMENTNM   in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
and   info.active                          LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND   info.cardno                       LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
           info.EMPNAME, info.DESIGNATION, loan.LOANYEAR , loan.LOANDATE, loan.LOAN_AMT,
           loan.REASON_STATUS, loan.PAID_STATUS, loan.LOAN_TYPE
from  TB_ADVANCEORLOAN_MASTER loan, tb_personal_info info
where loan.company   = :p_company
and   info.company     = loan.company
and   loan.LOANYEAR     = :p_year
and   loan.LOANMONTH = :p_month
and   loan.CARDNO         = info.CARDNO
AND info.SECTIONNM  in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
and   info.active               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND info.cardno            LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
           info.EMPNAME, info.DESIGNATION, loan.LOANYEAR , loan.LOANDATE, loan.LOAN_AMT,
           loan.REASON_STATUS, loan.PAID_STATUS, loan.LOAN_TYPE
from  TB_ADVANCEORLOAN_MASTER loan, tb_personal_info info
where loan.company   = :p_company
and   info.company     = loan.company
and   loan.LOANYEAR     = :p_year
and   loan.LOANMONTH = :p_month
and   loan.CARDNO         = info.CARDNO
AND info.DESIGNATION  in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
and   info.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND info.cardno                LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
           info.EMPNAME, info.DESIGNATION, loan.LOANYEAR , loan.LOANDATE, loan.LOAN_AMT,
           loan.REASON_STATUS, loan.PAID_STATUS, loan.LOAN_TYPE
from  TB_ADVANCEORLOAN_MASTER loan, tb_personal_info info
where loan.company   = :p_company
and   info.company      = loan.company
and   loan.LOANYEAR    = :p_year
and   loan.LOANMONTH = :p_month
and   loan.CARDNO         = info.CARDNO
AND info.WORKERTYPE    in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
and   info.active                    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND info.cardno                   LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
          info.EMPNAME, info.DESIGNATION, loan.LOANYEAR , loan.LOANDATE, loan.LOAN_AMT,
          loan.REASON_STATUS, loan.PAID_STATUS, loan.LOAN_TYPE
from  TB_ADVANCEORLOAN_MASTER loan, tb_personal_info info
where loan.company   = :p_company
and   info.company      = loan.company
and   loan.LOANYEAR    = :p_year
and   loan.LOANMONTH = :p_month
and   loan.CARDNO         = info.CARDNO
AND info.FLOORNO  in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
and   info.active          LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND info.cardno         LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
           info.EMPNAME, info.DESIGNATION, loan.LOANYEAR , loan.LOANDATE, loan.LOAN_AMT,
           loan.REASON_STATUS, loan.PAID_STATUS, loan.LOAN_TYPE
from  TB_ADVANCEORLOAN_MASTER loan, tb_personal_info info
where loan.company   = :p_company
and   info.company      = loan.company
and   loan.LOANYEAR     = :p_year
and   loan.LOANMONTH = :p_month
and   loan.CARDNO         = info.CARDNO
AND info.MACHINENO  in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
and   info.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND info.cardno             LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
           info.EMPNAME, info.DESIGNATION, loan.LOANYEAR , loan.LOANDATE, loan.LOAN_AMT,
           loan.REASON_STATUS, loan.PAID_STATUS, loan.LOAN_TYPE
from  TB_ADVANCEORLOAN_MASTER loan, tb_personal_info info
where loan.company   = :p_company
and   info.company      = loan.company
and   loan.LOANYEAR     = :p_year
and   loan.LOANMONTH = :p_month
and   loan.CARDNO         = info.CARDNO
AND info.LINENO   in ( select ITEM_NAME from TB_SETUP_ITEM where company =:p_company and ITEM_NAME is not null and USER_NAME = :p_user)
and   info.active      LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND info.cardno     LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
union
select info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, 
           info.EMPNAME, info.DESIGNATION, loan.LOANYEAR , loan.LOANDATE, loan.LOAN_AMT,
           loan.REASON_STATUS, loan.PAID_STATUS, loan.LOAN_TYPE
from  TB_ADVANCEORLOAN_MASTER loan, tb_personal_info info, TB_IDCARD_MULTIPLE mul
where loan.company   = :p_company
and   info.company     = loan.company
and   mul.COMPANY  = info.COMPANY
and   loan.LOANYEAR         = :p_year
and   loan.LOANMONTH     = :p_month
and   mul.USER_NAME       = :p_user
and   loan.CARDNO             = info.CARDNO
and   info.CARDNO              = mul.CARDNO
) order by LOANYEAR, DEPARTMENTNM, SECTIONNM, LINENO, cardno asc