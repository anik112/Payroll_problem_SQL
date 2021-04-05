SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM,info.designation,
               info.joining_date,info.DEPARTMENTNM, info.shift, info.GROSSSALARY, info.WORKERTYPE
FROM  tb_personal_info info  
WHERE info.company   = :p_company 
AND   info.active            = 0
AND   info.joining_date <=:p_date
AND   info.departmentnm   LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND   info.sectionnm         LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation       LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype        LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno               LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno        LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                   LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.gender              LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   info.cardno NOT IN (SELECT mapp.cardno 
                                      FROM  tb_data_master mapp 
                                      WHERE mapp.company       = :p_com 
                                      AND   mapp.finyear               = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'rrrr')
                                      AND   mapp.finmonth            = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
                                      AND   mapp.pdate                = :p_date
                                      AND   mapp.sectionnm         LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
                                      AND   mapp.lineno                LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
                                      AND   mapp.shift                   LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
                                      AND   mapp.cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
									  )
ORDER BY info.cardno ASC
