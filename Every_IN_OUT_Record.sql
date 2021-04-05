SELECT DISTINCT mov.ptime ,info.cardno,info.empname,info.designation,
               info.lineno,info.joining_date,info.departmentnm,info.sectionnm
FROM   TB_DATA_MOVEMENT mov,TB_PERSONAL_INFO info
WHERE  info.company = :p_company 
AND    mov.company    = :p_com 
AND    mov.pdate          = :p_date 
AND    mov.cardno        = info.cardno 
AND    info.departmentnm    LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND    info.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    info.designation        LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    info.workertype         LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND    info.floorno                LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    info.machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    info.lineno                 LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND    info.shift                    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND    info.gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.cardno               LIKE DECODE(NVL(:cardno,'all'),'all','%',:cardno)
ORDER BY info.lineno, info.cardno, mov.ptime ASC