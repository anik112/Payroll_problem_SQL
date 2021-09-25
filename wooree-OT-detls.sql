SELECT per.sectionnm, COUNT(ot.cardno)total_emp,  SUM(ot.total_othr)total_ot_hr, MIN(ot.total_othr)min_ot_hr_main, MAX(ot.total_othr)max_ot_hr_main
FROM   TB_CLR_MONTH_OT_DETAIL ot, TB_PERSONAL_INFO per 
WHERE  per.company  = :p_company 
AND    per.company  = ot.company
AND    ot.finyear        = :p_year 
AND    ot.finmonth     = :p_month 
AND    ot.cardno       = per.cardno 
AND    per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.designation     LIKE DECODE(NVL(:p_design,'all'),'all','%',:p_design) 
AND    per.workertype      LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND    per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cardno            LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
GROUP BY per.sectionnm
ORDER BY per.sectionnm ASC



SELECT per.sectionnm sectionnm_sub, COUNT(ot.cardno)total_emp_sub,  SUM(ot.total_othr)total_ot_hr_sub,  ROUND((SUM(ot.total_othr)/COUNT(ot.cardno)),2)avg_ot_hr, 
              MIN(ot.total_othr)min_othr,  MAX(ot.total_othr)max_othr
FROM   TB_CLR_MONTH_OT_DETAIL ot, TB_PERSONAL_INFO per 
WHERE  per.company  = :p_company 
AND    per.company  = ot.company
AND    ot.finyear      = :p_year 
AND    ot.finmonth     = :p_month 
AND    ot.total_othr >= :p_novalue
AND    ot.cardno    = per.cardno 
AND    per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.designation     LIKE DECODE(NVL(:p_design,'all'),'all','%',:p_design) 
AND    per.workertype      LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND    per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cardno            LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
GROUP BY per.sectionnm
ORDER BY per.sectionnm ASC




SELECT per.empname,per.departmentnm,per.lineno,per.sectionnm,
               ot.cardno, ot.d1, ot.d2, ot.d3, ot.d4, ot.d5, ot.d6, ot.d7, ot.d8, ot.d9, ot.d10, ot.d11, ot.d12, ot.d13, ot.d14, ot.d15, 
               ot.d16, ot.d17, ot.d18, ot.d19, ot.d20, ot.d21, ot.d22, ot.d23, ot.d24, ot.d25, ot.d26, ot.d27, ot.d28, ot.d29, ot.d30, 
               ot.d31,  ot.company, ot.finmonth, ot.finyear, ot.total_othr
FROM   TB_CLR_MONTH_OT_DETAIL ot, TB_PERSONAL_INFO per 
WHERE  per.company   = :p_company 
AND    per.company    = ot.company 
AND    ot.finyear          = :p_year 
AND    ot.finmonth       = :p_month 
AND   TO_CHAR(per.joining_date,'RRRR')         =:p_year
AND   RTRIM(TO_CHAR(per.joining_date,'Month')) =:p_month
AND    ot.cardno         =  per.cardno 
AND    per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.sectionnm   LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.designation LIKE DECODE(NVL(:p_design,'all'),'all','%',:p_design) 
AND    per.workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND      per.floorno LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND      per.machineno LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cardno    LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.active  LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY per.lineno,per.cardno ASC



SELECT per.empname,per.departmentnm,per.lineno,per.sectionnm,
               ot.cardno, ot.d1, ot.d2, ot.d3, ot.d4, ot.d5, ot.d6, ot.d7, ot.d8, ot.d9, ot.d10, ot.d11, ot.d12, ot.d13, ot.d14, ot.d15, 
               ot.d16, ot.d17, ot.d18, ot.d19, ot.d20, ot.d21, ot.d22, ot.d23, ot.d24, ot.d25, ot.d26, ot.d27, ot.d28, ot.d29, ot.d30, 
               ot.d31,  ot.company, ot.finmonth, ot.finyear, ot.total_othr
FROM   TB_CLR_MONTH_OT_DETAIL ot, TB_PERSONAL_INFO per 
WHERE  per.company   = :p_company 
AND    per.company    = ot.company 
AND    ot.finyear          = :p_year 
AND    ot.finmonth       = :p_month 
AND   TO_CHAR(per.resignation_date,'RRRR')         =:p_year
AND   RTRIM(TO_CHAR(per.resignation_date,'Month')) =:p_month
AND    ot.cardno         =  per.cardno 
AND    per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.sectionnm   LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.designation LIKE DECODE(NVL(:p_design,'all'),'all','%',:p_design) 
AND    per.workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND      per.floorno LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND      per.machineno LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cardno    LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.active  LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY per.lineno,per.cardno ASC



