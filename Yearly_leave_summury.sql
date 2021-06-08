SELECT info.sectionnm,mas.cardno,mas.ca_leave,mas.aval_ca, mas.med_leave,mas.aval_med,mas.ear_leave,mas.aval_ear, mas.lwp_leave,  mas.aval_lwp,
              info.empname,info.designation,info.departmentnm,info.lineno, mas.com_leave, mas.aval_com, mas.other_leave,  mas.aval_other,  mas.spl_leave,  mas.aval_spl
FROM   TB_LEAVE_MASTERINFO mas,TB_PERSONAL_INFO info
WHERE  info.company  = :p_company
AND    info.company      = mas.company
AND    mas.finyear         = :p_year
AND    mas.cardno        = info.cardno
AND    info.departmentnm    LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    info.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    info.designation        LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig) 
AND    info.floorno                LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    info.machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    info.workertype         LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    mas.leave_type        LIKE DECODE(NVL(:p_leavetype,'all'),'all','%',:p_leavetype)
AND    info.lineno                 LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND    info.shift                    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND    info.cardno                LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND    info.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.sectionnm,info.lineno,info.cardno ASC


------------------------------------

SELECT info.sectionnm,mas.cardno,mas.ca_leave,mas.aval_ca, 
               mas.med_leave,mas.aval_med,mas.ear_leave,mas.aval_ear, mas.lwp_leave,  mas.aval_lwp,
               info.empname,info.designation,info.departmentnm,info.lineno, mas.com_leave, mas.aval_com, mas.other_leave,  mas.aval_other,  mas.spl_leave,  mas.aval_spl,
                det.leave_type,  det.start_date,  det.end_date, det.reason, det.remarks
FROM   TB_LEAVE_MASTERINFO mas,TB_PERSONAL_INFO info, TB_LEAVE_DETAILINFO det
WHERE  info.company   = :p_company
AND    info.company       = mas.company
AND    info.company       = det.company
AND    mas.finyear      = :p_year
AND    mas.finyear      = det.finyear
AND    mas.cardno           = info.cardno
AND    mas.cardno           = det.cardno
AND    info.departmentnm    LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    info.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    info.designation        LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig) 
AND    info.floorno                LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    info.machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    info.workertype         LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
--and    mas.leave_type        like decode(nvl(:p_leavetype,'all'),'all','%',:p_leavetype)
AND    info.lineno                 LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND    info.shift                    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND    info.cardno                LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND    info.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.sectionnm,info.lineno,info.cardno, det.leave_type,  det.start_date ASC




-----------------------


SELECT info.sectionnm,mas.cardno,mas.ca_leave,mas.aval_ca, mas.med_leave,mas.aval_med,mas.ear_leave,mas.aval_ear, mas.lwp_leave,  mas.aval_lwp,
              info.empname,info.designation,info.departmentnm,info.lineno, mas.com_leave, mas.aval_com, mas.other_leave,  mas.aval_other,  mas.spl_leave,  mas.aval_spl
FROM   TB_LEAVE_MASTERINFO mas,TB_PERSONAL_INFO info
WHERE  info.company  = :p_company
AND    info.company      = mas.company
AND    mas.finyear         = :p_year
AND    mas.cardno        = info.cardno
AND    info.DEPARTMENTNM IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company    =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND    info.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.sectionnm,mas.cardno,mas.ca_leave,mas.aval_ca, mas.med_leave,mas.aval_med,mas.ear_leave,mas.aval_ear, mas.lwp_leave,  mas.aval_lwp,
              info.empname,info.designation,info.departmentnm,info.lineno, mas.com_leave, mas.aval_com, mas.other_leave,  mas.aval_other,  mas.spl_leave,  mas.aval_spl
FROM   TB_LEAVE_MASTERINFO mas,TB_PERSONAL_INFO info
WHERE  info.company  = :p_company
AND    info.company      = mas.company
AND    mas.finyear         = :p_year
AND    mas.cardno        = info.cardno
AND    info.SECTIONNM IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company    =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND    info.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.sectionnm,mas.cardno,mas.ca_leave,mas.aval_ca, mas.med_leave,mas.aval_med,mas.ear_leave,mas.aval_ear, mas.lwp_leave,  mas.aval_lwp,
              info.empname,info.designation,info.departmentnm,info.lineno, mas.com_leave, mas.aval_com, mas.other_leave,  mas.aval_other,  mas.spl_leave,  mas.aval_spl
FROM   TB_LEAVE_MASTERINFO mas,TB_PERSONAL_INFO info
WHERE  info.company  = :p_company
AND    info.company      = mas.company
AND    mas.finyear         = :p_year
AND    mas.cardno        = info.cardno
AND    info.DESIGNATION IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company    =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND    info.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.sectionnm,mas.cardno,mas.ca_leave,mas.aval_ca, mas.med_leave,mas.aval_med,mas.ear_leave,mas.aval_ear, mas.lwp_leave,  mas.aval_lwp,
              info.empname,info.designation,info.departmentnm,info.lineno, mas.com_leave, mas.aval_com, mas.other_leave,  mas.aval_other,  mas.spl_leave,  mas.aval_spl
