SELECT per.empname,per.departmentnm,per.lineno,per.sectionnm,per.designation,
               ot.cardno, ot.d1, ot.d2, ot.d3, ot.d4, ot.d5, ot.d6, ot.d7, ot.d8, ot.d9, ot.d10, ot.d11, ot.d12, ot.d13, ot.d14, ot.d15, 
               ot.d16, ot.d17, ot.d18, ot.d19, ot.d20, ot.d21, ot.d22, ot.d23, ot.d24, ot.d25, ot.d26, ot.d27, ot.d28, ot.d29, ot.d30, 
               ot.d31, ot.total_otamt, ot.company, ot.finmonth, ot.finyear
FROM  tb_clr_month_ot_detail  ot, tb_personal_info per 
WHERE per.company  = :p_company 
AND   per.company     = ot.company 
AND   ot.finyear            = :p_year
AND   ot.finmonth         = :p_month
AND   ot.cardno           =  per.cardno 
AND   per.departmentnm    LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND   per.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   per.designation        LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.workertype         LIKE DECODE(NVL(:p_wtype,'all'),'all','%',:p_wtype) 
AND   per.floorno                LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno) 
AND   per.machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   per.lineno                 LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)  
AND   per.shift                    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   per.gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.cardno               LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)  
AND   per.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY per.lineno,per.cardno ASC