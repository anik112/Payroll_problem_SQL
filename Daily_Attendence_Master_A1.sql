SELECT departmentnm, sectionnm, lineno, cardno, empname, joining_date, 
              designation, grosssalary, shift, workertype, company, gender,wday,
              otorg, otcom, religion, enmname_bangla, designation_bangla
FROM   tb_personal_info	  
WHERE  company   = :p_company 
AND    active            = 0
AND    departmentnm    LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND    sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    lineno                 LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND    cardno               LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    shift                    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    designation        LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    workertype         LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND    floorno                LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
ORDER BY inramt ASC