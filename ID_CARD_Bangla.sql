SELECT per.sectionnm, per.cardno,per.empname, per.departmentnm,per.joining_date, per.designation ,pic.emppicture, SIGN.empsign, 
       per.lineno, per.bloodgroup,  other.nid, per.permanentaddress, per.permanent_add_ban,per.permanent_po_ban,per.permanent_ps_ban, 
       per.permanent_dist_ban, per.enmname_bangla, per.designation_bangla, per.dept_bangla, per.sec_bangla , other.nominee_cellno,
       other.own_cellno, other.purposeofwork, other.emg_con_per_cellno
FROM   TB_PERSONAL_INFO per,TB_PERSONAL_INFO_SIGN SIGN, TB_PERSONAL_INFO_PICTURE pic,TB_PERSONAL_INFO_OTHER other
WHERE  per.company  = :p_company
AND    per.company      = SIGN.company
AND    per.company      = pic.company
AND    per.company      = other.company
AND    per.cardno         = SIGN.cardno 
AND    per.cardno         = pic.cardno 
AND    per.cardno         = other.cardno 
AND    per.departmentnm  LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND    per.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    per.designation      LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND    per.workertype       LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno              LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND    per.shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND    per.gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND    per.cardno            LIKE DECODE (NVL(:v_cardno,'all'),'all','%',:v_cardno)
AND    per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY per.cardno ASC



------------------------------------------------


SELECT per.sectionnm, per.cardno,per.empname, per.departmentnm,per.joining_date, per.designation ,pic.emppicture, SIGN.empsign, 
               per.lineno, per.bloodgroup,  other.nid, per.permanentaddress, per.permanent_add_ban,per.permanent_po_ban,per.permanent_ps_ban, 
               per.permanent_dist_ban, per.enmname_bangla, per.designation_bangla, per.dept_bangla, per.sec_bangla , other.nominee_cellno,
               other.own_cellno, other.purposeofwork, other.emg_con_per_cellno
FROM   TB_PERSONAL_INFO per,TB_PERSONAL_INFO_SIGN SIGN, TB_PERSONAL_INFO_PICTURE pic,TB_PERSONAL_INFO_OTHER other
WHERE  per.company  = :p_company
AND    per.company      = SIGN.company
AND    per.company      = pic.company
AND    per.company      = other.company
AND    per.joining_date  BETWEEN :p_sdate AND :p_edate
AND    per.cardno         = SIGN.cardno 
AND    per.cardno         = pic.cardno 
AND    per.cardno         = other.cardno 
AND    per.departmentnm  LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND    per.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    per.designation      LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND    per.workertype       LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    per.floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno               LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND    per.shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND    per.gender             LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND    per.cardno             LIKE DECODE (NVL(:v_cardno,'all'),'all','%',:v_cardno)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY per.cardno ASC



---------------------------------------------



SELECT per.sectionnm, per.cardno,per.empname, per.departmentnm,per.joining_date, per.designation ,pic.emppicture, SIGN.empsign, 
               per.lineno, per.bloodgroup,  other.nid, per.permanentaddress, per.permanent_add_ban,per.permanent_po_ban,per.permanent_ps_ban, 
               per.permanent_dist_ban, per.enmname_bangla, per.designation_bangla, per.dept_bangla, per.sec_bangla , other.nominee_cellno,
               other.own_cellno, other.purposeofwork, other.emg_con_per_cellno
FROM   TB_PERSONAL_INFO per,TB_PERSONAL_INFO_SIGN SIGN, TB_PERSONAL_INFO_PICTURE pic,TB_PERSONAL_INFO_OTHER other
WHERE  per.company  = :p_company
AND    per.company      = SIGN.company
AND    per.company      = pic.company
AND    per.company      = other.company
AND    TO_DATE(per.PROCESS_DATE,'RR/MM/RRRR') BETWEEN :p_sdate AND :p_edate
AND    per.cardno         = SIGN.cardno 
AND    per.cardno         = pic.cardno 
AND    per.cardno         = other.cardno 
AND    per.departmentnm  LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND    per.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    per.designation      LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND    per.workertype       LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    per.floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno               LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND    per.shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND    per.gender             LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND    per.cardno             LIKE DECODE (NVL(:v_cardno,'all'),'all','%',:v_cardno)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY per.cardno ASC