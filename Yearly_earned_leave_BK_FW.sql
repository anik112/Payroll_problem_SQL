select amt.CARDNO, info.EMPNAME, info.DESIGNATION, amt.GROSSSAL, amt.PAYMENT_AMT, info.AC_NO
from  TB_YEARLY_ELEAVE_AMOUNT amt,TB_PERSONAL_INFO info
where amt.COMPANY  = info.COMPANY
and   info.COMPANY   = :p_company
and   amt.FINYEAR     = :p_year
and   info.JOINING_DATE  <= :p_join_date
and   amt.PAYMENT_AMT > 0
and   amt.CARDNO     = info.CARDNO
and   info.departmentnm like decode(nvl(:p_dept,'all'),'all','%',:p_dept)
and   info.sectionnm like decode(nvl(:p_sec,'all'),'all','%',:p_sec)
and   info.WORKERTYPE like decode(nvl(:p_worker,'all'),'all','%',:p_worker)
and   info.lineno like decode(nvl(:p_line,'all'),'all','%',:p_line)
and   info.cardno like decode(nvl(:p_card,'all'),'all','%',:p_card)
and   info.SHIFT like decode(nvl(:p_shift,'all'),'all','%',:p_shift)
and   info.active like decode(nvl(:p_active,'all'),'all','%',:p_active) 
AND   info.CASH_TYPE    LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)  ------ CASH/BANK
AND   amt.PAY_STATUS    LIKE DECODE(NVL(:p_paystatus,'all'),'all','%',:p_paystatus)  -------- ----------  Yes/ No
AND   info.BANK_NAME  LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
order by info.cardno asc  


--- for earned leave amount date 
where amt.COMPANY  = info.COMPANY
and   info.COMPANY   = :p_company
and   amt.FINYEAR     = :p_year
and   info.JOINING_DATE  between :p_join_date1 and  :p_join_date2
and   amt.PAYMENT_AMT > 0
and   amt.CARDNO     = info.CARDNO
and   info.departmentnm like decode(nvl(:p_dept,'all'),'all','%',:p_dept)
and   info.sectionnm like decode(nvl(:p_sec,'all'),'all','%',:p_sec)
and   info.WORKERTYPE like decode(nvl(:p_worker,'all'),'all','%',:p_worker)
and   info.lineno like decode(nvl(:p_line,'all'),'all','%',:p_line)
and   info.cardno like decode(nvl(:p_card,'all'),'all','%',:p_card)
and   info.SHIFT like decode(nvl(:p_shift,'all'),'all','%',:p_shift)
and   info.active like decode(nvl(:p_active,'all'),'all','%',:p_active) 
AND info.CASH_TYPE    LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)  ------ CASH/BANK
AND amt.PAY_STATUS    LIKE DECODE(NVL(:p_paystatus,'all'),'all','%',:p_paystatus)  -------- ----------  Yes/ No
AND info.BANK_NAME  LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
order by info.cardno asc  



--- for regin emp  
where amt.COMPANY  = info.COMPANY
and   info.COMPANY   = :p_company
and   amt.FINYEAR     = :p_year
and   info.JOINING_DATE  >= :p_join_date
and   amt.PAYMENT_AMT > 0
and   amt.CARDNO     = info.CARDNO
and   info.departmentnm like decode(nvl(:p_dept,'all'),'all','%',:p_dept)
and   info.sectionnm like decode(nvl(:p_sec,'all'),'all','%',:p_sec)
and   info.WORKERTYPE like decode(nvl(:p_worker,'all'),'all','%',:p_worker)
and   info.lineno like decode(nvl(:p_line,'all'),'all','%',:p_line)
and   info.cardno like decode(nvl(:p_card,'all'),'all','%',:p_card)
and   info.SHIFT like decode(nvl(:p_shift,'all'),'all','%',:p_shift)
and   info.active like decode(nvl(:p_active,'all'),'all','%',:p_active) 
AND info.CASH_TYPE    LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)  ------ CASH/BANK
AND amt.PAY_STATUS    LIKE DECODE(NVL(:p_paystatus,'all'),'all','%',:p_paystatus)  -------- ----------  Yes/ No
AND info.BANK_NAME  LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
order by info.cardno asc  