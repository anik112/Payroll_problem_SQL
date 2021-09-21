SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
              mapp.duration, mapp.latestatus, info.departmentnm, info.sectionnm, mapp.pdate, info.designation
FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
WHERE info.company  = :p_company 
AND   mapp.company   = :p_com
AND   mapp.finyear       = TO_CHAR(:p_fromdate,'RRRR')
AND   mapp.finmonth    = RTRIM(TO_CHAR(:p_fromdate,'Month'))
AND   TO_CHAR(info.joining_date,'RRRR')              = TO_CHAR(:p_fromdate,'RRRR')
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) = RTRIM(TO_CHAR(:p_fromdate,'Month'))
AND   mapp.pdate BETWEEN :p_fromdate AND :ptodate
AND   (mapp.intime IS NULL OR mapp.outtime IS NULL)
AND   info.cardno          = mapp.cardno
AND   info.departmentnm    LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND   info.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.workertype         LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno                LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                 LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cardno               LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
ORDER BY info.sectionnm,mapp.pdate,info.cardno ASC


SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, mapp.pdate, info.designation
FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
WHERE  info.company = :p_company 
AND   mapp.company   = :p_com
AND   mapp.finyear       = TO_CHAR(:p_fromdate,'RRRR')
AND   mapp.finmonth    = RTRIM(TO_CHAR(:p_fromdate,'Month'))
AND   mapp.pdate BETWEEN :p_fromdate AND :ptodate
AND   (mapp.intime IS NULL OR mapp.outtime IS NULL)
AND   info.cardno          = mapp.cardno
AND   info.departmentnm    LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND   info.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.workertype         LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno               LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                 LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cardno               LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
ORDER BY info.sectionnm,mapp.pdate,info.cardno ASC



SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, mapp.pdate, info.designation
FROM  TB_DATA_MASTER mapp, TB_PERSONAL_INFO info 
WHERE  info.company   = :p_company 
AND   mapp.company     = :p_com
AND   mapp.finyear         =  TO_CHAR(:p_fromdate,'RRRR')
AND   mapp.finmonth      =  RTRIM(TO_CHAR(:p_fromdate,'Month'))
AND   TO_CHAR(info.resignation_date,'RRRR')              = TO_CHAR(:p_fromdate,'RRRR')
AND   RTRIM(TO_CHAR(info.resignation_date,'Month')) = RTRIM(TO_CHAR(:p_fromdate,'Month'))
AND   mapp.pdate BETWEEN :p_fromdate AND :ptodate
AND   (mapp.intime IS NULL OR mapp.outtime IS NULL)
AND   info.cardno           = mapp.cardno
AND   info.departmentnm    LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND   info.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.workertype         LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno               LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                 LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cardno               LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
ORDER BY info.sectionnm,mapp.pdate,info.cardno ASC

-------------------------------------------------------------------------------------------
SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
               mapp.LATEHR,mapp.LATESTATUS,info.SECTIONNM,mapp.pdate, info.DESIGNATION
FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
WHERE info.company                =:p_company 
AND   mapp.company                 = :p_com
AND   info.DEPARTMENTNM    = :p_dept 
AND   mapp.finyear                     = :p_year
AND   mapp.finmonth                  = :p_month
AND   TO_CHAR(info.JOINING_DATE,'RRRR')        =:p_year
AND   RTRIM(TO_CHAR(info.JOINING_DATE,'Month')) =:p_month
AND   info.JOINING_DATE IS NOT NULL
AND   mapp.LATESTATUS IS NOT NULL
AND   info.cardno                      = mapp.cardno  
AND   info.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION    LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype         LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno                LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                 LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cardno                LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
ORDER BY info.SECTIONNM,mapp.pdate,info.lineno,info.cardno ASC



SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
               mapp.LATEHR,mapp.LATESTATUS,info.SECTIONNM,mapp.pdate, info.DESIGNATION
FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
WHERE info.company                =:p_company 
AND   mapp.company                 = :p_com
AND   info.DEPARTMENTNM    = :p_dept 
AND   mapp.finyear                     = :p_year
AND   mapp.finmonth                  = :p_month
AND   TO_CHAR(info.RESIGNATION_DATE,'RRRR')        =:p_year
AND   RTRIM(TO_CHAR(info.RESIGNATION_DATE,'Month')) =:p_month
AND   info.RESIGNATION_DATE IS NOT NULL
AND   mapp.LATESTATUS IS NOT NULL
AND   info.cardno                      = mapp.cardno 
AND   info.sectionnm             LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION    LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype           LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno                  LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno           LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                   LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                      LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cardno                 LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
ORDER BY info.SECTIONNM,mapp.pdate,info.lineno,info.cardno  
.

SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
               mapp.LATEHR,mapp.LATESTATUS,info.SECTIONNM,mapp.pdate, info.DESIGNATION
FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
WHERE info.company                =:p_company 
AND   mapp.company                 = :p_com
AND   info.DEPARTMENTNM    = :p_dept 
AND   mapp.finyear                     = :p_year
AND   mapp.finmonth                  = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   info.cardno                      = mapp.cardno 
AND   info.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION  LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype         LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno                LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                 LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cardno                LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
ORDER BY info.SECTIONNM,mapp.pdate,info.lineno,info.cardno ASC



SELECT a.cardno, a.empname, a.lineno, a.sectionnm, a.totalcnt, 
               b.fifteen, c.tweenty , d.thirty,  e.forty, a.designation
FROM 
(SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM,info.designation,NVL(COUNT(info.cardno),0) totalcnt
FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
WHERE info.company         = :p_company 
AND   mapp.company          = :p_com
AND   info.DEPARTMENTNM    =:p_dept 
AND   mapp.finyear              = :p_year
AND   mapp.finmonth           = :p_month
AND   TO_CHAR(info.JOINING_DATE,'RRRR')              = :p_year
AND   RTRIM(TO_CHAR(info.JOINING_DATE,'Month')) = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   info.cardno                = mapp.cardno
AND   info.SECTIONNM      LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION   LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.WORKERTYPE  LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.FLOORNO          LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.MACHINENO      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                  LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                     LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.cardno                LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)  
GROUP BY info.cardno,info.empname,info.lineno,info.SECTIONNM,info.designation
ORDER BY info.SECTIONNM,info.lineno,info.cardno ASC
)a,
(SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM, NVL(COUNT(info.cardno),0) fifteen
FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
WHERE info.company       = :p_company 
AND   mapp.company        = :p_com
AND   info.DEPARTMENTNM    =:p_dept 
AND   mapp.finyear            = :p_year
AND   mapp.finmonth         = :p_month
AND   TO_CHAR(info.JOINING_DATE,'RRRR')             = :p_year
AND   RTRIM(TO_CHAR(info.JOINING_DATE,'Month')) = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   mapp.latehr BETWEEN 0 AND 15
AND   info.cardno                = mapp.cardno
AND   info.SECTIONNM      LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION   LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.WORKERTYPE  LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.FLOORNO          LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.MACHINENO      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                  LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                     LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.cardno                LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)  
GROUP BY info.cardno,info.empname,info.lineno,info.SECTIONNM
ORDER BY info.SECTIONNM,info.lineno,info.cardno ASC
)b,
(SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM, NVL(COUNT(info.cardno),0) tweenty
FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
WHERE info.company       = :p_company 
AND   mapp.company        = :p_com
AND   info.DEPARTMENTNM    =:p_dept 
AND   mapp.finyear           = :p_year
AND   mapp.finmonth        = :p_month
AND   TO_CHAR(info.JOINING_DATE,'RRRR')              = :p_year
AND   RTRIM(TO_CHAR(info.JOINING_DATE,'Month')) = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   mapp.latehr BETWEEN 16 AND 20
AND   info.cardno              = mapp.cardno
AND   info.SECTIONNM      LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION   LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.WORKERTYPE  LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.FLOORNO          LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.MACHINENO      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                  LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                     LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.cardno                LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)  
GROUP BY info.cardno,info.empname,info.lineno,info.SECTIONNM
ORDER BY info.SECTIONNM,info.lineno,info.cardno ASC
)c,
(SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM, NVL(COUNT(info.cardno),0) thirty
FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
WHERE info.company       = :p_company 
AND   mapp.company        = :p_com
AND   info.DEPARTMENTNM    =:p_dept 
AND   mapp.finyear           = :p_year
AND   mapp.finmonth        = :p_month
AND   TO_CHAR(info.JOINING_DATE,'RRRR')              = :p_year
AND   RTRIM(TO_CHAR(info.JOINING_DATE,'Month')) = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   mapp.latehr BETWEEN 21 AND 30
AND   info.cardno             = mapp.cardno
AND   info.SECTIONNM      LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION   LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.WORKERTYPE  LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.FLOORNO          LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.MACHINENO      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                  LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                     LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.cardno                LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)   
GROUP BY info.cardno,info.empname,info.lineno,info.SECTIONNM
ORDER BY info.SECTIONNM,info.lineno,info.cardno ASC
)d,
(SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM, NVL(COUNT(info.cardno),0) forty
FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
WHERE info.company      = :p_company 
AND   mapp.company       = :p_com
AND   info.DEPARTMENTNM  = :p_dept 
AND   mapp.finyear           = :p_year
AND   mapp.finmonth        = :p_month
AND   TO_CHAR(info.JOINING_DATE,'RRRR')              = :p_year
AND   RTRIM(TO_CHAR(info.JOINING_DATE,'Month')) = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   mapp.latehr            >= 31
AND   info.cardno            = mapp.cardno
AND   info.SECTIONNM      LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION   LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.WORKERTYPE  LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.FLOORNO          LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.MACHINENO      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                  LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                     LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.cardno                LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)   
GROUP BY info.cardno,info.empname,info.lineno,info.SECTIONNM
ORDER BY info.SECTIONNM,info.lineno,info.cardno ASC
)e
WHERE a.cardno = b.cardno (+)
AND   a.cardno = c.cardno (+)
AND   a.cardno = d.cardno (+)
AND   a.cardno = e.cardno (+)




