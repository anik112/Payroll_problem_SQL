SELECT a.company, a.departmentnm, a.sectionnm, a.lineno, a.cardno, a.secreteno, a.empname, a.father_name, a.mother_name,
       a.housbandname, a.joining_date, a.designation,  a.salary_grade,  a.resignation_date, a.birth_date, a.workertype, 
       a.tsalary, a.gender,  a.bloodgroup, a.book_sl_no, a.open_date, a.purposeofwork, a.perhrproduction, a.performance,
       a.nid, a.ref1, a.ref2, a.present_address, a.present_po, a.present_ps, a.present_dist, a.permanentaddress, 
       a.permanent_po, a.permanent_ps, a.permanent_dist, b.emppicture, a.grosssalary
FROM
(SELECT info.company,info.departmentnm, info.sectionnm, info.lineno, info.cardno,info.secreteno,info.empname,info.father_name,info.mother_name,
       info.housbandname, info.joining_date, info.designation,  info.salary_grade, info.resignation_date, info.birth_date, info.workertype, 
       info.tsalary, info.gender,  info.bloodgroup, other.book_sl_no, other.open_date, other.purposeofwork, other.perhrproduction, other.performance, 
       other.nid, other.ref1, other.ref2, info.present_address, info.present_po, info.present_ps, info.present_dist, info.permanentaddress, 
       info.permanent_po, info.permanent_ps, info.permanent_dist, (info.grosssalary + info.gross_bk) grosssalary
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_INFO_OTHER other
WHERE info.company  = :p_company
AND   info.company  = other.company
AND   info.cardno   = other.cardno
AND   info.departmentnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.company,info.departmentnm, info.sectionnm, info.lineno, info.cardno,info.secreteno,info.empname,info.father_name,info.mother_name,
       info.housbandname, info.joining_date, info.designation,  info.salary_grade, info.resignation_date, info.birth_date, info.workertype, 
       info.tsalary, info.gender,  info.bloodgroup, other.book_sl_no, other.open_date, other.purposeofwork, other.perhrproduction, other.performance, 
       other.nid, other.ref1, other.ref2, info.present_address, info.present_po, info.present_ps, info.present_dist, info.permanentaddress, 
       info.permanent_po, info.permanent_ps, info.permanent_dist, (info.grosssalary + info.gross_bk) grosssalary
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_INFO_OTHER other
WHERE info.company  = :p_company
AND   info.company  = other.company
AND   info.cardno   = other.cardno
AND   info.sectionnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.company,info.departmentnm, info.sectionnm, info.lineno, info.cardno,info.secreteno,info.empname,info.father_name,info.mother_name,
       info.housbandname, info.joining_date, info.designation,  info.salary_grade, info.resignation_date, info.birth_date, info.workertype, 
       info.tsalary, info.gender,  info.bloodgroup, other.book_sl_no, other.open_date, other.purposeofwork, other.perhrproduction, other.performance, 
       other.nid, other.ref1, other.ref2, info.present_address, info.present_po, info.present_ps, info.present_dist, info.permanentaddress, 
       info.permanent_po, info.permanent_ps, info.permanent_dist, (info.grosssalary + info.gross_bk) grosssalary
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_INFO_OTHER other
WHERE info.company  = :p_company
AND   info.company  = other.company
AND   info.cardno   = other.cardno
AND   info.designation IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.company,info.departmentnm, info.sectionnm, info.lineno, info.cardno,info.secreteno,info.empname,info.father_name,info.mother_name,
       info.housbandname, info.joining_date, info.designation,  info.salary_grade, info.resignation_date, info.birth_date, info.workertype, 
       info.tsalary, info.gender,  info.bloodgroup, other.book_sl_no, other.open_date, other.purposeofwork, other.perhrproduction, other.performance, 
       other.nid, other.ref1, other.ref2, info.present_address, info.present_po, info.present_ps, info.present_dist, info.permanentaddress, 
       info.permanent_po, info.permanent_ps, info.permanent_dist, (info.grosssalary + info.gross_bk) grosssalary
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_INFO_OTHER other
WHERE info.company  = :p_company
AND   info.company  = other.company
AND   info.cardno   = other.cardno
AND   info.workertype IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.company,info.departmentnm, info.sectionnm, info.lineno, info.cardno,info.secreteno,info.empname,info.father_name,info.mother_name,
       info.housbandname, info.joining_date, info.designation,  info.salary_grade, info.resignation_date, info.birth_date, info.workertype, 
       info.tsalary, info.gender,  info.bloodgroup, other.book_sl_no, other.open_date, other.purposeofwork, other.perhrproduction, other.performance, 
       other.nid, other.ref1, other.ref2, info.present_address, info.present_po, info.present_ps, info.present_dist, info.permanentaddress, 
       info.permanent_po, info.permanent_ps, info.permanent_dist, (info.grosssalary + info.gross_bk) grosssalary
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_INFO_OTHER other
WHERE info.company  = :p_company
AND   info.company  = other.company
AND   info.cardno   = other.cardno
AND   info.floorno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.company,info.departmentnm, info.sectionnm, info.lineno, info.cardno,info.secreteno,info.empname,info.father_name,info.mother_name,
       info.housbandname, info.joining_date, info.designation,  info.salary_grade, info.resignation_date, info.birth_date, info.workertype, 
       info.tsalary, info.gender,  info.bloodgroup, other.book_sl_no, other.open_date, other.purposeofwork, other.perhrproduction, other.performance, 
       other.nid, other.ref1, other.ref2, info.present_address, info.present_po, info.present_ps, info.present_dist, info.permanentaddress, 
       info.permanent_po, info.permanent_ps, info.permanent_dist, (info.grosssalary + info.gross_bk) grosssalary
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_INFO_OTHER other
WHERE info.company  = :p_company
AND   info.company  = other.company
AND   info.cardno   = other.cardno
AND   info.machineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.company,info.departmentnm, info.sectionnm, info.lineno, info.cardno,info.secreteno,info.empname,info.father_name,info.mother_name,
       info.housbandname, info.joining_date, info.designation,  info.salary_grade, info.resignation_date, info.birth_date, info.workertype, 
       info.tsalary, info.gender,  info.bloodgroup, other.book_sl_no, other.open_date, other.purposeofwork, other.perhrproduction, other.performance, 
       other.nid, other.ref1, other.ref2, info.present_address, info.present_po, info.present_ps, info.present_dist, info.permanentaddress, 
       info.permanent_po, info.permanent_ps, info.permanent_dist, (info.grosssalary + info.gross_bk) grosssalary
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_INFO_OTHER other
WHERE info.company  = :p_company
AND   info.company  = other.company
AND   info.cardno   = other.cardno
AND   info.lineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.company,info.departmentnm, info.sectionnm, info.lineno, info.cardno,info.secreteno,info.empname,info.father_name,info.mother_name,
       info.housbandname, info.joining_date, info.designation,  info.salary_grade, info.resignation_date, info.birth_date, info.workertype, 
       info.tsalary, info.gender,  info.bloodgroup, other.book_sl_no, other.open_date, other.purposeofwork, other.perhrproduction, other.performance, 
       other.nid, other.ref1, other.ref2, info.present_address, info.present_po, info.present_ps, info.present_dist, info.permanentaddress, 
       info.permanent_po, info.permanent_ps, info.permanent_dist, (info.grosssalary + info.gross_bk) grosssalary
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_INFO_OTHER other
WHERE info.company  = :p_company
AND   info.company  = other.company
AND   info.cardno   = other.cardno
AND   info.shift IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.company,info.departmentnm, info.sectionnm, info.lineno, info.cardno,info.secreteno,info.empname,info.father_name,info.mother_name,
       info.housbandname, info.joining_date, info.designation,  info.salary_grade, info.resignation_date, info.birth_date, info.workertype, 
       info.tsalary, info.gender,  info.bloodgroup, other.book_sl_no, other.open_date, other.purposeofwork, other.perhrproduction, other.performance, 
       other.nid, other.ref1, other.ref2, info.present_address, info.present_po, info.present_ps, info.present_dist, info.permanentaddress, 
       info.permanent_po, info.permanent_ps, info.permanent_dist, (info.grosssalary + info.gross_bk) grosssalary
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_INFO_OTHER other, TB_IDCARD_MULTIPLE mul
WHERE info.company  = :p_company
AND   info.company  = other.company
AND   info.company  = mul.company
AND   mul.user_name = :p_user
AND   info.cardno   = mul.cardno
AND   info.cardno   = other.cardno) a, TB_PERSONAL_INFO_PICTURE b
WHERE a.cardno = b.cardno
ORDER BY a.departmentnm, a.sectionnm, a.lineno, a.cardno ASC


