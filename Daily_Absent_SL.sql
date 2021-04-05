SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM,info.designation,
       info.joining_date,info.DEPARTMENTNM, info.shift, info.GROSSSALARY, info.WORKERTYPE
FROM  tb_personal_info info
WHERE info.company = :p_company 
AND   info.active          = 0
AND   info.joining_date <=:p_date
AND   info.departmentnm IN (SELECT item_name FROM tb_setup_item WHERE company =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno NOT IN (SELECT mapp.cardno 
                                            FROM  tb_data_master mapp 
                                            WHERE mapp.company  =:p_com 
                                           AND   mapp.finyear          = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'rrrr')
                                           AND   mapp.finmonth       = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
                                           AND   mapp.pdate            =:p_date
		  )		
UNION
SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM,info.designation,
       info.joining_date,info.DEPARTMENTNM, info.shift, info.GROSSSALARY, info.WORKERTYPE
FROM  tb_personal_info info
WHERE info.company      = :p_company 
AND   info.active       = 0
AND   info.joining_date <=:p_date
AND   info.SECTIONNM    IN (SELECT item_name FROM tb_setup_item WHERE company =:p_company  AND USER_NAME = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender       LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno NOT IN (SELECT mapp.cardno 
                                           FROM  tb_data_master mapp 
                                           WHERE mapp.company =:p_com 
                                           AND   mapp.finyear         = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'rrrr')
                                           AND   mapp.finmonth      = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
                                           AND   mapp.pdate          =:p_date
		  )		
UNION
SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM,info.designation,
       info.joining_date,info.DEPARTMENTNM, info.shift, info.GROSSSALARY, info.WORKERTYPE
FROM  tb_personal_info info
WHERE info.company  = :p_company 
AND   info.active           = 0
AND   info.joining_date <=:p_date
AND   info.designation  IN (SELECT item_name FROM tb_setup_item WHERE company =:p_company  AND USER_NAME = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender        LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno NOT IN (SELECT mapp.cardno 
                                           FROM  tb_data_master mapp 
                                           WHERE mapp.company =:p_com 
                                           AND   mapp.finyear         = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'rrrr')
                                           AND   mapp.finmonth      = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
                                           AND   mapp.pdate          =:p_date
		  )
UNION
SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM,info.designation,
       info.joining_date,info.DEPARTMENTNM, info.shift, info.GROSSSALARY, info.WORKERTYPE
FROM  tb_personal_info info
WHERE info.company = :p_company 
AND   info.active          = 0
AND   info.joining_date <=:p_date
AND   info.WORKERTYPE   IN  (SELECT item_name FROM tb_setup_item WHERE company =:p_company  AND USER_NAME = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender                  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno NOT IN (SELECT mapp.cardno 
                                           FROM  tb_data_master mapp 
                                           WHERE mapp.company    =:p_com 
                                           AND   mapp.finyear         = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'rrrr')
                                           AND   mapp.finmonth      = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
                                           AND   mapp.pdate           =:p_date
		  )		
UNION
SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM,info.designation,
       info.joining_date,info.DEPARTMENTNM, info.shift, info.GROSSSALARY, info.WORKERTYPE
FROM  tb_personal_info info
WHERE info.company  = :p_company 
AND   info.active          = 0
AND   info.joining_date <=:p_date
AND   info.FLOORNO      IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND USER_NAME = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno NOT IN (SELECT mapp.cardno 
                                           FROM  tb_data_master mapp 
                                           WHERE mapp.company =:p_com 
                                           AND   mapp.finyear         = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'rrrr')
                                           AND   mapp.finmonth      = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
                                           AND   mapp.pdate          =:p_date
		  )	
UNION
SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM,info.designation,
       info.joining_date,info.DEPARTMENTNM, info.shift, info.GROSSSALARY, info.WORKERTYPE
FROM  tb_personal_info info
WHERE info.company  = :p_company 
AND   info.active          = 0
AND   info.joining_date <=:p_date
AND   info.MACHINENO    IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND USER_NAME = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno NOT IN (SELECT mapp.cardno 
                                           FROM  tb_data_master mapp 
                                           WHERE mapp.company =:p_com 
                                           AND   mapp.finyear         = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'rrrr')
                                           AND   mapp.finmonth      = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
                                           AND   mapp.pdate          =:p_date
		 )		
UNION
SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM,info.designation,
       info.joining_date,info.DEPARTMENTNM, info.shift, info.GROSSSALARY, info.WORKERTYPE
FROM  tb_personal_info info
WHERE info.company = :p_company 
AND   info.active          = 0
AND   info.joining_date <=:p_date
AND   info.LINENO       IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND USER_NAME = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender         LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno NOT IN (SELECT mapp.cardno 
                                           FROM  tb_data_master mapp 
                                           WHERE mapp.company =:p_com 
                                           AND   mapp.finyear         = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'rrrr')
                                           AND   mapp.finmonth      = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
                                           AND   mapp.pdate          =:p_date
		 )	
UNION
SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM,info.designation,
       info.joining_date,info.DEPARTMENTNM, info.shift, info.GROSSSALARY, info.WORKERTYPE
FROM  tb_personal_info info
WHERE info.company  = :p_company 
AND   info.active           = 0
AND   info.joining_date <=:p_date
AND   info.SHIFT         IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND USER_NAME = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender        LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno NOT IN (SELECT mapp.cardno 
                                           FROM  tb_data_master mapp 
                                           WHERE mapp.company    =:p_com 
                                           AND   mapp.finyear         = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'rrrr')
                                           AND   mapp.finmonth      = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
                                           AND   mapp.pdate           =:p_date
		)