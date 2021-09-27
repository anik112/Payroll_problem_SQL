SELECT  amt.departmentnm, amt.sectionnm, amt.lineno, amt.floorno, amt.empname,  amt.cardno, amt.designation, 
                info.joining_date, amt.grosssal_ch, amt.total_lev_day, amt.obt_earn_day, amt.pay_earn_day, amt.payable_ch,
                amt.payment_ch, amt.rd_payment_ch, amt.stamp
FROM  TB_YEARLY_ELEAVE_AMOUNT amt,TB_PERSONAL_INFO info
WHERE amt.company   = info.company
AND   info.company       = :p_company
AND   amt.finyear           = :p_year
AND   info.joining_date  <= :p_join_date
AND   amt.rd_payment_ch > 0
AND   amt.cardno          = info.cardno
AND   amt.departmentnm     LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   info.sectionnm           LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   info.workertype          LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.workertype          LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.workertype          LIKE DECODE(NVL(:p_machine,'all'),'all','%',:p_machine)
AND   info.lineno                  LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                     LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cash_type           LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type)  
AND   amt.pay_status           LIKE DECODE(NVL(:p_payment_status,'all'),'all','%',:p_payment_status)  
AND   info.bank_name         LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND   info.mft_type         LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.cardno                 LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   info.active                  LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)  
ORDER BY info.cardno ASC