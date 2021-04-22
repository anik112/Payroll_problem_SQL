SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
       mapp.duration,ROUND(mapp.otmin/60)othr,ROUND(mapp.otmin/60)||':00' ot,
       info.sectionnm,info.departmentnm, info.designation , info.joining_date
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company   = :p_company 
AND   mapp.company   = :p_com
AND   mapp.finyear   = TO_CHAR(:p_date,'rrrr')
AND   mapp.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate     = :p_date 
AND   mapp.iftar     = 1
AND   info.cardno    = mapp.cardno
AND   info.departmentnm    LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND   info.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation        LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype         LIKE DECODE(NVL(:p_wtype,'all'),'all','%',:p_wtype) 
AND   info.floorno                LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno) 
AND   info.machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                 LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)  
AND   info.shift                    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cash_type          LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND   info.bank_name        LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.mft_type             LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno               LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)  
AND   info.active                LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.lineno,info.cardno ASC



---------------------------------------





SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
              mapp.duration,ROUND(mapp.OTMIN/60)othr,ROUND(mapp.OTMIN/60)||':00' OT,
              info.SECTIONNM,info.DEPARTMENTNM, info.DESIGNATION , info.JOINING_DATE
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company = :p_company 
AND   mapp.company  = :p_com
AND   mapp.finyear      = TO_CHAR(:p_date,'rrrr')
AND   mapp.finmonth   = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate       = :p_date 
AND   mapp.IFTAR      = 1
AND   info.cardno        = mapp.cardno
AND   info.departmentnm IN ( SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.cash_type          LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND   info.bank_name        LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.mft_type             LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.gender  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)  
AND   info.active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
              mapp.duration,ROUND(mapp.OTMIN/60)othr,ROUND(mapp.OTMIN/60)||':00' OT,
              info.SECTIONNM,info.DEPARTMENTNM, info.DESIGNATION , info.JOINING_DATE
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company = :p_company 
AND   mapp.company  = :p_com
AND   mapp.finyear      = TO_CHAR(:p_date,'rrrr')
AND   mapp.finmonth   = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate       = :p_date 
AND   mapp.IFTAR      = 1
AND   info.cardno        = mapp.cardno
AND   info.sectionnm  IN ( SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.cash_type          LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND   info.bank_name        LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.mft_type             LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.gender    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)  
AND   info.active      LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
              mapp.duration,ROUND(mapp.OTMIN/60)othr,ROUND(mapp.OTMIN/60)||':00' OT,
              info.SECTIONNM,info.DEPARTMENTNM, info.DESIGNATION , info.JOINING_DATE
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company = :p_company 
AND   mapp.company  = :p_com
AND   mapp.finyear      = TO_CHAR(:p_date,'rrrr')
AND   mapp.finmonth   = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate       = :p_date 
AND   mapp.IFTAR      = 1
AND   info.cardno        = mapp.cardno
AND   info.designation  IN ( SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.cash_type          LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND   info.bank_name        LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.mft_type             LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.gender    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)  
AND   info.active      LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
              mapp.duration,ROUND(mapp.OTMIN/60)othr,ROUND(mapp.OTMIN/60)||':00' OT,
              info.SECTIONNM,info.DEPARTMENTNM, info.DESIGNATION , info.JOINING_DATE
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company = :p_company 
AND   mapp.company  = :p_com
AND   mapp.finyear      = TO_CHAR(:p_date,'rrrr')
AND   mapp.finmonth   = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate       = :p_date 
AND   mapp.IFTAR      = 1
AND   info.cardno        = mapp.cardno
AND   info.workertype  IN ( SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.cash_type          LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND   info.bank_name        LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.mft_type             LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.gender    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)  
AND   info.active      LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
              mapp.duration,ROUND(mapp.OTMIN/60)othr,ROUND(mapp.OTMIN/60)||':00' OT,
              info.SECTIONNM,info.DEPARTMENTNM, info.DESIGNATION , info.JOINING_DATE
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company = :p_company 
AND   mapp.company  = :p_com
AND   mapp.finyear      = TO_CHAR(:p_date,'rrrr')
AND   mapp.finmonth   = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate       = :p_date 
AND   mapp.IFTAR      = 1
AND   info.cardno        = mapp.cardno
AND   info.floorno  IN ( SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.cash_type          LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND   info.bank_name        LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.mft_type             LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.gender    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   info.active      LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
              mapp.duration,ROUND(mapp.OTMIN/60)othr,ROUND(mapp.OTMIN/60)||':00' OT,
              info.SECTIONNM,info.DEPARTMENTNM, info.DESIGNATION , info.JOINING_DATE
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company = :p_company 
AND   mapp.company  = :p_com
AND   mapp.finyear      = TO_CHAR(:p_date,'rrrr')
AND   mapp.finmonth   = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate       = :p_date 
AND   mapp.IFTAR      = 1
AND   info.cardno        = mapp.cardno
AND   info.machineno  IN ( SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.cash_type          LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND   info.bank_name        LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.mft_type             LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.gender    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   info.active      LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
              mapp.duration,ROUND(mapp.OTMIN/60)othr,ROUND(mapp.OTMIN/60)||':00' OT,
              info.SECTIONNM,info.DEPARTMENTNM, info.DESIGNATION , info.JOINING_DATE
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company = :p_company 
AND   mapp.company  = :p_com
AND   mapp.finyear      = TO_CHAR(:p_date,'rrrr')
AND   mapp.finmonth   = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate       = :p_date 
AND   mapp.IFTAR      = 1
AND   info.cardno        = mapp.cardno
AND   info.lineno  IN ( SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.cash_type          LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND   info.bank_name        LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.mft_type             LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.gender    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   info.active      LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
              mapp.duration,ROUND(mapp.OTMIN/60)othr,ROUND(mapp.OTMIN/60)||':00' OT,
              info.SECTIONNM,info.DEPARTMENTNM, info.DESIGNATION , info.JOINING_DATE
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company = :p_company 
AND   mapp.company  = :p_com
AND   mapp.finyear      = TO_CHAR(:p_date,'rrrr')
AND   mapp.finmonth   = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate       = :p_date 
AND   mapp.IFTAR      = 1
AND   info.cardno        = mapp.cardno
AND   info.shift  IN ( SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL )
AND   info.cash_type          LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND   info.bank_name        LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.mft_type             LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND   info.gender   LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   info.active      LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
          mapp.duration,ROUND(mapp.otmin/60)othr,ROUND(mapp.otmin/60)||':00' ot,
          info.sectionnm,info.departmentnm, info.designation , info.joining_date
FROM  tb_data_master  mapp,tb_personal_info info , tb_idcard_multiple mul
WHERE info.company = :p_company 
AND   mapp.company  = :p_com
AND   mapp.finyear      = TO_CHAR(:p_date,'rrrr')
AND   mapp.finmonth   = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate       = :p_date 
AND   mapp.IFTAR      = 1
AND   mul.user_name   = :p_user
AND   info.cardno         = mapp.cardno
AND   info.cardno         = mul.cardno
ORDER BY lineno,cardno ASC



--------------------



SELECT a.cardno, b.sectionnm,b.designation 
FROM tb_data_master a, tb_personal_info b
WHERE b.company  = :p_company
AND   a.company      = :p_com
AND   a.finyear          = TO_CHAR(:p_date,'RRRR')
AND   a.finmonth       = RTRIM(TO_CHAR(:p_date,'Month'))
AND   a.pdate           = :p_date
AND   a.iftar          = 1
AND   a.cardno         = b.cardno
AND   b.cash_type   LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND   b.bank_name  LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   b.mft_type     LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   b.active           LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)