SELECT info.cardno,info.empname,info.designation,mapp.pdate,mapp.intime,
               mapp.outtime,mapp.duration,mapp.latestatus, (mapp.otmin/60)othr,(mapp.otmin/60)||':00'ot,
               info.lineno, mapp.latehr, mapp.earlyhr, mapp.earlystatus, mapp.isln, mapp.tf, info.joining_date
FROM  TB_DATA_MASTER  mapp,TB_PERSONAL_INFO info 
WHERE  info.company               =:p_company 
AND   mapp.company                 =:p_com
AND   info.departmentnm            =:p_dept 
AND   mapp.finyear                     =:p_year
AND   mapp.finmonth                  =:p_month
AND   TO_CHAR(info.joining_date,'RRRR')              =:p_year
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) =:p_month
AND   info.joining_date IS NOT NULL
AND   info.cardno                       = mapp.cardno
AND   info.sectionnm     LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation   LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype   LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno          LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno   LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno           LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift              LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.cardno         LIKE DECODE(NVL(:p_card,'all'), 'all','%',:p_card)
ORDER BY info.sectionnm,info.cardno,info.lineno,mapp.pdate ASC


--------------------------------


SELECT info.cardno,info.empname,info.designation,mapp.pdate,mapp.intime,info.RESIGNATION_DATE,
               mapp.outtime,mapp.duration,mapp.latestatus, (mapp.otmin/60)othr,(mapp.otmin/60)||':00'ot,
               info.lineno, mapp.latehr, mapp.earlyhr, mapp.earlystatus, mapp.isln, mapp.tf, info.joining_date
FROM  TB_DATA_MASTER  mapp,TB_PERSONAL_INFO info 
WHERE  info.company               =:p_company 
AND   mapp.company                 =:p_com
AND   info.departmentnm            =:p_dept 
AND   mapp.finyear                     =:p_year
AND   mapp.finmonth                  =:p_month
AND   TO_CHAR(info.resignation_date,'RRRR')              =:p_year
AND   RTRIM(TO_CHAR(info.resignation_date,'Month')) =:p_month
AND   info.resignation_date IS NOT NULL
AND   info.cardno                       = mapp.cardno
AND   info.sectionnm     LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation   LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype   LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno          LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno   LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno           LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift              LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.cardno         LIKE DECODE(NVL(:p_card,'all'), 'all','%',:p_card)
ORDER BY info.sectionnm,info.cardno,info.lineno,mapp.pdate ASC


--------------------------------------------


SELECT info.cardno,info.empname,info.designation,mapp.pdate,mapp.intime,
               mapp.outtime,mapp.duration,mapp.latestatus, (mapp.otmin/60)othr,(mapp.otmin/60)||':00'ot,
               info.lineno, mapp.latehr, mapp.earlyhr, mapp.earlystatus, mapp.isln, mapp.tf, info.joining_date
FROM  TB_DATA_MASTER  mapp,TB_PERSONAL_INFO info 
WHERE  info.company               =:p_company 
AND   mapp.company                 =:p_com
AND   info.departmentnm            =:p_dept 
AND   mapp.finyear                     =:p_year
AND   mapp.finmonth                  =:p_month
AND   info.cardno                       = mapp.cardno
AND   info.sectionnm     LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation   LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype   LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno          LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno   LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno           LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift              LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.cardno         LIKE DECODE(NVL(:p_card,'all'), 'all','%',:p_card)
ORDER BY info.sectionnm,info.cardno,info.lineno,mapp.pdate ASC


-------------------------------------------------



SELECT info.cardno,info.empname,info.designation,mapp.pdate,mapp.intime,
               mapp.outtime,mapp.duration,mapp.latestatus, (mapp.otmin/60)othr,(mapp.otmin/60)||':00'ot,
               info.lineno, mapp.latehr, mapp.earlyhr, mapp.earlystatus, mapp.isln, mapp.tf, info.joining_date
FROM  TB_DATA_MASTER  mapp,TB_PERSONAL_INFO info 
WHERE  info.company               =:p_company 
AND   mapp.company                 =:p_com
AND   info.departmentnm            =:p_dept 
AND   mapp.finyear                     =:p_year
AND   mapp.finmonth                  =:p_month
AND   info.cardno                       = mapp.cardno
AND    info.sectionnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL )
UNION
SELECT info.cardno,info.empname,info.designation,mapp.pdate,mapp.intime,
               mapp.outtime,mapp.duration,mapp.latestatus, (mapp.otmin/60)othr,(mapp.otmin/60)||':00'ot,
               info.lineno, mapp.latehr, mapp.earlyhr, mapp.earlystatus, mapp.isln, mapp.tf, info.joining_date
