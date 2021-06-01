SELECT lev.cardno, lev.ca_leave, lev.taken_ca, lev.aval_ca, lev.med_leave, lev.taken_med, lev.aval_med, 
              lev.ear_leave, lev.taken_ear, lev.aval_ear, lev.com_leave, lev.taken_com, lev.aval_com, 
              lev.other_leave, lev.taken_other, lev.aval_other,  per.departmentnm, per.sectionnm, per.lineno, per.empname, 
              per.joining_date, per.designation, per.salary_grade,per. floorno,per. machineno,  per.enmname_bangla, per.designation_bangla, 
              per.dept_bangla, per.sec_bangla, other.emg_contact_person,  other.emg_con_per_address,  other.emg_con_per_cellno  
FROM  TB_LEAVE_MASTERINFO lev, TB_PERSONAL_INFO per, TB_PERSONAL_INFO_OTHER other
WHERE lev.company   = :p_company
AND   lev.company       = per.company
AND   lev.company       = other.company
AND   lev.finyear           = :p_year
AND   lev.cardno          = per.cardno
AND   lev.cardno          = other.cardno

AND   per.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND   per.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND   per.designation      LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation) 
AND   per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno) 
AND   per.machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno) 
AND   per.workertype       LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   per.lineno               LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno) 
AND   per.shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   per.cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND   per.active               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)

ORDER BY per.departmentnm, per.sectionnm, per.cardno ASC