SELECT a.cardno, a.empname, a.lineno, a.sectionnm, a.totalcnt, 
               b.fifteen, c.tweenty , d.thirty,  e.forty, a.designation
FROM 
(SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM,info.designation, NVL(COUNT(info.cardno),0) totalcnt
FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info ,TB_IDCARD_MULTIPLE mul
WHERE info.company       = :p_company 
AND   mapp.company        = :p_com
AND   info.company           = mul.company
AND   info.DEPARTMENTNM = :p_dept 
AND   mapp.finyear            = :p_year
AND   mapp.finmonth         = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   mul.USER_NAME   = :p_user
AND   info.cardno              = mapp.cardno
AND   info.cardno              = mul.cardno
GROUP BY info.cardno,info.empname,info.lineno,info.SECTIONNM,info.designation
ORDER BY info.SECTIONNM,info.lineno,info.cardno ASC
)a,
(SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM, NVL(COUNT(info.cardno),0) fifteen
FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info ,TB_IDCARD_MULTIPLE mul
WHERE info.company       = :p_company 
AND   mapp.company        = :p_com
AND   info.company           = mul.company
AND   info.DEPARTMENTNM = :p_dept 
AND   mapp.finyear            = :p_year
AND   mapp.finmonth         = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   mapp.latehr BETWEEN 0 AND 15
AND   mul.USER_NAME    = :p_user
AND   info.cardno               = mapp.cardno
AND   info.cardno               = mul.cardno
GROUP BY info.cardno,info.empname,info.lineno,info.SECTIONNM
ORDER BY info.SECTIONNM,info.lineno,info.cardno ASC
)b,
(SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM, NVL(COUNT(info.cardno),0) tweenty
FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info ,TB_IDCARD_MULTIPLE mul
WHERE info.company       = :p_company 
AND   mapp.company        = :p_com
AND   info.company          = mul.company
AND   info.DEPARTMENTNM = :p_dept 
AND   mapp.finyear           = :p_year
AND   mapp.finmonth        = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   mapp.latehr BETWEEN 16 AND 20
AND   mul.USER_NAME  = :p_user
AND   info.cardno             = mapp.cardno
AND   info.cardno             = mul.cardno
GROUP BY info.cardno,info.empname,info.lineno,info.SECTIONNM
ORDER BY info.SECTIONNM,info.lineno,info.cardno ASC
)c,
(SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM, NVL(COUNT(info.cardno),0) thirty
FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info ,TB_IDCARD_MULTIPLE mul
WHERE info.company     = :p_company 
AND   mapp.company      = :p_com
AND   info.company         = mul.company
AND   info.DEPARTMENTNM = :p_dept 
AND   mapp.finyear          = :p_year
AND   mapp.finmonth       = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   mapp.latehr BETWEEN 21 AND 30
AND   mul.USER_NAME = :p_user
AND   info.cardno            = mapp.cardno
AND   info.cardno            = mul.cardno
GROUP BY info.cardno,info.empname,info.lineno,info.SECTIONNM
ORDER BY info.SECTIONNM,info.lineno,info.cardno ASC
)d,
(SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM, NVL(COUNT(info.cardno),0) forty
FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info ,TB_IDCARD_MULTIPLE mul
WHERE info.company     = :p_company 
AND   mapp.company      = :p_com
AND   info.company         = mul.company
AND   info.DEPARTMENTNM = :p_dept 
AND   mapp.finyear          = :p_year
AND   mapp.finmonth       = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   mapp.latehr           >= 31
AND   mul.USER_NAME = :p_user
AND   info.cardno            = mapp.cardno
AND   info.cardno            = mul.cardno
GROUP BY info.cardno,info.empname,info.lineno,info.SECTIONNM
ORDER BY info.SECTIONNM,info.lineno,info.cardno ASC
)e
WHERE a.cardno = b.cardno (+)
AND   a.cardno = c.cardno (+)
AND   a.cardno = d.cardno (+)
AND   a.cardno = e.cardno (+)





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