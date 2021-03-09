SELECT info.lineno, info.sectionnm, info.departmentnm, info.cardno, info.enmname_bangla, info.designation, info.joining_date,
       info.birth_date, info.gender, info.bloodgroup,info.father_name_ban, info.spouse_name_ban, info.mother_name_ban, info.designation_bangla,
       info.present_add_ban, info.permanent_add_ban, info.permanent_po_ban, info.permanent_ps_ban, info.permanent_dist_ban, info.present_dist_ban,
       info.present_po_ban, info.present_ps_ban, other.special_mark 
FROM  tb_personal_info info, tb_personal_info_other other
WHERE info.company =:p_company
AND   info.company = other.company
AND   info.cardno  = other.cardno
AND   TO_CHAR(info.joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   info.sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   info.workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   info.shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.gender       LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno       LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND   info.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY info.departmentnm, info.sectionnm, info.lineno, info.cardno ASC


---------- seleted   ----


SELECT info.lineno, info.sectionnm, info.departmentnm, info.cardno, info.enmname_bangla, info.designation, info.joining_date,
       info.birth_date, info.gender, info.bloodgroup,info.father_name_ban, info.spouse_name_ban, info.mother_name_ban, info.designation_bangla,
       info.present_add_ban, info.permanent_add_ban, info.permanent_po_ban, info.permanent_ps_ban, info.permanent_dist_ban, info.present_dist_ban,
       info.present_po_ban, info.present_ps_ban, other.special_mark 
FROM  tb_personal_info info, tb_personal_info_other other,  tb_idcard_multiple mul
WHERE info.company  =:p_company
AND   info.company  = other.company
AND   info.company  = mul.company
AND   mul.user_name = :p_user
AND   info.cardno   = other.cardno
AND   info.cardno   = mul.cardno