FROM  TB_DATA_MASTER  mapp,TB_PERSONAL_INFO info 
WHERE  info.company               =:p_company 
AND   mapp.company                 =:p_com
AND   info.departmentnm            =:p_dept 
AND   mapp.finyear                     =:p_year
AND   mapp.finmonth                  =:p_month
AND   info.cardno                       = mapp.cardno
AND    info.designation IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL )
UNION
SELECT info.cardno,info.empname,info.designation,mapp.pdate,mapp.intime,
               mapp.outtime,mapp.duration,mapp.latestatus, (mapp.otmin/60)othr,(mapp.otmin/60)||':00'ot,
               info.lineno, mapp.latehr, mapp.earlyhr, mapp.earlystatus, mapp.isln, mapp.tf, info.joining_date
FROM  TB_DATA_MASTER  mapp,TB_PERSONAL_INFO info 
WHERE  info.company               =:p_company 
AND   mapp.company                 =:p_com
AND   info.departmentnm            =:p_dept 
AND   mapp.finyear                     =:p_year
AND   mapp.finmonth                  =:p_month
AND   info.cardno                       = mapp.cardno
AND    info.workertype IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL )
UNION
SELECT info.cardno,info.empname,info.designation,mapp.pdate,mapp.intime,
               mapp.outtime,mapp.duration,mapp.latestatus, (mapp.otmin/60)othr,(mapp.otmin/60)||':00'ot,
               info.lineno, mapp.latehr, mapp.earlyhr, mapp.earlystatus, mapp.isln, mapp.tf, info.joining_date
FROM  TB_DATA_MASTER  mapp,TB_PERSONAL_INFO info 
WHERE  info.company               =:p_company 
AND   mapp.company                 =:p_com
AND   info.departmentnm            =:p_dept 
AND   mapp.finyear                     =:p_year
AND   mapp.finmonth                  =:p_month
AND   info.cardno                       = mapp.cardno
AND    info.floorno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL )
UNION
SELECT info.cardno,info.empname,info.designation,mapp.pdate,mapp.intime,
               mapp.outtime,mapp.duration,mapp.latestatus, (mapp.otmin/60)othr,(mapp.otmin/60)||':00'ot,
               info.lineno, mapp.latehr, mapp.earlyhr, mapp.earlystatus, mapp.isln, mapp.tf, info.joining_date
FROM  TB_DATA_MASTER  mapp,TB_PERSONAL_INFO info 
WHERE  info.company               =:p_company 
AND   mapp.company                 =:p_com
AND   info.departmentnm            =:p_dept 
AND   mapp.finyear                     =:p_year
AND   mapp.finmonth                  =:p_month
AND   info.cardno                       = mapp.cardno
AND    info.machineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL )
UNION
SELECT info.cardno,info.empname,info.designation,mapp.pdate,mapp.intime,
               mapp.outtime,mapp.duration,mapp.latestatus, (mapp.otmin/60)othr,(mapp.otmin/60)||':00'ot,
               info.lineno, mapp.latehr, mapp.earlyhr, mapp.earlystatus, mapp.isln, mapp.tf, info.joining_date
FROM  TB_DATA_MASTER  mapp,TB_PERSONAL_INFO info 
WHERE  info.company               =:p_company 
AND   mapp.company                 =:p_com
AND   info.departmentnm            =:p_dept 
AND   mapp.finyear                     =:p_year
AND   mapp.finmonth                  =:p_month
AND   info.cardno                       = mapp.cardno
AND    info.lineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL )
UNION
SELECT info.cardno,info.empname,info.designation,mapp.pdate,mapp.intime,
               mapp.outtime,mapp.duration,mapp.latestatus, (mapp.otmin/60)othr,(mapp.otmin/60)||':00'ot,
               info.lineno, mapp.latehr, mapp.earlyhr, mapp.earlystatus, mapp.isln, mapp.tf, info.joining_date
FROM  TB_DATA_MASTER  mapp,TB_PERSONAL_INFO info 
WHERE  info.company               =:p_company 
AND   mapp.company                 =:p_com
AND   info.departmentnm            =:p_dept 
AND   mapp.finyear                     =:p_year
AND   mapp.finmonth                  =:p_month
AND   info.cardno                       = mapp.cardno
AND    info.shift IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL )
UNION
SELECT info.cardno,info.empname,info.designation,mapp.pdate,mapp.intime,
               mapp.outtime,mapp.duration,mapp.latestatus, (mapp.otmin/60)othr,(mapp.otmin/60)||':00'ot,
               info.lineno, mapp.latehr, mapp.earlyhr, mapp.earlystatus, mapp.isln, mapp.tf, info.joining_date
FROM  TB_DATA_MASTER  mapp,TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul
WHERE  info.company               =:p_company 
AND    info.company      = mul.company
AND   mapp.company                 =:p_com
AND   info.departmentnm            =:p_dept 
AND    mul.user_name = :p_user
AND   mapp.finyear                     =:p_year
AND   mapp.finmonth                  =:p_month
AND   info.cardno                       = mapp.cardno
AND    info.cardno        = mul.cardno
ORDER BY sectionnm,cardno,lineno,pdate ASC

