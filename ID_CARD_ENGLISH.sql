SELECT eng.cardno, eng.empname empname, eng.designation designation, eng.departmentnm departmentnm, eng.bloodgroup, eng.sectionnm sectionnm,
       pic.emppicture,SIGN.empsign, eng.lineno, other.performance, eng.joining_date, other.nid, other.own_cellno, eng.permanentaddress, eng.permanent_po,
       eng.permanent_ps, eng.permanent_dist, eng.present_address, eng.present_po, eng.present_ps, eng.present_dist, other.purposeofwork, other.emg_con_per_cellno
FROM  TB_PERSONAL_INFO eng, TB_PERSONAL_INFO_PICTURE pic, TB_PERSONAL_INFO_SIGN SIGN,TB_PERSONAL_INFO_OTHER other
WHERE eng.company = :p_company
AND   eng.company = pic.company
AND   eng.company = SIGN.company
AND   eng.company = other.company
AND   eng.cardno  = pic.cardno
AND   eng.cardno  = SIGN.cardno
AND   eng.cardno  = other.cardno
AND   eng.departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   eng.sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   eng.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   eng.designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   eng.workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   eng.floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   eng.machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   eng.shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   eng.gender       LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   eng.cardno       LIKE DECODE(NVL(:v_cardno,'all'),'all','%',:v_cardno)
AND   eng.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY  eng.departmentnm, eng.sectionnm,eng.lineno, eng.cardno ASC


----------------------------------



SELECT eng.cardno, eng.empname empname, eng.designation designation, eng.departmentnm departmentnm, eng.bloodgroup, eng.sectionnm sectionnm,
       pic.emppicture,SIGN.empsign, eng.lineno, other.performance, eng.joining_date, other.nid, other.own_cellno, eng.permanentaddress, eng.permanent_po,
       eng.permanent_ps, eng.permanent_dist, eng.present_address, eng.present_po, eng.present_ps, eng.present_dist, other.purposeofwork, other.emg_con_per_cellno
FROM  TB_PERSONAL_INFO eng, TB_PERSONAL_INFO_PICTURE pic, TB_PERSONAL_INFO_SIGN SIGN,TB_PERSONAL_INFO_OTHER other
WHERE eng.company = :p_company
AND   eng.company = pic.company
AND   eng.company = SIGN.company
AND   eng.company = other.company
AND   eng.joining_date BETWEEN :p_sdate AND :p_edate
AND   eng.cardno  = pic.cardno
AND   eng.cardno  = SIGN.cardno
AND   eng.cardno  = other.cardno
AND   eng.departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   eng.sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   eng.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   eng.designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   eng.workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   eng.floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   eng.machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   eng.shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   eng.gender       LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   eng.cardno       LIKE DECODE(NVL(:v_cardno,'all'),'all','%',:v_cardno)
AND   eng.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY  eng.departmentnm, eng.sectionnm,eng.lineno, eng.cardno ASC


-------------------------------------



SELECT eng.cardno, eng.empname empname, eng.designation designation, eng.departmentnm departmentnm, eng.bloodgroup, eng.sectionnm sectionnm,
       pic.emppicture,SIGN.empsign, eng.lineno, other.performance, eng.joining_date, other.nid, other.own_cellno, eng.permanentaddress, eng.permanent_po,
       eng.permanent_ps, eng.permanent_dist, eng.present_address, eng.present_po, eng.present_ps, eng.present_dist, other.purposeofwork,
	   other.emg_con_per_cellno, eng.PROCESS_DATE
FROM  TB_PERSONAL_INFO eng, TB_PERSONAL_INFO_PICTURE pic, TB_PERSONAL_INFO_SIGN SIGN,TB_PERSONAL_INFO_OTHER other
WHERE eng.company = :p_company
AND   eng.company = pic.company
AND   eng.company = SIGN.company
AND   eng.company = other.company
AND   TO_DATE(eng.PROCESS_DATE,'DD/MM/RRRR') BETWEEN :p_sdate AND :p_edate
AND   eng.cardno  = pic.cardno
AND   eng.cardno  = SIGN.cardno
AND   eng.cardno  = other.cardno
AND   eng.departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   eng.sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   eng.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   eng.designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   eng.workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   eng.floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   eng.machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   eng.shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   eng.gender       LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   eng.cardno       LIKE DECODE(NVL(:v_cardno,'all'),'all','%',:v_cardno)
AND   eng.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY  eng.departmentnm, eng.sectionnm,eng.lineno, eng.cardno ASC