SELECT per.empname,per.departmentnm,per.lineno,per.sectionnm,
               ot.cardno, ot.d1, ot.d2, ot.d3, ot.d4, ot.d5, ot.d6, ot.d7, ot.d8, ot.d9, ot.d10, ot.d11, ot.d12, ot.d13, ot.d14, ot.d15, 
               ot.d16, ot.d17, ot.d18, ot.d19, ot.d20, ot.d21, ot.d22, ot.d23, ot.d24, ot.d25, ot.d26, ot.d27, ot.d28, ot.d29, ot.d30, 
               ot.d31,  ot.company, ot.finmonth, ot.finyear, ot.total_othr
FROM   TB_CLR_MONTH_OT_DETAIL ot, TB_PERSONAL_INFO per 
WHERE  per.company   = :p_company 
AND    per.company    = ot.company 
AND    ot.finyear          = :p_year 
AND    ot.finmonth       = :p_month 
AND    ot.cardno         =  per.cardno 
AND    per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.designation     LIKE DECODE(NVL(:p_design,'all'),'all','%',:p_design) 
AND    per.workertype      LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND    per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cardno             LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY per.lineno, per.cardno ASC




SELECT per.empname,per.departmentnm,per.lineno,per.sectionnm, per.otorg,
               ot.cardno, ot.d1, ot.d2, ot.d3, ot.d4, ot.d5, ot.d6, ot.d7, ot.d8, ot.d9, ot.d10, ot.d11, ot.d12, ot.d13, ot.d14, ot.d15, 
               ot.d16, ot.d17, ot.d18, ot.d19, ot.d20, ot.d21, ot.d22, ot.d23, ot.d24, ot.d25, ot.d26, ot.d27, ot.d28, ot.d29, ot.d30, 
               ot.d31,  ot.company, ot.finmonth, ot.finyear, ot.total, per.grosssalary,  per.workertype,
               ot.d1_amt, ot.d2_amt,  ot.d3_amt, ot.d4_amt, ot.d5_amt, ot.d6_amt, ot.d7_amt, ot.d8_amt, ot.d9_amt, ot.d10_amt, 
               ot.d11_amt, ot.d12_amt, ot.d13_amt, ot.d14_amt, ot.d15_amt, ot.d16_amt, ot.d17_amt, ot.d18_amt, ot.d19_amt, 
               ot.d20_amt, ot.d21_amt, ot.d22_amt, ot.d23_amt, ot.d24_amt, ot.d25_amt, ot.d26_amt, ot.d27_amt, ot.d28_amt, 
               ot.d29_amt, ot.d30_amt, ot.d31_amt, ot.total_othr, ot.total_otamt
FROM   TB_CLR_MONTH_OT_DETAIL ot, TB_PERSONAL_INFO per 
WHERE  per.company   = :p_company 
AND    per.company    = ot.company 
AND    ot.finyear          = :p_year 
AND    ot.finmonth       = :p_month 
AND    TO_CHAR(per.joining_date,'RRRR')         =:p_year
AND    RTRIM(TO_CHAR(per.joining_date,'Month')) =:p_month
AND    ot.cardno         =  per.cardno 
AND    per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.designation     LIKE DECODE(NVL(:p_design,'all'),'all','%',:p_design) 
AND    per.workertype      LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND    per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cardno             LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)  
ORDER BY per.lineno,per.cardno ASC



SELECT per.empname,per.departmentnm,per.lineno,per.sectionnm, per.otorg,
               ot.cardno, ot.d1, ot.d2, ot.d3, ot.d4, ot.d5, ot.d6, ot.d7, ot.d8, ot.d9, ot.d10, ot.d11, ot.d12, ot.d13, ot.d14, ot.d15, 
               ot.d16, ot.d17, ot.d18, ot.d19, ot.d20, ot.d21, ot.d22, ot.d23, ot.d24, ot.d25, ot.d26, ot.d27, ot.d28, ot.d29, ot.d30, 
               ot.d31,  ot.company, ot.finmonth, ot.finyear, per.grosssalary,  per.workertype,
               ot.d1_amt, ot.d2_amt,  ot.d3_amt, ot.d4_amt, ot.d5_amt, ot.d6_amt, ot.d7_amt, ot.d8_amt, ot.d9_amt, ot.d10_amt, 
               ot.d11_amt, ot.d12_amt, ot.d13_amt, ot.d14_amt, ot.d15_amt, ot.d16_amt, ot.d17_amt, ot.d18_amt, ot.d19_amt, 
               ot.d20_amt, ot.d21_amt, ot.d22_amt, ot.d23_amt, ot.d24_amt, ot.d25_amt, ot.d26_amt, ot.d27_amt, ot.d28_amt, 
               ot.d29_amt, ot.d30_amt, ot.d31_amt, ot.total_othr, ot.total_otamt
