SELECT per.cardno, per.empname , per.DESIGNATION, levinfo.SLNO, levinfo.reason, per.SECTIONNM, per.DEPARTMENTNM,per.lineno,levinfo.FINYEAR, 
levinfo.FINMONTH, levinfo.PROCESSDATE, levinfo.REMARKS,levinfo.START_DATE,levinfo.END_DATE, levinfo.LEAVE_TYPE
FROM   TB_LEAVE_DETAILINFO levinfo, TB_PERSONAL_INFO per
WHERE  per.company    = :p_company
AND    per.company     = levinfo.company
AND    levinfo.finYEAR       =:p_year
AND    levinfo.CARDNO     = per.cardno
AND    per.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.designation      LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation) 
AND    per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno) 
AND    per.machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno) 
AND    per.workertype       LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND    levinfo.leave_type  LIKE DECODE(NVL(:p_leavetype,'all'),'all','%',:p_leavetype)
AND    per.lineno               LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno) 
AND    per.shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    per.cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.active               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.DEPARTMENTNM, per.SECTIONNM, per.lineno, levinfo.slno, levinfo.cardno ASC