------------------ education  


SELECT edu.highest_degree educa_hdegree, edu.level_degree educa_level, edu.institute_name educa_instite, 
       edu.passing_yr educa_yr, edu.class_grade educa_grd, edu.subject educa_sub,  info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EDUCATIONAL edu
WHERE info.company  = :p_company
AND   info.company  = edu.company
AND   info.cardno   = edu.cardno
AND   info.departmentnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT edu.highest_degree educa_hdegree, edu.level_degree educa_level, edu.institute_name educa_instite, 
       edu.passing_yr educa_yr, edu.class_grade educa_grd, edu.subject educa_sub,  info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EDUCATIONAL edu
WHERE info.company  = :p_company
AND   info.company  = edu.company
AND   info.cardno   = edu.cardno
AND   info.sectionnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT edu.highest_degree educa_hdegree, edu.level_degree educa_level, edu.institute_name educa_instite, 
       edu.passing_yr educa_yr, edu.class_grade educa_grd, edu.subject educa_sub,  info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EDUCATIONAL edu
WHERE info.company  = :p_company
AND   info.company  = edu.company
AND   info.cardno   = edu.cardno
AND   info.designation IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT edu.highest_degree educa_hdegree, edu.level_degree educa_level, edu.institute_name educa_instite, 
       edu.passing_yr educa_yr, edu.class_grade educa_grd, edu.subject educa_sub,  info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EDUCATIONAL edu
