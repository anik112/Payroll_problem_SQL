SELECT emp.cardno, emp.company, other.leave_type, other.start_date, other.end_date, 
       other.leaveday, emp.joining_date, emp.lineno, emp.sec_bangla,  emp.designation_bangla,
       emp.departmentnm, emp.sectionnm, emp.designation,emp.empname, empSing.empsign,
       emp.father_name_ban,  emp.spouse_name_ban,  emp.mother_name_ban, emp.enmname_bangla
FROM  tb_personal_info emp, tb_leave_detailinfo other, tb_personal_info_sign empSing
WHERE emp.company      = :p_company
AND   emp.company      = other.company
AND   emp.company      = empSing.company
AND   emp.joining_date <= :p_date
AND   other.finyear    = TO_CHAR(TO_DATE(:p_date,'DD/MM/RRRR'),'rrrr')
AND   other.leave_type IN ('Casual', 'Earned', 'Medical')
AND   emp.cardno       = other.cardno
AND   emp.cardno       = empSing.cardno
AND   emp.departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   emp.sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   emp.designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   emp.workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   emp.floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   emp.machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
AND   emp.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   emp.shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   emp.gender       LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   emp.cardno       LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND   emp.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY emp.departmentnm,emp.sectionnm,emp.lineno,emp.cardno,other.start_date ASC


-------------- selected  ---------------


SELECT emp.cardno, emp.company, other.leave_type, other.start_date, other.end_date, 
       other.leaveday, emp.joining_date, emp.lineno, emp.sec_bangla,  emp.designation_bangla,
       emp.departmentnm, emp.sectionnm, emp.designation,emp.empname, empSing.empsign,
       emp.father_name_ban,  emp.spouse_name_ban,  emp.mother_name_ban, emp.enmname_bangla
FROM   tb_personal_info emp, tb_leave_detailinfo other, tb_personal_info_sign empSing, tb_idcard_multiple mul
WHERE emp.company      = :p_company
AND   emp.company      = other.company
AND   emp.company      = empSing.company
AND   emp.company      = mul.company
AND   emp.joining_date <= :p_date
AND   mul.user_name    = :p_user
AND   emp.cardno       = other.cardno
AND   emp.cardno       = empSing.cardno
AND   emp.cardno       = mul.cardno