FROM   TB_CLR_MONTH_OT_DETAIL ot, TB_PERSONAL_INFO per 
WHERE  per.company   = :p_company 
AND    per.company    = ot.company 
AND    ot.finyear          = :p_year 
AND    ot.finmonth       = :p_month 
AND   TO_CHAR(per.resignation_date,'RRRR')         =:p_year
AND   RTRIM(TO_CHAR(per.resignation_date,'Month')) =:p_month
AND    ot.cardno         =  per.cardno 
AND    per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.designation     LIKE DECODE(NVL(:p_design,'all'),'all','%',:p_design) 
AND    per.workertype      LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND    per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cardno             LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)  
ORDER BY per.lineno,per.cardno ASC




SELECT per.empname,per.departmentnm,per.lineno,per.sectionnm, per.otorg,
               ot.cardno, ot.d1, ot.d2, ot.d3, ot.d4, ot.d5, ot.d6, ot.d7, ot.d8, ot.d9, ot.d10, ot.d11, ot.d12, ot.d13, ot.d14, ot.d15, 
               ot.d16, ot.d17, ot.d18, ot.d19, ot.d20, ot.d21, ot.d22, ot.d23, ot.d24, ot.d25, ot.d26, ot.d27, ot.d28, ot.d29, ot.d30, 
               ot.d31,  ot.company, ot.finmonth, ot.finyear, per.grosssalary,  per.workertype,
               ot.d1_amt, ot.d2_amt,  ot.d3_amt, ot.d4_amt, ot.d5_amt, ot.d6_amt, ot.d7_amt, ot.d8_amt, ot.d9_amt, ot.d10_amt, 
               ot.d11_amt, ot.d12_amt, ot.d13_amt, ot.d14_amt, ot.d15_amt, ot.d16_amt, ot.d17_amt, ot.d18_amt, ot.d19_amt, 
               ot.d20_amt, ot.d21_amt, ot.d22_amt, ot.d23_amt, ot.d24_amt, ot.d25_amt, ot.d26_amt, ot.d27_amt, ot.d28_amt, 
               ot.d29_amt, ot.d30_amt, ot.d31_amt, ot.total_othr, ot.total_otamt
FROM   TB_CLR_MONTH_OT_DETAIL ot, TB_PERSONAL_INFO per 
WHERE  per.company   = :p_company 
AND    per.company    = ot.company 
AND    ot.finyear          = :p_year 
AND    ot.finmonth       = :p_month 
AND    ot.cardno         =  per.cardno 
AND    per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.designation     LIKE DECODE(NVL(:p_design,'all'),'all','%',:p_design) 
AND    per.workertype      LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND    per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cardno             LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.lineno,per.cardno ASC




SELECT per.sectionnm, COUNT(ot.cardno)total_emp,  SUM(ot.total_othr)total_ot_hr, MIN(ot.total_othr)min_ot_hr_main, MAX(ot.total_othr)max_ot_hr_main
FROM   TB_CLR_MONTH_OT_DETAIL ot, TB_PERSONAL_INFO per 
WHERE  per.company  = :p_company 
AND    per.company  = ot.company
AND    ot.finyear        = :p_year 
AND    ot.finmonth     = :p_month 
AND    ot.cardno       = per.cardno 
AND    per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.designation     LIKE DECODE(NVL(:p_design,'all'),'all','%',:p_design) 
AND    per.workertype      LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND    per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cardno             LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY per.sectionnm
ORDER BY per.sectionnm ASC





SELECT per.empname,per.lineno,per.SECTIONNM,per.DEPARTMENTNM,
       ot.CARDNO, ot.D1, ot.D2, ot.D3, ot.D4, ot.D5, ot.D6, ot.D7, ot.D8, ot.D9, ot.D10, ot.D11, ot.D12, ot.D13, ot.D14, ot.D15, 
       ot.D16, ot.D17, ot.D18, ot.D19, ot.D20, ot.D21, ot.D22, ot.D23, ot.D24, ot.D25, ot.D26, ot.D27, ot.D28, ot.D29, ot.D30, 
       ot.D31, ot.COMPANY, ot.finMONTH, ot.finYEAR
FROM   TB_CLR_MONTH_ATTN_DETAIL ot, TB_PERSONAL_INFO per 
WHERE  per.company  = :p_company 
AND      per.company      = ot.company
AND    ot.finyear            = :p_year 
AND    ot.finmonth         = :p_month 
AND      TO_CHAR(per.RESIGNATION_DATE,'RRRR')         =:p_year
AND      RTRIM(TO_CHAR(per.RESIGNATION_DATE,'Month')) =:p_month
AND    ot.cardno           =  per.cardno 
AND    per.DEPARTMENTNM LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.SECTIONNM          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.DESIGNATION       LIKE DECODE(NVL(:p_design,'all'),'all','%',:p_design) 
AND    per.WORKERTYPE      LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND    per.lineno                      LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cardno                    LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.ACTIVE                  LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY per.lineno,per.cardno ASC