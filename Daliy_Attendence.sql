SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, info.shift,
               mapp.latehr, mapp.earlyhr, (mapp.otmin/60)othr, mapp.earlystatus, mapp.isln, mapp.lateded, mapp.earlyded, mapp.tf
FROM  tb_data_master mapp,tb_personal_info info 
WHERE  info.company= :p_company 
AND    mapp.company = :p_com
AND    mapp.finyear     = TO_CHAR(:p_date,'RRRR')
AND    mapp.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
AND    mapp.pdate      = :p_date 
AND    info.cardno       = mapp.cardno
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


-----------------

SELECT a.present_w1, b.present_w2, c.present_w3, d.present_ap, total.present_total,
              a1.emp_w1, b1.emp_w2, c1.emp_w3, d1.emp_ap, total_emp.emp_total,
             (a1.emp_w1 - a.present_w1)absent_w1, (b1.emp_w2 - b.present_w2)absent_w2,
             (c1.emp_w3 - c.present_w3)absent_w3, (d1.emp_ap - d.present_ap)absent_ap,
             (total_emp.emp_total - total.present_total)absent_total	     
FROM  							 
(SELECT NVL(COUNT(DISTINCT info.cardno),0)present_w1  
FROM  tb_personal_info info , tb_personal_info_other other, tb_data_master mapp 
WHERE info.company     = :p_company 
AND    mapp.company     = :p_com
AND    info.company        = other.company
AND    mapp.finyear         = TO_CHAR(:p_date,'RRRR')
AND    mapp.finmonth      = RTRIM(TO_CHAR(:p_date,'Month'))
AND    mapp.pdate          = :p_date
AND    info.joining_date   <= :p_date
AND    info.active             = 0
AND    other.performance = 'W1'
AND    info.cardno            = other.cardno
AND    mapp.cardno         = info.cardno
AND    info.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND    info.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    info.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    info.workertype           LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND    info.floorno                  LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    info.machineno            LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    info.lineno                    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND    info.shift                       LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    info.gender                  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.cardno                  LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
)a,
(SELECT NVL(COUNT(DISTINCT info.cardno),0)present_w2
FROM  tb_personal_info info , tb_personal_info_other other, tb_data_master mapp 
WHERE info.company    = :p_company 
AND   mapp.company     = :p_com
AND   info.company        = other.company
AND   mapp.finyear         = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth      = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate           = :p_date
AND   info.joining_date    <= :p_date
AND   info.active             = 0
AND   other.performance = 'W2'
AND   info.cardno            = other.cardno
AND   mapp.cardno         = info.cardno
AND   info.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   info.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype           LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno                  LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno            LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                       LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.gender                  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno                  LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
)b,
(SELECT NVL(COUNT(DISTINCT info.cardno),0)present_w3
FROM  tb_personal_info info , tb_personal_info_other other, tb_data_master mapp 
WHERE info.company    = :p_company 
AND   mapp.company      = :p_com
AND   info.company         = other.company
AND   mapp.finyear          = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth       = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate           = :p_date
AND   info.joining_date    <= :p_date
AND   info.active             = 0
AND   other.performance = 'W3'
AND   info.cardno            = other.cardno
AND   mapp.cardno         =  info.cardno
AND   info.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   info.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype           LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno                  LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno            LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                       LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.gender                  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno                  LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
)c,
(SELECT NVL(COUNT(DISTINCT info.cardno),0)present_ap
FROM  tb_personal_info info , tb_personal_info_other other, tb_data_master mapp 
WHERE info.company    = :p_company 
AND   mapp.company     = :p_com
AND   info.company        = other.company
AND   mapp.finyear         = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth       = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate           = :p_date
AND   info.joining_date    <= :p_date
AND   info.active             = 0
AND   other.performance = 'AP'
AND   info.cardno            = other.cardno
AND   mapp.cardno         =  info.cardno
AND   info.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   info.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype           LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno                  LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno            LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                       LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.gender                  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno                  LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
)d,
(SELECT NVL(COUNT(DISTINCT info.cardno),0)present_total
FROM  tb_personal_info info , tb_personal_info_other other, tb_data_master mapp 
WHERE info.company =:p_company 
AND   mapp.company  = :p_com
AND   info.company     = other.company
AND   mapp.finyear      = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth   = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate       = :p_date
AND   info.joining_date <= :p_date
AND   info.active          = 0
AND   other.performance IN ('W1','W2','W3','AP')
AND   info.cardno         = other.cardno
AND   mapp.cardno      = info.cardno
AND   info.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   info.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype           LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno                  LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno            LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                       LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.gender                  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno                  LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
)total,
(SELECT NVL(COUNT(DISTINCT info.cardno),0)emp_w1  
FROM  tb_personal_info info , tb_personal_info_other other 
WHERE info.company     = :p_company 
AND   info.company         = other.company
AND   info.joining_date    <= :p_date
AND   info.active             = 0
AND   other.performance = 'W1'
AND   info.cardno            = other.cardno
AND   info.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   info.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype           LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno                  LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno            LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                       LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.gender                  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno                  LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
)a1,
(SELECT NVL(COUNT(DISTINCT info.cardno),0)emp_w2
FROM  tb_personal_info info , tb_personal_info_other other 
WHERE info.company     = :p_company 
AND   info.company         = other.company
AND   info.joining_date    <= :p_date
AND   info.active               = 0
AND   other.performance  = 'W2'
AND   info.cardno             = other.cardno
AND   info.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   info.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype           LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno                  LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno            LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                       LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.gender                  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno                  LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
)b1,
(SELECT NVL(COUNT(DISTINCT info.cardno),0)emp_w3
FROM  tb_personal_info info , tb_personal_info_other other 
WHERE info.company     = :p_company 
AND   info.company         = other.company
AND   info.joining_date    <= :p_date
AND   info.active              = 0
AND   other.performance  = 'W3'
AND   info.cardno             = other.cardno
AND   info.departmentnm    LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   info.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.lineno                 LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.cardno               LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND   info.shift                   LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.designation        LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype        LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno               LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno        LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.gender              LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
)c1,
(SELECT NVL(COUNT(DISTINCT info.cardno),0)emp_ap
FROM  tb_personal_info info , tb_personal_info_other other 
WHERE info.company    = :p_company 
AND   info.company        = other.company
AND   info.joining_date   <= :p_date
AND   info.active             = 0
AND   other.performance = 'AP'
AND   info.cardno            = other.cardno
AND   info.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   info.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype           LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno                  LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno            LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                       LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.gender                  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno                  LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
)d1,
(SELECT NVL(COUNT(DISTINCT info.cardno),0)emp_total  
FROM  tb_personal_info info , tb_personal_info_other other 
WHERE info.company  = :p_company 
AND   info.company      = other.company
AND   info.joining_date <= :p_date
AND   info.active          = 0
AND   other.performance IN ('W1','W2','W3','AP')
AND   info.cardno         = other.cardno
AND   info.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   info.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype           LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno                  LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno            LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                       LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.gender                  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno                  LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
)total_emp



