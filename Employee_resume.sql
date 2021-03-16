SELECT info.company,info.departmentnm, info.sectionnm, info.lineno, info.cardno,info.secreteno,info.empname,info.father_name,info.mother_name,
       info.housbandname, info.joining_date, info.designation,  info.salary_grade, (info.grosssalary + info.gross_bk)grosssalary, info.resignation_date,
       info.birth_date, info.workertype, pic.emppicture, info.tsalary, info.gender,  info.bloodgroup, other.book_sl_no, other.open_date, other.purposeofwork, 
       other.perhrproduction, other.performance, other.nid, other.ref1, other.ref2, info.present_address, info.present_po, info.present_ps, info.present_dist, 
       info.permanentaddress, info.permanent_po, info.permanent_ps, info.permanent_dist
FROM  tb_personal_info info, tb_personal_info_other other, tb_personal_info_picture pic
WHERE info.company =:p_company
AND   info.company = pic.company
AND   info.company = other.company
AND   info.cardno  = other.cardno
AND   info.cardno  = pic.cardno
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   info.sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   info.designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   info.workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cardno       LIKE DECODE (NVL(:p_cardno,'all'),'all','%',:p_cardno)
AND   info.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.departmentnm, info.sectionnm, info.lineno,info.cardno ASC



----------- Education  

SELECT edu.HIGHEST_DEGREE educa_hdegree, edu.LEVEL_DEGREE educa_level, edu.INSTITUTE_NAME educa_instite, 
       edu.PASSING_YR educa_yr, edu.CLASS_GRADE educa_grd, edu.SUBJECT educa_sub,  info.company, info.cardno
FROM  tb_personal_info info, TB_PERSONAL_EDUCATIONAL edu
WHERE info.company = :p_company  
AND   info.company = edu.company
AND   info.cardno  = edu.cardno
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   info.sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   info.designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   info.workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cardno       LIKE DECODE (NVL(:p_cardno,'all'),'all','%',:p_cardno)
AND   info.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY edu.PASSING_YR DESC


---------------- Employeement  

SELECT ment.companyname employ_company, ment.start_date employ_sdate, ment.end_date employ_edate, ment.designation employ_desig,
       ment.LOCATION employ_location, ment.employer_type employ_type, info.company, info.cardno
FROM  tb_personal_info info, tb_personal_employment ment
WHERE info.company = :p_company 
AND   info.company = ment.company
AND   info.cardno  = ment.cardno

AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   info.sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   info.designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   info.workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cardno       LIKE DECODE (NVL(:p_cardno,'all'),'all','%',:p_cardno)
AND   info.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)

ORDER BY ment.start_date DESC


------------- Training   

SELECT tra.training_title train_title, tra.tr_duration train_dura, tra.tr_year train_yr, tra.institule train_instite,
       tra.city train_city, tra.country train_coutry, info.company, info.cardno
FROM  tb_personal_info info, tb_personal_training tra
WHERE info.company = :p_company 
AND   info.company = tra.company
AND   info.cardno  = tra.cardno
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   info.sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   info.designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   info.workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cardno       LIKE DECODE (NVL(:p_cardno,'all'),'all','%',:p_cardno)
AND   info.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY tra.tr_year DESC



----------- Professional   


SELECT pro.CERTIFICATION profecerti, pro.INSTITULE profeinsti, pro.CITY profecity, pro.COUNTRY profecountry,
       pro.START_DATE profe_sdate, pro.END_DATE profe_edate, info.company , info.cardno
FROM  tb_personal_info info, TB_PERSONAL_PROFESSIONAL pro
WHERE info.company = :p_company 
AND   info.company = pro.company
AND   info.cardno  = pro.cardno
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   info.sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   info.designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   info.workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cardno       LIKE DECODE (NVL(:p_cardno,'all'),'all','%',:p_cardno)
AND   info.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY pro.START_DATE DESC




-------------------------------------------- selected   -------------



SELECT info.company,info.departmentnm, info.sectionnm, info.lineno, info.cardno,info.secreteno,info.empname,info.father_name,info.mother_name,
       info.housbandname, info.joining_date, info.designation,  info.salary_grade, (info.grosssalary + info.gross_bk)grosssalary, info.resignation_date,
       info.birth_date, info.workertype, pic.emppicture, info.tsalary, info.gender,  info.bloodgroup, other.book_sl_no, other.open_date, other.purposeofwork, 
       other.perhrproduction, other.performance, other.nid, other.ref1, other.ref2, info.present_address, info.present_po, info.present_ps, info.present_dist, 
       info.permanentaddress, info.permanent_po, info.permanent_ps, info.permanent_dist
FROM  tb_personal_info info, tb_personal_info_other other, 
      tb_personal_info_picture pic, tb_idcard_multiple mul
WHERE info.company  = :p_company
AND   info.company  = pic.company
AND   info.company  = other.company
AND   info.company  = mul.company
AND   mul.user_name = :p_user
AND   info.cardno   = mul.cardno
AND   info.cardno   = other.cardno
AND   info.cardno   = pic.cardno
ORDER BY info.departmentnm, info.sectionnm, info.lineno,info.cardno ASC


----------- Education  

SELECT edu.highest_degree educa_hdegree, edu.level_degree educa_level, edu.institute_name educa_instite, 
       edu.passing_yr educa_yr, edu.class_grade educa_grd, edu.subject educa_sub,  info.company, info.cardno
FROM  tb_personal_info info, tb_personal_educational edu, tb_idcard_multiple mul
WHERE info.company  = :p_company  
AND   info.company  = edu.company
AND   info.company  = mul.company
AND   mul.user_name = :p_user
AND   info.cardno   = mul.cardno
AND   info.cardno   = edu.cardno
ORDER BY edu.passing_yr DESC


---------------- Employeement  

SELECT ment.companyname employ_company, ment.start_date employ_sdate, ment.end_date employ_edate, ment.designation employ_desig,
       ment.LOCATION employ_location, ment.employer_type employ_type, info.company, info.cardno
FROM  tb_personal_info info, tb_personal_employment ment, tb_idcard_multiple mul
WHERE info.company  = :p_company 
AND   info.company  = ment.company
AND   info.company  = mul.company
AND   mul.user_name = :p_user
AND   info.cardno   = mul.cardno
AND   info.cardno   = ment.cardno
ORDER BY ment.start_date DESC


------------- Training   

SELECT tra.training_title train_title, tra.tr_duration train_dura, tra.tr_year train_yr, tra.institule train_instite,
       tra.city train_city, tra.country train_coutry, info.company, info.cardno
FROM  tb_personal_info info, tb_personal_training tra, tb_idcard_multiple mul
WHERE info.company  = :p_company 
AND   info.company  = tra.company
AND   info.company  = mul.company
AND   mul.user_name = :p_user
AND   info.cardno   = mul.cardno
AND   info.cardno   = tra.cardno
ORDER BY tra.tr_year DESC



----------- Professional   


SELECT pro.certification profecerti, pro.institule profeinsti, pro.city profecity, pro.country profecountry,
       pro.start_date profe_sdate, pro.end_date profe_edate, info.company , info.cardno
FROM  tb_personal_info info, tb_personal_professional pro, tb_idcard_multiple mul
WHERE info.company  = :p_company 
AND   info.company  = pro.company
AND   info.company  = mul.company
AND   mul.user_name = :p_user
AND   info.cardno   = mul.cardno
AND   info.cardno   = pro.cardno
ORDER BY pro.start_date DESC