WHERE info.company  = :p_company
AND   info.company  = edu.company
AND   info.cardno   = edu.cardno
AND   info.workertype IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT edu.highest_degree educa_hdegree, edu.level_degree educa_level, edu.institute_name educa_instite, 
       edu.passing_yr educa_yr, edu.class_grade educa_grd, edu.subject educa_sub,  info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EDUCATIONAL edu
WHERE info.company  = :p_company
AND   info.company  = edu.company
AND   info.cardno   = edu.cardno
AND   info.floorno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT edu.highest_degree educa_hdegree, edu.level_degree educa_level, edu.institute_name educa_instite, 
       edu.passing_yr educa_yr, edu.class_grade educa_grd, edu.subject educa_sub,  info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EDUCATIONAL edu
WHERE info.company  = :p_company
AND   info.company  = edu.company
AND   info.cardno   = edu.cardno
AND   info.machineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT edu.highest_degree educa_hdegree, edu.level_degree educa_level, edu.institute_name educa_instite, 
       edu.passing_yr educa_yr, edu.class_grade educa_grd, edu.subject educa_sub,  info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EDUCATIONAL edu
WHERE info.company  = :p_company
AND   info.company  = edu.company
AND   info.cardno   = edu.cardno
AND   info.lineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT edu.highest_degree educa_hdegree, edu.level_degree educa_level, edu.institute_name educa_instite, 
       edu.passing_yr educa_yr, edu.class_grade educa_grd, edu.subject educa_sub,  info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EDUCATIONAL edu
WHERE info.company  = :p_company
AND   info.company  = edu.company
AND   info.cardno   = edu.cardno
AND   info.shift IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT edu.highest_degree educa_hdegree, edu.level_degree educa_level, edu.institute_name educa_instite, 
       edu.passing_yr educa_yr, edu.class_grade educa_grd, edu.subject educa_sub,  info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EDUCATIONAL edu, TB_IDCARD_MULTIPLE mul
WHERE info.company  = :p_company  
AND   info.company  = edu.company
AND   info.company  = mul.company
AND   mul.user_name = :p_user
AND   info.cardno   = mul.cardno
AND   info.cardno   = edu.cardno
ORDER BY educa_yr DESC



--------------------------



SELECT ment.companyname employ_company, ment.start_date employ_sdate, ment.end_date employ_edate, ment.designation employ_desig,
       ment.LOCATION employ_location, ment.employer_type employ_type, info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EMPLOYMENT ment
WHERE info.company  = :p_company
AND   info.company  = ment.company
AND   info.cardno   = ment.cardno
AND   info.departmentnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT ment.companyname employ_company, ment.start_date employ_sdate, ment.end_date employ_edate, ment.designation employ_desig,
       ment.LOCATION employ_location, ment.employer_type employ_type, info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EMPLOYMENT ment
WHERE info.company  = :p_company
AND   info.company  = ment.company
AND   info.cardno   = ment.cardno
AND   info.sectionnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT ment.companyname employ_company, ment.start_date employ_sdate, ment.end_date employ_edate, ment.designation employ_desig,
       ment.LOCATION employ_location, ment.employer_type employ_type, info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EMPLOYMENT ment
