SELECT info.cardno,info.empname,info.lineno, info.workertype, info.ac_no
              mapp.duration, ((mapp.otmin)/60)othr, ((mapp.otmin)/60)||':00' ot, info.otorg,
              info.sectionnm,info.departmentnm, info.grosssalary ,mapp.nt_tm, mapp.iftar, mapp.dinner,
              info.joining_date,  info.designation, mapp.tf, mapp.isln
FROM  TB_DATA_MASTER  mapp,TB_PERSONAL_INFO info 
WHERE info.company   = :p_company 
AND   mapp.company    = :p_com
AND   mapp.finyear        = TO_CHAR(:p_date ,'RRRR')
AND   mapp.finmonth     = RTRIM(TO_CHAR(:p_date ,'Month'))
AND   info.wday             = RTRIM(TO_CHAR(:p_date ,'Day'))
AND   mapp.pdate   BETWEEN  :p_date  AND  :p_date1
AND   (mapp.otmin         >0 OR mapp.tf > 0 OR mapp.isln > 0 OR SUBSTR(duration,1,INSTR(duration,':')-1) > 0 )
AND   mapp.cardno       = info.cardno
AND   info.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND   info.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation      LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype       LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno               LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cash_type        LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND   info.bank_name      LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.pay_sal            LIKE DECODE(NVL(:p_payable,'all'),'all','%',:p_payable)
AND   info.mft_type           LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.gender             LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno             LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)  
AND   info.active               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.lineno,info.cardno, mapp.pdate ASC
