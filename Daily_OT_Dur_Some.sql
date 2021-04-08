SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime, mapp.duration, ((mapp.otmin)/60)othr, ((mapp.otmin)/60)||':00' ot,
       info.sectionnm,info.departmentnm, info.otorg, info.workertype, (info.grosssalary + info.gross_bk)grosssalary, info.otorg
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE  info.company   = :p_company 
AND   mapp.company  = :p_com
AND   mapp.finyear  = TO_CHAR(:p_date ,'RRRR')
AND   mapp.finmonth  = RTRIM(TO_CHAR(:p_date ,'Month'))
AND   mapp.pdate            = :p_date 
AND   mapp.duration IS NOT NULL
AND   mapp.cardno         = info.cardno
AND   info.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND   info.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation      LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype       LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno               LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cash_type        LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND   info.bank_name      LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.mft_type           LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.gender             LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno             LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)  
AND   info.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.departmentnm,info.sectionnm, info.lineno,info.cardno ASC




----------------------



SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime, info.workertype,
          mapp.duration, ((mapp.otmin)/60)othr, ((mapp.otmin)/60)||':00' ot,
          info.sectionnm, (info.grosssalary + info.gross_bk)grosssalary, otorg
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company         = :p_company 
AND    mapp.company      = :p_com
AND   mapp.finyear      = TO_CHAR(:p_date ,'RRRR')
AND   mapp.finmonth  = RTRIM(TO_CHAR(:p_date ,'Month'))
AND   mapp.pdate       BETWEEN  :p_date AND :p_date1  
AND   mapp.otmin        > 0
AND    mapp.cardno       = info.cardno
AND   info.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND   info.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation      LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype       LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno               LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cash_type        LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND   info.bank_name      LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.mft_type           LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.gender             LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno             LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)  
AND   info.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.sectionnm, info.lineno  ASC