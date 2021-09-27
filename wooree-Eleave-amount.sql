SELECT info.departmentnm, info.sectionnm, info.lineno, amt.cardno, amt.empname, 
              amt.designation, info.joining_date, amt.grosssal_ch, amt.total_earn_day, amt.obt_earn_day,
              amt.pay_earn_day, amt.payable_ch, amt.stamp, amt.rd_payment_ch, info.ac_no
FROM  TB_YEARLY_ELEAVE_AMOUNT amt,TB_PERSONAL_INFO info
WHERE amt.company  = info.company
AND   info.company      = :p_company
AND   amt.finyear          = :p_year
AND   info.joining_date <= :p_join_date
AND   info.joining_date BETWEEN :p_join_date1 AND :p_join_date2
AND   info.resignation_date BETWEEN :p_join_date1 AND :p_join_date2
AND   amt.rd_payment_ch > 0
AND   amt.cardno          = info.cardno
AND   info.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   info.sectionnm        LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   info.workertype       LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno       LIKE DECODE(NVL(:p_machine,'all'),'all','%',:p_machine)
AND   info.lineno               LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cash_type        LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type)  
AND   amt.pay_status       LIKE DECODE(NVL(:p_payment_status,'all'),'all','%',:p_payment_status)  
AND   info.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.cardno             LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   info.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY info.cardno ASC  



SELECT info.departmentnm, info.sectionnm, info.lineno, amt.cardno, amt.empname, 
              amt.designation, info.joining_date, (amt.grosssal_ch+amt.grosssal_bk) gross, amt.total_earn_day, amt.obt_earn_day, info.mft_acno
              amt.pay_earn_day, (amt.payable_ch+amt.payable_bk) payable, amt.stamp, (amt.rd_payment_ch+amt.rd_payment_bk) net_payment, info.ac_no
FROM  TB_YEARLY_ELEAVE_AMOUNT amt,TB_PERSONAL_INFO info
WHERE amt.company  = info.company
AND   info.company      = :p_company
AND   amt.finyear          = :p_year
AND   (amt.rd_payment_ch+amt.rd_payment_bk) > 0
AND   amt.cardno          = info.cardno
AND   info.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   info.sectionnm        LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   info.workertype       LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno       LIKE DECODE(NVL(:p_machine,'all'),'all','%',:p_machine)
AND   info.lineno               LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cash_type        LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type)  
AND   amt.pay_status       LIKE DECODE(NVL(:p_payment_status,'all'),'all','%',:p_payment_status)  
AND   info.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.cardno             LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   info.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY info.cardno ASC 


