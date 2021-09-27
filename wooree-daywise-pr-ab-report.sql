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



SELECT per.empname,per.lineno,per.sectionnm,per.departmentnm,
       ot.cardno, ot.d1, ot.d2, ot.d3, ot.d4, ot.d5, ot.d6, ot.d7, ot.d8, ot.d9, ot.d10, ot.d11, ot.d12, ot.d13, ot.d14, ot.d15, 
       ot.d16, ot.d17, ot.d18, ot.d19, ot.d20, ot.d21, ot.d22, ot.d23, ot.d24, ot.d25, ot.d26, ot.d27, ot.d28, ot.d29, ot.d30, 
       ot.d31, ot.company, ot.finmonth, ot.finyear
FROM   TB_CLR_MONTH_ATTN_DETAIL ot, TB_PERSONAL_INFO per 
WHERE  per.company  = :p_company 
AND      per.company      = ot.company
AND    ot.finyear            = :p_year 
AND    ot.finmonth         = :p_month 
AND   TO_CHAR(per.joining_date,'RRRR')         =:p_year
AND   RTRIM(TO_CHAR(per.joining_date,'Month')) =:p_month
AND    ot.cardno           =  per.cardno 
AND    per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.sectionnm   LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.designation LIKE DECODE(NVL(:p_design,'all'),'all','%',:p_design) 
AND    per.workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    per.floorno    LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno) 
AND    per.machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)  
AND    per.lineno    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cardno    LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.active  LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY per.lineno,per.cardno ASC



SELECT per.SECTIONNM, COUNT(ot.cardno)Total_Emp,  SUM(ot.TOTAL)Total_OT_Hr, MIN(ot.TOTAL)Min_OT_Hr_Main, MAX(ot.TOTAL)Max_OT_Hr_Main
FROM   TB_OT_DAYWISE ot, TB_PERSONAL_INFO per 
WHERE  per.company  = :p_company 
AND    per.company  = ot.COMPANY
AND    ot.finyear   = :p_year 
AND    ot.finmonth  = :p_month 
AND    ot.cardno    = per.cardno 
AND    per.DEPARTMENTNM LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.SECTIONNM   LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.DESIGNATION LIKE DECODE(NVL(:p_design,'all'),'all','%',:p_design) 
AND    per.WORKERTYPE   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND    per.FLOORNO LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.MACHINENO LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cardno    LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.ACTIVE  LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
GROUP BY per.SECTIONNM
ORDER BY per.SECTIONNM ASC



SELECT per.empname,per.lineno,per.SECTIONNM,per.DEPARTMENTNM,
       ot.CARDNO, ot.D1, ot.D2, ot.D3, ot.D4, ot.D5, ot.D6, ot.D7, ot.D8, ot.D9, ot.D10, ot.D11, ot.D12, ot.D13, ot.D14, ot.D15, 
       ot.D16, ot.D17, ot.D18, ot.D19, ot.D20, ot.D21, ot.D22, ot.D23, ot.D24, ot.D25, ot.D26, ot.D27, ot.D28, ot.D29, ot.D30, 
       ot.D31, ot.COMPANY, ot.finMONTH, ot.finYEAR
FROM   TB_CLR_MONTH_ATTN_DETAIL ot, TB_PERSONAL_INFO per 
WHERE  per.company  = :p_company 
AND      per.company      = ot.company
AND    ot.finyear            = :p_year 
AND    ot.finmonth         = :p_month 
AND   TO_CHAR(per.RESIGNATION_DATE,'RRRR')         =:p_year
AND   RTRIM(TO_CHAR(per.RESIGNATION_DATE,'Month')) =:p_month
AND    ot.cardno           =  per.cardno 
AND    per.DEPARTMENTNM LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.SECTIONNM   LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.DESIGNATION LIKE DECODE(NVL(:p_design,'all'),'all','%',:p_design) 
AND    per.WORKERTYPE   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND    per.lineno    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cardno    LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.ACTIVE  LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY per.lineno,per.cardno ASC





SELECT per.empname,per.lineno,per.SECTIONNM,per.DEPARTMENTNM,
       ot.CARDNO, ot.D1, ot.D2, ot.D3, ot.D4, ot.D5, ot.D6, ot.D7, ot.D8, ot.D9, ot.D10, ot.D11, ot.D12, ot.D13, ot.D14, ot.D15, 
       ot.D16, ot.D17, ot.D18, ot.D19, ot.D20, ot.D21, ot.D22, ot.D23, ot.D24, ot.D25, ot.D26, ot.D27, ot.D28, ot.D29, ot.D30, 
       ot.D31, ot.COMPANY, ot.finMONTH, ot.finYEAR
FROM   TB_CLR_MONTH_ATTN_DETAIL ot, TB_PERSONAL_INFO per 
WHERE  per.company  = :p_company 
AND      per.company      = ot.company
AND    ot.finyear            = :p_year 
AND    ot.finmonth         = :p_month 
AND   TO_CHAR(per.RESIGNATION_DATE,'RRRR')         =:p_year
AND   RTRIM(TO_CHAR(per.RESIGNATION_DATE,'Month')) =:p_month
AND    ot.cardno           =  per.cardno 
AND    per.DEPARTMENTNM LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.SECTIONNM   LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.DESIGNATION LIKE DECODE(NVL(:p_design,'all'),'all','%',:p_design) 
AND    per.WORKERTYPE   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND    per.lineno    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cardno    LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.ACTIVE  LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY per.lineno,per.cardno ASC



