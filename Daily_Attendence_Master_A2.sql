SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime, mapp.duration,mapp.latestatus,info.departmentnm,
              info.sectionnm, info.shift,  info.joining_date,  info.designation, mapp.latehr, mapp.earlyhr, (mapp.otmin/60)othr,  
              mapp.earlystatus, mapp.isln, mapp.lateded, mapp.earlyded, mapp.tf
FROM  tb_data_master mapp,tb_personal_info info 
WHERE  info.company   = :p_company 
AND    mapp.company    = :p_com
AND    mapp.finyear        = TO_CHAR(TO_DATE(:p_date - 1,'dd/mm/rrrr'),'RRRR')
AND    mapp.finmonth     = RTRIM(TO_CHAR(TO_DATE(:p_date - 1,'dd/mm/rrrr'),'Month'))
AND    mapp.pdate         = (:p_date - 1)
AND    info.joining_date  <=  (:p_date -  1)
AND    info.cardno          = mapp.cardno
AND    info.cardno IN ( SELECT INFO.CARDNO 
                                     FROM   tb_personal_info info
                                     WHERE  info.company  = :p_company
                                     AND    info.active           = 0
                                     AND    info.cardno NOT IN (SELECT mapp.CARDNO FROM  tb_data_master mapp 
						   WHERE  mapp.company  = :p_com
						   AND    mapp.finyear          = TO_CHAR(:p_date,'RRRR')
						   AND    mapp.finmonth       = RTRIM(TO_CHAR(:p_date,'Month'))
						   AND    mapp.pdate            = :p_date
						   ) 
                                     AND    info.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
                                     AND    info.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
                                     AND    info.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
                                     AND    info.workertype           LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
                                     AND    info.floorno                 LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
                                     AND    info.machineno           LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
                                     AND    info.lineno                   LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
                                     AND    info.shift                      LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
                                     AND    info.gender                 LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
                                     )
AND    info.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND    info.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    info.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    info.workertype           LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND    info.floorno                 LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    info.machineno           LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    info.lineno                   LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND    info.shift                      LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    info.gender                 LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.cardno                 LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
ORDER BY info.lineno,info.cardno ASC


-----------------------



SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime, mapp.duration,mapp.latestatus,info.departmentnm,
              info.sectionnm, info.shift,  info.joining_date,  info.designation, mapp.latehr, mapp.earlyhr, (mapp.otmin/60)othr,  
              mapp.earlystatus, mapp.isln, mapp.lateded, mapp.earlyded, mapp.tf
FROM  tb_data_master mapp,tb_personal_info info 
WHERE  info.company   = :p_company 
AND    mapp.company    = :p_com
AND    mapp.finyear        = TO_CHAR(TO_DATE(:p_date - 1,'dd/mm/rrrr'),'RRRR')
AND    mapp.finmonth     = RTRIM(TO_CHAR(TO_DATE(:p_date - 1,'dd/mm/rrrr'),'Month'))
AND    mapp.pdate         = (:p_date + 1)
AND    info.joining_date  <=  (:p_date +  1)
AND    info.cardno          = mapp.cardno
AND    info.cardno IN ( SELECT INFO.CARDNO 
                                     FROM   tb_personal_info info
                                     WHERE  info.company  = :p_company
                                     AND    info.active           = 0
                                     AND    info.cardno NOT IN (SELECT mapp.CARDNO FROM  tb_data_master mapp 
						   WHERE  mapp.company  = :p_com
						   AND    mapp.finyear          = TO_CHAR(:p_date,'RRRR')
						   AND    mapp.finmonth       = RTRIM(TO_CHAR(:p_date,'Month'))
						   AND    mapp.pdate            = :p_date
						   ) 
                                     AND    info.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
                                     AND    info.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
                                     AND    info.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
                                     AND    info.workertype           LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
                                     AND    info.floorno                 LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
                                     AND    info.machineno           LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
                                     AND    info.lineno                   LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
                                     AND    info.shift                      LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
                                     AND    info.gender                 LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
                                     )
AND    info.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND    info.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    info.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    info.workertype           LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND    info.floorno                 LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    info.machineno           LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    info.lineno                   LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND    info.shift                      LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    info.gender                 LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.cardno                 LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
ORDER BY info.lineno,info.cardno ASC