WHERE info.company  = :p_company
AND   info.company  = ment.company
AND   info.cardno   = ment.cardno
AND   info.designation IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT ment.companyname employ_company, ment.start_date employ_sdate, ment.end_date employ_edate, ment.designation employ_desig,
       ment.LOCATION employ_location, ment.employer_type employ_type, info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EMPLOYMENT ment
WHERE info.company  = :p_company
AND   info.company  = ment.company
AND   info.cardno   = ment.cardno
AND   info.workertype IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT ment.companyname employ_company, ment.start_date employ_sdate, ment.end_date employ_edate, ment.designation employ_desig,
       ment.LOCATION employ_location, ment.employer_type employ_type, info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EMPLOYMENT ment
WHERE info.company  = :p_company
AND   info.company  = ment.company
AND   info.cardno   = ment.cardno
AND   info.floorno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT ment.companyname employ_company, ment.start_date employ_sdate, ment.end_date employ_edate, ment.designation employ_desig,
       ment.LOCATION employ_location, ment.employer_type employ_type, info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EMPLOYMENT ment
WHERE info.company  = :p_company
AND   info.company  = ment.company
AND   info.cardno   = ment.cardno
AND   info.machineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT ment.companyname employ_company, ment.start_date employ_sdate, ment.end_date employ_edate, ment.designation employ_desig,
       ment.LOCATION employ_location, ment.employer_type employ_type, info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EMPLOYMENT ment
WHERE info.company  = :p_company
AND   info.company  = ment.company
AND   info.cardno   = ment.cardno
AND   info.lineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT ment.companyname employ_company, ment.start_date employ_sdate, ment.end_date employ_edate, ment.designation employ_desig,
       ment.LOCATION employ_location, ment.employer_type employ_type, info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EMPLOYMENT ment
WHERE info.company  = :p_company
AND   info.company  = ment.company
AND   info.cardno   = ment.cardno
AND   info.shift IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT ment.companyname employ_company, ment.start_date employ_sdate, ment.end_date employ_edate, ment.designation employ_desig,
       ment.LOCATION employ_location, ment.employer_type employ_type, info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EMPLOYMENT ment, TB_IDCARD_MULTIPLE mul
WHERE info.company  = :p_company 
AND   info.company  = ment.company
AND   info.company  = mul.company
AND   mul.user_name = :p_user
AND   info.cardno   = mul.cardno
AND   info.cardno   = ment.cardno
ORDER BY employ_sdate DESC


--------------------------------------------------




SELECT tra.training_title train_title, tra.tr_duration train_dura, tra.tr_year train_yr, tra.institule train_instite,
       tra.city train_city, tra.country train_coutry, info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_TRAINING tra
WHERE info.company  = :p_company
AND   info.company  = tra.company
AND   info.cardno   = tra.cardno
AND   info.departmentnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT tra.training_title train_title, tra.tr_duration train_dura, tra.tr_year train_yr, tra.institule train_instite,
       tra.city train_city, tra.country train_coutry, info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_TRAINING tra
WHERE info.company  = :p_company
AND   info.company  = tra.company
AND   info.cardno   = tra.cardno
AND   info.sectionnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT tra.training_title train_title, tra.tr_duration train_dura, tra.tr_year train_yr, tra.institule train_instite,
       tra.city train_city, tra.country train_coutry, info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_TRAINING tra
WHERE info.company  = :p_company
AND   info.company  = tra.company
AND   info.cardno   = tra.cardno
AND   info.designation IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT tra.training_title train_title, tra.tr_duration train_dura, tra.tr_year train_yr, tra.institule train_instite,
       tra.city train_city, tra.country train_coutry, info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_TRAINING tra
WHERE info.company  = :p_company
AND   info.company  = tra.company
AND   info.cardno   = tra.cardno
AND   info.workertype IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT tra.training_title train_title, tra.tr_duration train_dura, tra.tr_year train_yr, tra.institule train_instite,
       tra.city train_city, tra.country train_coutry, info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_TRAINING tra
WHERE info.company  = :p_company
AND   info.company  = tra.company
AND   info.cardno   = tra.cardno
AND   info.floorno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT tra.training_title train_title, tra.tr_duration train_dura, tra.tr_year train_yr, tra.institule train_instite,
       tra.city train_city, tra.country train_coutry, info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_TRAINING tra
WHERE info.company  = :p_company
AND   info.company  = tra.company
AND   info.cardno   = tra.cardno
AND   info.machineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT tra.training_title train_title, tra.tr_duration train_dura, tra.tr_year train_yr, tra.institule train_instite,
       tra.city train_city, tra.country train_coutry, info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_TRAINING tra