-----------------------------------



SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, info.shift,
               mapp.latehr, mapp.earlyhr, (mapp.otmin/60)othr, mapp.earlystatus, mapp.isln, mapp.lateded, mapp.earlyded, mapp.tf
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company= :p_company 
AND   mapp.company = :p_com
AND   mapp.finyear     = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate      = :p_date 
AND   info.cardno       = mapp.cardno
AND   info.departmentnm IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, info.shift,
               mapp.latehr, mapp.earlyhr, (mapp.otmin/60)othr, mapp.earlystatus, mapp.isln, mapp.lateded, mapp.earlyded, mapp.tf
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company= :p_company 
AND   mapp.company = :p_com
AND   mapp.finyear     = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate      = :p_date 
AND   info.cardno       = mapp.cardno
AND   info.sectionnm IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, info.shift,
               mapp.latehr, mapp.earlyhr, (mapp.otmin/60)othr, mapp.earlystatus, mapp.isln, mapp.lateded, mapp.earlyded, mapp.tf
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company= :p_company 
AND   mapp.company = :p_com
AND   mapp.finyear     = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate      = :p_date 
AND   info.cardno       = mapp.cardno
AND   info.designation IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, info.shift,
               mapp.latehr, mapp.earlyhr, (mapp.otmin/60)othr, mapp.earlystatus, mapp.isln, mapp.lateded, mapp.earlyded, mapp.tf
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company= :p_company 
AND   mapp.company = :p_com
AND   mapp.finyear     = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate      = :p_date 
AND   info.cardno       = mapp.cardno
AND   info.workertype IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, info.shift,
               mapp.latehr, mapp.earlyhr, (mapp.otmin/60)othr, mapp.earlystatus, mapp.isln, mapp.lateded, mapp.earlyded, mapp.tf
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company= :p_company 
AND   mapp.company = :p_com
AND   mapp.finyear     = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate      = :p_date 
AND   info.cardno       = mapp.cardno
AND   info.floorno IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, info.shift,
               mapp.latehr, mapp.earlyhr, (mapp.otmin/60)othr, mapp.earlystatus, mapp.isln, mapp.lateded, mapp.earlyded, mapp.tf
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company= :p_company 
AND   mapp.company = :p_com
AND   mapp.finyear     = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate      = :p_date 
AND   info.cardno       = mapp.cardno
AND   info.machineno IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, info.shift,
               mapp.latehr, mapp.earlyhr, (mapp.otmin/60)othr, mapp.earlystatus, mapp.isln, mapp.lateded, mapp.earlyded, mapp.tf
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company= :p_company 
AND   mapp.company = :p_com
AND   mapp.finyear     = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate      = :p_date 
AND   info.cardno       = mapp.cardno
AND   info.lineno IN  (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, info.shift,
               mapp.latehr, mapp.earlyhr, (mapp.otmin/60)othr, mapp.earlystatus, mapp.isln, mapp.lateded, mapp.earlyded, mapp.tf
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company= :p_company 
AND   mapp.company = :p_com
AND   mapp.finyear     = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate      = :p_date 
AND   info.cardno       = mapp.cardno
AND   info.shift IN  (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, info.shift,
               mapp.latehr, mapp.earlyhr, (mapp.otmin/60)othr, mapp.earlystatus, mapp.isln, mapp.lateded, mapp.earlyded, mapp.tf
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company= :p_company 
AND   mapp.company = :p_com
AND   mapp.finyear     = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate      = :p_date 
AND   info.cardno       = mapp.cardno
AND   info.shift IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
        mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, info.shift,
        mapp.latehr, mapp.earlyhr, (mapp.otmin/60)othr, mapp.earlystatus, mapp.isln, mapp.lateded, mapp.earlyded, mapp.tf
FROM  tb_data_master mapp,tb_personal_info info,tb_idcard_multiple mul 
WHERE  info.company   =:p_company 
AND   mapp.company  =:p_com
AND   info.company     = mul.company
AND    mapp.finyear     = TO_CHAR(:p_date,'RRRR')
AND    mapp.finmonth = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate       =:p_date 
AND   mul.user_name = :p_user
AND   info.cardno        = mapp.cardno
AND   info.cardno        = mul.cardno  
ORDER BY lineno, cardno ASC

