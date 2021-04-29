SELECT per.empname,per.DEPARTMENTNM,per.lineno,per.SECTIONNM,per.designation,
               ot.CARDNO, ot.D1, ot.D2, ot.D3, ot.D4, ot.D5, ot.D6, ot.D7, ot.D8, ot.D9, ot.D10, ot.D11, ot.D12, ot.D13, ot.D14, ot.D15, 
               ot.D16, ot.D17, ot.D18, ot.D19, ot.D20, ot.D21, ot.D22, ot.D23, ot.D24, ot.D25, ot.D26, ot.D27, ot.D28, ot.D29, ot.D30, 
               ot.D31, ot.TOTAL_OTAMT, ot.COMPANY, ot.FINMONTH, ot.FINYEAR
FROM   TB_CLR_MONTH_OT_DETAIL ot, TB_PERSONAL_INFO per 
WHERE  per.company    = :p_company 
AND   per.company         = ot.COMPANY 
AND   ot.finyear               = :p_year
AND   ot.finmonth            = :p_month
AND   ot.cardno              =  per.cardno 
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