WHERE info.company  = :p_company
AND   info.company  = tra.company
AND   info.cardno   = tra.cardno
AND   info.lineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT tra.training_title train_title, tra.tr_duration train_dura, tra.tr_year train_yr, tra.institule train_instite,
       tra.city train_city, tra.country train_coutry, info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_TRAINING tra
WHERE info.company  = :p_company
AND   info.company  = tra.company
AND   info.cardno   = tra.cardno
AND   info.shift IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT tra.training_title train_title, tra.tr_duration train_dura, tra.tr_year train_yr, tra.institule train_instite,
       tra.city train_city, tra.country train_coutry, info.company, info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_TRAINING tra, TB_IDCARD_MULTIPLE mul
WHERE info.company  = :p_company 
AND   info.company  = tra.company
AND   info.company  = mul.company
AND   mul.user_name = :p_user
AND   info.cardno   = mul.cardno
AND   info.cardno   = tra.cardno
ORDER BY train_yr DESC


----------------------------------------------



SELECT pro.certification profecerti, pro.institule profeinsti, pro.city profecity, pro.country profecountry,
       pro.start_date profe_sdate, pro.end_date profe_edate, info.company , info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_PROFESSIONAL pro
WHERE info.company  = :p_company
AND   info.company  = pro.company
AND   info.cardno   = pro.cardno
AND   info.departmentnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT pro.certification profecerti, pro.institule profeinsti, pro.city profecity, pro.country profecountry,
       pro.start_date profe_sdate, pro.end_date profe_edate, info.company , info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_PROFESSIONAL pro
WHERE info.company  = :p_company
AND   info.company  = pro.company
AND   info.cardno   = pro.cardno
AND   info.sectionnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT pro.certification profecerti, pro.institule profeinsti, pro.city profecity, pro.country profecountry,
       pro.start_date profe_sdate, pro.end_date profe_edate, info.company , info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_PROFESSIONAL pro
WHERE info.company  = :p_company
AND   info.company  = pro.company
AND   info.cardno   = pro.cardno
AND   info.designation IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT pro.certification profecerti, pro.institule profeinsti, pro.city profecity, pro.country profecountry,
       pro.start_date profe_sdate, pro.end_date profe_edate, info.company , info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_PROFESSIONAL pro
WHERE info.company  = :p_company
AND   info.company  = pro.company
AND   info.cardno   = pro.cardno
AND   info.workertype IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT pro.certification profecerti, pro.institule profeinsti, pro.city profecity, pro.country profecountry,
       pro.start_date profe_sdate, pro.end_date profe_edate, info.company , info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_PROFESSIONAL pro
WHERE info.company  = :p_company
AND   info.company  = pro.company
AND   info.cardno   = pro.cardno
AND   info.floorno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT pro.certification profecerti, pro.institule profeinsti, pro.city profecity, pro.country profecountry,
       pro.start_date profe_sdate, pro.end_date profe_edate, info.company , info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_PROFESSIONAL pro
WHERE info.company  = :p_company
AND   info.company  = pro.company
AND   info.cardno   = pro.cardno
AND   info.machineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT pro.certification profecerti, pro.institule profeinsti, pro.city profecity, pro.country profecountry,
       pro.start_date profe_sdate, pro.end_date profe_edate, info.company , info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_PROFESSIONAL pro
WHERE info.company  = :p_company
AND   info.company  = pro.company
AND   info.cardno   = pro.cardno
AND   info.lineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT pro.certification profecerti, pro.institule profeinsti, pro.city profecity, pro.country profecountry,
       pro.start_date profe_sdate, pro.end_date profe_edate, info.company , info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_PROFESSIONAL pro
WHERE info.company  = :p_company
AND   info.company  = pro.company
AND   info.cardno   = pro.cardno
AND   info.shift IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company = :p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.active                               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT pro.certification profecerti, pro.institule profeinsti, pro.city profecity, pro.country profecountry,
       pro.start_date profe_sdate, pro.end_date profe_edate, info.company , info.cardno
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_PROFESSIONAL pro, TB_IDCARD_MULTIPLE mul
WHERE info.company  = :p_company 
AND   info.company  = pro.company
AND   info.company  = mul.company
AND   mul.user_name = :p_user
AND   info.cardno   = mul.cardno
AND   info.cardno   = pro.cardno
ORDER BY profe_sdate DESC