--- problems
SELECT per.SECTIONNM, COUNT(ot.cardno)Total_Emp,  SUM(ot.TOTAL)Total_OT_Hr, MIN(ot.TOTAL)Min_OT_Hr_Main, MAX(ot.TOTAL)Max_OT_Hr_Main
FROM   TB_CLR_MONTH_ATTN_DETAIL ot, TB_PERSONAL_INFO per 
WHERE  per.company  = :p_company 
AND    per.company  = ot.COMPANY
AND    ot.finyear      = :p_year 
AND    ot.finmonth     = :p_month 
AND    ot.cardno    = per.cardno 
AND    per.DEPARTMENTNM LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.SECTIONNM   LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.DESIGNATION LIKE DECODE(NVL(:p_design,'all'),'all','%',:p_design) 
AND    per.WORKERTYPE   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND      per.FLOORNO LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND      per.MACHINENO LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cardno    LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.ACTIVE  LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
GROUP BY per.SECTIONNM
ORDER BY per.SECTIONNM ASC




SELECT per.empname,per.DEPARTMENTNM,per.lineno,per.SECTIONNM,
               ot.CARDNO, ot.D1, ot.D2, ot.D3, ot.D4, ot.D5, ot.D6, ot.D7, ot.D8, ot.D9, ot.D10, ot.D11, ot.D12, ot.D13, ot.D14, ot.D15, 
               ot.D16, ot.D17, ot.D18, ot.D19, ot.D20, ot.D21, ot.D22, ot.D23, ot.D24, ot.D25, ot.D26, ot.D27, ot.D28, ot.D29, ot.D30, 
               ot.D31,  ot.COMPANY, ot.finMONTH, ot.finYEAR, ot.TOTAL
FROM   TB_CLR_MONTH_ATTN_DETAIL ot, TB_PERSONAL_INFO per 
WHERE  per.company   = :p_company 
AND    per.company    = ot.COMPANY 
AND    ot.finyear          = :p_year 
AND    ot.finmonth       = :p_month 
AND   TO_CHAR(per.JOINING_DATE,'RRRR')         =:p_year
AND   RTRIM(TO_CHAR(per.JOINING_DATE,'Month')) =:p_month
AND    ot.cardno         =  per.cardno 
AND    per.DEPARTMENTNM LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.SECTIONNM   LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.DESIGNATION LIKE DECODE(NVL(:p_design,'all'),'all','%',:p_design) 
AND    per.WORKERTYPE   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND      per.FLOORNO LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND      per.MACHINENO LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cardno    LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.ACTIVE  LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY per.lineno,per.cardno ASC




SELECT per.empname,per.lineno,per.sectionnm,per.departmentnm,
       ot.cardno, ot.d1, ot.d2, ot.d3, ot.d4, ot.d5, ot.d6, ot.d7, ot.d8, ot.d9, ot.d10, ot.d11, ot.d12, ot.d13, ot.d14, ot.d15, 
       ot.d16, ot.d17, ot.d18, ot.d19, ot.d20, ot.d21, ot.d22, ot.d23, ot.d24, ot.d25, ot.d26, ot.d27, ot.d28, ot.d29, ot.d30, 
       ot.d31, ot.company, ot.finmonth, ot.finyear
FROM   TB_CLR_MONTH_ATTN_DETAIL ot, TB_PERSONAL_INFO per 
WHERE  per.company  = :p_company 
AND    per.company      = ot.company
AND    ot.finyear            = :p_year 
AND    ot.finmonth         = :p_month  
AND    TO_CHAR(per.resignation_date,'RRRR')              =:p_year
AND    RTRIM(TO_CHAR(per.resignation_date,'Month')) =:p_month
AND    ot.cardno           =  per.cardno 
AND    per.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.sectionnm           LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.designation        LIKE DECODE(NVL(:p_design,'all'),'all','%',:p_design) 
AND    per.workertype       LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND    per.floorno               LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.machineno          LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cardno    LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.active  LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.lineno,per.cardno ASC



SELECT per.empname,per.lineno,per.sectionnm,per.departmentnm,
       ot.cardno, ot.d1, ot.d2, ot.d3, ot.d4, ot.d5, ot.d6, ot.d7, ot.d8, ot.d9, ot.d10, ot.d11, ot.d12, ot.d13, ot.d14, ot.d15, 
       ot.d16, ot.d17, ot.d18, ot.d19, ot.d20, ot.d21, ot.d22, ot.d23, ot.d24, ot.d25, ot.d26, ot.d27, ot.d28, ot.d29, ot.d30, 
       ot.d31, ot.company, ot.finmonth, ot.finyear, per.DESIGNATION
FROM   TB_CLR_MONTH_ATTN_DETAIL ot, TB_PERSONAL_INFO per 
WHERE  per.company  = :p_company 
AND    per.company      = ot.company
AND    ot.finyear            = :p_year 
AND    ot.finmonth         = :p_month  
AND    TO_CHAR(per.resignation_date,'RRRR')              =:p_year
AND    RTRIM(TO_CHAR(per.resignation_date,'Month')) =:p_month
AND    ot.cardno           =  per.cardno 
AND    per.departmentnm    LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.designation        LIKE DECODE(NVL(:p_design,'all'),'all','%',:p_design) 
AND    per.workertype         LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND    per.floorno                LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno                 LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cardno                LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.lineno,per.cardno ASC