FROM   TB_LEAVE_MASTERINFO mas,TB_PERSONAL_INFO info
WHERE  info.company  = :p_company
AND    info.company      = mas.company
AND    mas.finyear         = :p_year
AND    mas.cardno        = info.cardno
AND    info.FLOORNO IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company    =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND    info.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.sectionnm,mas.cardno,mas.ca_leave,mas.aval_ca, mas.med_leave,mas.aval_med,mas.ear_leave,mas.aval_ear, mas.lwp_leave,  mas.aval_lwp,
              info.empname,info.designation,info.departmentnm,info.lineno, mas.com_leave, mas.aval_com, mas.other_leave,  mas.aval_other,  mas.spl_leave,  mas.aval_spl
FROM   TB_LEAVE_MASTERINFO mas,TB_PERSONAL_INFO info
WHERE  info.company  = :p_company
AND    info.company      = mas.company
AND    mas.finyear         = :p_year
AND    mas.cardno        = info.cardno
AND    info.MACHINENO IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company    =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND    info.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.sectionnm,mas.cardno,mas.ca_leave,mas.aval_ca, mas.med_leave,mas.aval_med,mas.ear_leave,mas.aval_ear, mas.lwp_leave,  mas.aval_lwp,
              info.empname,info.designation,info.departmentnm,info.lineno, mas.com_leave, mas.aval_com, mas.other_leave,  mas.aval_other,  mas.spl_leave,  mas.aval_spl
FROM   TB_LEAVE_MASTERINFO mas,TB_PERSONAL_INFO info
WHERE  info.company  = :p_company
AND    info.company      = mas.company
AND    mas.finyear         = :p_year
AND    mas.cardno        = info.cardno
AND    info.WORKERTYPE IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company    =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND    info.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
--UNION
--SELECT info.sectionnm,mas.cardno,mas.ca_leave,mas.aval_ca, mas.med_leave,mas.aval_med,mas.ear_leave,mas.aval_ear, mas.lwp_leave,  mas.aval_lwp,
--              info.empname,info.designation,info.departmentnm,info.lineno, mas.com_leave, mas.aval_com, mas.other_leave,  mas.aval_other,  mas.spl_leave,  mas.aval_spl
--FROM   TB_LEAVE_MASTERINFO mas,TB_PERSONAL_INFO info
--WHERE  info.company  = :p_company
--AND    info.company      = mas.company
--AND    mas.finyear         = :p_year
--AND    mas.cardno        = info.cardno
--AND    mas.leave_type IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company    =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
--AND    info.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.sectionnm,mas.cardno,mas.ca_leave,mas.aval_ca, mas.med_leave,mas.aval_med,mas.ear_leave,mas.aval_ear, mas.lwp_leave,  mas.aval_lwp,
              info.empname,info.designation,info.departmentnm,info.lineno, mas.com_leave, mas.aval_com, mas.other_leave,  mas.aval_other,  mas.spl_leave,  mas.aval_spl
FROM   TB_LEAVE_MASTERINFO mas,TB_PERSONAL_INFO info
WHERE  info.company  = :p_company
AND    info.company      = mas.company
AND    mas.finyear         = :p_year
AND    mas.cardno        = info.cardno
AND    info.LINENO IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company    =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND    info.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.sectionnm,mas.cardno,mas.ca_leave,mas.aval_ca, mas.med_leave,mas.aval_med,mas.ear_leave,mas.aval_ear, mas.lwp_leave,  mas.aval_lwp,
              info.empname,info.designation,info.departmentnm,info.lineno, mas.com_leave, mas.aval_com, mas.other_leave,  mas.aval_other,  mas.spl_leave,  mas.aval_spl
FROM   TB_LEAVE_MASTERINFO mas,TB_PERSONAL_INFO info
WHERE  info.company  = :p_company
AND    info.company      = mas.company
AND    mas.finyear         = :p_year
AND    mas.cardno        = info.cardno
AND    info.SHIFT IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company    =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND    info.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.sectionnm,mas.cardno,mas.ca_leave,mas.aval_ca, mas.med_leave,mas.aval_med,mas.ear_leave,mas.aval_ear, mas.lwp_leave,  mas.aval_lwp,
              info.empname,info.designation,info.departmentnm,info.lineno, mas.com_leave, mas.aval_com, mas.other_leave,  mas.aval_other,  mas.spl_leave,  mas.aval_spl
FROM   TB_LEAVE_MASTERINFO mas,TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul
WHERE  info.company  = :p_company
AND    info.company      = mas.company
AND    info.company   = mul.company
AND    mas.finyear         = :p_year
AND    mul.USER_NAME =  :p_user
AND    mas.cardno        = info.cardno
AND    mas.cardno       = mul.cardno
ORDER BY sectionnm,lineno,cardno ASC
