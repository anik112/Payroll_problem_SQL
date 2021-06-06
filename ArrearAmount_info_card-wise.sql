SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.payamt ,arr.remarks , info.departmentnm,  info.lineno, arr.finyear, arr.finmonth, arr.reason_status
FROM   TB_ARREARAMOUNT_INFO arr,TB_PERSONAL_INFO info
WHERE  info.company     =:p_company
AND    info.company       =arr.company
AND    arr.cardno            = info.cardno
AND   info.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   info.sectionnm  LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.floorno LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno  LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   arr.reason_status LIKE DECODE(NVL(:p_rea_status,'all'),'all','%',:p_rea_status)
AND   arr.adjustment_status LIKE DECODE(NVL(:p_adj_status,'all'),'all','%',:p_adj_status)
AND   info.cardno LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   info.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.departmentnm, info.sectionnm, info.lineno,arr.cardno ASC