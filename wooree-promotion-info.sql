SELECT prom.cardno,prom.empname,prom.prodesignation, 
               prom.joiningdate,prom.prosalary,prom.salarygrd,prom.remarks,prom.effectivedate,
              per.departmentnm, per.sectionnm, per.lineno, prom.currsalary, (prom.currsalary+prom.prosalary)grosssalary
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company  = :p_company
AND   prom.company      = per.company
AND   prom.effectivedate BETWEEN :sdate AND :edate
AND   prom.cardno         = per.cardno
AND   per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.sectionnm       LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   per.lineno              LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   prom.cardno          LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   per.designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   per.shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   per.gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm, per.sectionnm, prom.cardno, prom.effectivedate ASC



SELECT prom.cardno,prom.empname,prom.prodesignation,  prom.currdesignation,  per.designation,
       prom.joiningdate,prom.prosalary,prom.salarygrd,prom.remarks,prom.effectivedate,
	   per.departmentnm, per.sectionnm, per.lineno, prom.currsalary,per.grosssalary , (prom.currsalary + prom.prosalary)total_gross
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company      = :p_company
AND   prom.company       = per.company
AND   prom.cardno          = per.cardno
AND   per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.sectionnm       LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   per.lineno              LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   prom.cardno          LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   per.designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   per.shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   per.gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm, per.sectionnm, prom.cardno,prom.effectivedate ASC



SELECT prom.cardno,prom.empname,prom.prodesignation, 
       prom.joiningdate,prom.prosalary,prom.salarygrd,prom.remarks,prom.effectivedate,
	   per.departmentnm, per.sectionnm, per.lineno, prom.currsalary,  (prom.currsalary+prom.prosalary)grosssalary
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company      = :p_company
AND   prom.company       = per.company
AND   prom.proyear    =:p_year
AND   prom.finmonth  =:p_month
AND   prom.cardno          = per.cardno
AND   per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.sectionnm       LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   per.lineno              LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   prom.cardno          LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   per.designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   per.shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   per.gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm, per.sectionnm, prom.cardno , prom.effectivedate ASC



SELECT prom.cardno,prom.empname,prom.prodesignation, 
       prom.joiningdate, prom.prosalary, prom.salarygrd salarygrd,prom.remarks,prom.effectivedate,
	   prom.currsalary, (prom.prosalary + prom.currsalary)grosssalary, per.workertype, per.otorg, per.enmname_bangla,
                   prom.designation_bangla, prom.pro_desig_bangla, prom.departmentnm, prom.dept_bangla, prom.sectionnm, prom.sect_bangla, prom.lineno
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company  = :p_company
AND   prom.company    = per.company
AND   prom.proyear    = :p_year
AND   prom.finmonth  =  :p_month
AND   prom.cardno          = per.cardno
AND   per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.sectionnm       LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   per.lineno              LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   prom.cardno          LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   per.designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   per.shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   per.gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm, per.sectionnm, prom.cardno ASC


DECLARE

v_foodallow NUMBER;

v_otrate    NUMBER;

BEGIN
	
	v_foodallow := food_salary (:p_company, :grosssalary, :workertype);
	
	v_otrate := ot_rate(:p_company, :grosssalary, :workertype, :otorg);
	
	DBMS_OUTPUT.PUT_LINE(v_foodallow||', '||v_otrate);


EXCEPTION
	WHEN OTHERS THEN NULL;
END;




SELECT prom.cardno,prom.empname,prom.prodesignation, 
       prom.joiningdate, prom.prosalary, prom.salarygrd salarygrd,prom.remarks,prom.effectivedate,
	   prom.currsalary, (prom.prosalary + prom.currsalary)grosssalary, per.workertype, per.otorg,per.enmname_bangla,
                   prom.designation_bangla, prom.pro_desig_bangla, prom.departmentnm, prom.dept_bangla, prom.sectionnm, prom.sect_bangla, prom.lineno                   
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company  = :p_company
AND   prom.company    = per.company
AND   prom.proyear    =:p_year
AND   prom.finmonth  =:p_month
AND   prom.cardno          = per.cardno
AND   per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.sectionnm       LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   per.lineno              LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   prom.cardno          LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   per.designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   per.shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   per.gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm, per.sectionnm, prom.cardno ASC



SELECT prom.cardno,prom.empname,prom.prodesignation, prom.currdesignation,
       prom.joiningdate, prom.prosalary, prom.salarygrd salarygrd,prom.remarks,prom.effectivedate,
	   prom.currsalary, (prom.prosalary + prom.currsalary)grosssalary, per.workertype, per.otorg, per.enmname_bangla,
prom.designation_bangla, prom.pro_desig_bangla, prom.departmentnm, prom.dept_bangla, prom.sectionnm, prom.sect_bangla, prom.lineno, pro_sal_grd
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company  = :p_company
AND   prom.company    = per.company
AND   prom.proyear           =:p_year
AND   prom.finmonth  =:p_month
AND   prom.cardno          = per.cardno
AND   per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.sectionnm       LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   per.lineno              LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   prom.cardno          LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   per.designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   per.shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   per.gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm, per.sectionnm, prom.cardno ASC



SELECT prom.cardno,prom.empname,prom.prodesignation,  prom.currdesignation,
       prom.joiningdate, prom.prosalary, prom.salarygrd salarygrd,prom.remarks,prom.effectivedate,
	   prom.currsalary, (prom.prosalary + prom.currsalary)grosssalary, per.workertype, per.otorg, per.enmname_bangla,
                   prom.designation_bangla, prom.pro_desig_bangla, prom.departmentnm, prom.dept_bangla, prom.sectionnm, prom.sect_bangla, prom.lineno
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company  = :p_company
AND   prom.company    = per.company
AND   prom.proyear           =:p_year
AND   prom.finmonth  =:p_month
AND   prom.cardno          = per.cardno
AND   per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.sectionnm       LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   per.lineno              LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   prom.cardno          LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   per.designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   per.shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   per.gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm, per.sectionnm, prom.cardno ASC




SELECT prom.cardno,prom.empname,prom.prodesignation, 
       prom.joiningdate,prom.prosalary,prom.salarygrd,prom.remarks,prom.effectivedate, per.sec_bangla, per.designation_bangla, per.enmname_bangla,
	   per.departmentnm, per.sectionnm, per.lineno, prom.currsalary, (prom.currsalary+prom.prosalary)grosssalary, per.workertype, per.otorg
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company      = :p_company
AND   prom.company       = per.company
AND   prom.proyear    =:p_year
AND   prom.finmonth  =:p_month
AND   prom.remarks   = 'Adjustment'
AND   prom.cardno          = per.cardno
AND   per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.sectionnm       LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   per.lineno              LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   prom.cardno          LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   per.designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   prom.remarks LIKE DECODE(NVL(:p_incr_status,'all'),'all','%',:p_incr_status)
AND   per.shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   per.gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm, per.sectionnm, prom.cardno ASC



SELECT prom.cardno, prom.empname, prom.joiningdate, prom.currdesignation, prom prom.prodesignation, prom.currsalary, 
          prom.prosalary, prom.salarygrd, prom.effectivedate, prom.workertype, prom.remarks, prom.finmonth, 
          prom.pro_worker_type, prom.pro_sal_grd, emp.sectionnm, emp.departmentnm,
          (prom.currsalary + prom.prosalary)gross_salary, prom.basic_sal, prom.house_sal, prom.convence_sal, 
          prom.foodallow_sal, prom.otherallow_sal, prom.medical_sal
FROM     TB_PROMOTION_INFO prom,TB_PERSONAL_INFO emp 
WHERE prom.company  = :p_company
AND   prom.company      = emp.company
AND   prom.proyear        = :p_year
AND   prom.finmonth       = :p_month
AND   prom.cardno         = emp.cardno
AND   per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.sectionnm       LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   per.lineno              LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   prom.cardno          LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   per.designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   per.shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   per.gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   prom.remarks LIKE DECODE(NVL(:p_incr_status,'all'),'all','%',:p_incr_status)
AND   per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY prom.cardno ASC





SELECT prom.cardno,prom.empname,prom.prodesignation, 
               prom.joiningdate,prom.prosalary,prom.salarygrd,prom.remarks,prom.effectivedate,
               per.departmentnm, per.sectionnm, per.lineno, prom.currsalary,  (prom.currsalary+prom.prosalary)grosssalary
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company  = :p_company
AND   prom.company      = per.company
AND   prom.proyear         = :p_year
AND   prom.finmonth       = :p_month
AND   prom.cardno         = per.cardno
AND   per.departmentnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL AND user_name = :p_user)
AND   per.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT prom.cardno,prom.empname,prom.prodesignation, 
               prom.joiningdate,prom.prosalary,prom.salarygrd,prom.remarks,prom.effectivedate,
               per.departmentnm, per.sectionnm, per.lineno, prom.currsalary,  (prom.currsalary+prom.prosalary)grosssalary
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company  = :p_company
AND   prom.company      = per.company
AND   prom.proyear         = :p_year
AND   prom.finmonth       = :p_month
AND   prom.cardno         = per.cardno
AND   per.sectionnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL AND user_name = :p_user)
AND   per.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT prom.cardno,prom.empname,prom.prodesignation, 
               prom.joiningdate,prom.prosalary,prom.salarygrd,prom.remarks,prom.effectivedate,
               per.departmentnm, per.sectionnm, per.lineno, prom.currsalary,  (prom.currsalary+prom.prosalary)grosssalary
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company  = :p_company
AND   prom.company      = per.company
AND   prom.proyear         = :p_year
AND   prom.finmonth       = :p_month
AND   prom.cardno         = per.cardno
AND   per.designation IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL AND user_name = :p_user)
AND   per.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT prom.cardno,prom.empname,prom.prodesignation, 
       prom.joiningdate,prom.prosalary,prom.salarygrd,prom.remarks,prom.effectivedate,
	   per.departmentnm, per.sectionnm, per.lineno, prom.currsalary,per.grosssalary
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company  = :p_company
AND   prom.company             = per.company
AND   prom.proyear         = :p_year
AND   prom.finmonth        = :p_month
AND   prom.cardno               = per.cardno
AND   per.workertype IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL AND user_name = :p_user)
AND   per.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT prom.cardno,prom.empname,prom.prodesignation, 
               prom.joiningdate,prom.prosalary,prom.salarygrd,prom.remarks,prom.effectivedate,
               per.departmentnm, per.sectionnm, per.lineno, prom.currsalary,  (prom.currsalary+prom.prosalary)grosssalary
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company  = :p_company
AND   prom.company      = per.company
AND   prom.proyear         = :p_year
AND   prom.finmonth       = :p_month
AND   prom.cardno         = per.cardno
AND   per.floorno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL AND user_name = :p_user)
AND   per.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT prom.cardno,prom.empname,prom.prodesignation, 
               prom.joiningdate,prom.prosalary,prom.salarygrd,prom.remarks,prom.effectivedate,
               per.departmentnm, per.sectionnm, per.lineno, prom.currsalary,  (prom.currsalary+prom.prosalary)grosssalary
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company  = :p_company
AND   prom.company      = per.company
AND   prom.proyear         = :p_year
AND   prom.finmonth       = :p_month
AND   prom.cardno         = per.cardno
AND   per.machineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL AND user_name = :p_user)
AND   per.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT prom.cardno,prom.empname,prom.prodesignation, 
               prom.joiningdate,prom.prosalary,prom.salarygrd,prom.remarks,prom.effectivedate,
               per.departmentnm, per.sectionnm, per.lineno, prom.currsalary,  (prom.currsalary+prom.prosalary)grosssalary
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company  = :p_company
AND   prom.company      = per.company
AND   prom.proyear         = :p_year
AND   prom.finmonth       = :p_month
AND   prom.cardno         = per.cardno
AND   per.lineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL AND user_name = :p_user)
AND   per.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT prom.cardno,prom.empname,prom.prodesignation, 
               prom.joiningdate,prom.prosalary,prom.salarygrd,prom.remarks,prom.effectivedate,
               per.departmentnm, per.sectionnm, per.lineno, prom.currsalary,  (prom.currsalary+prom.prosalary)grosssalary
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company  = :p_company
AND   prom.company      = per.company
AND   prom.proyear         = :p_year
AND   prom.finmonth       = :p_month
AND   prom.cardno         = per.cardno
AND   per.shift IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL AND user_name = :p_user)
AND   per.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT prom.cardno,prom.empname,prom.prodesignation, 
               prom.joiningdate,prom.prosalary,prom.salarygrd,prom.remarks,prom.effectivedate,
               per.departmentnm, per.sectionnm, per.lineno, prom.currsalary,  (prom.currsalary+prom.prosalary)grosssalary
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per, TB_IDCARD_MULTIPLE mul
WHERE prom.company  = :p_company
AND   prom.company      = per.company
AND   prom.company         = mul.company
AND   prom.proyear         = :p_year
AND   prom.finmonth       = :p_month
AND   mul.user_name       = :p_user
AND   prom.cardno         = per.cardno
AND   prom.cardno          = mul.cardno




SELECT departmentnm, sectionnm, lineno, cardno, empname, 
       joining_date, designation, salary_grade, (grosssalary+gross_bk)  grosssalary ,
	   enmname_bangla, designation_bangla, dept_bangla, sec_bangla,workertype
FROM TB_PERSONAL_INFO
WHERE company                               = :p_company
AND   (grosssalary+gross_bk)                    > 0
AND   TO_CHAR(joining_date,'RRRR')         = :p_year - 1
AND   RTRIM(TO_CHAR(joining_date,'Month')) = :p_month
AND   per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.sectionnm       LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   per.lineno              LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   per.designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   per.shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   per.cardno          LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND   per.gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY departmentnm, sectionnm, lineno,cardno ASC



SELECT DEPARTMENTNM, SECTIONNM, LINENO, CARDNO, EMPNAME, 
       JOINING_DATE, DESIGNATION, SALARY_GRADE, GROSSSALARY  GROSSSALARY ,
	   ENMNAME_BANGLA, DESIGNATION_BANGLA, DEPT_BANGLA, SEC_BANGLA,WORKERTYPE
FROM TB_PERSONAL_INFO
WHERE company    = :p_company
AND   GROSSSALARY    > 0
AND   joining_date BETWEEN  :sdate AND :edate
AND   RTRIM(TO_CHAR(joining_date,'Month'))  = :p_month
AND   departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   sectionnm LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   lineno LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   cardno LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   DESIGNATION LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   WORKERTYPE LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   shift       LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   GENDER LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   ACTIVE LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY DEPARTMENTNM, SECTIONNM, LINENO,cardno ASC


FUNCTION CF_Increment_percentFormula RETURN NUMBER IS

v_yr_percent NUMBER;

BEGIN
  
  
   BEGIN
   SELECT figure INTO v_yr_percent
   FROM   TB_SETUP_INFO
   WHERE  ITEM_NAME    = 'Special_Increment'
   AND    emp_category = 'All';
   EXCEPTION
   	WHEN NO_DATA_FOUND THEN v_yr_percent := 0;
   	       WHEN OTHERS THEN v_yr_percent := 0;
   END;	
   
   RETURN v_yr_percent;
   
EXCEPTION
	WHEN OTHERS THEN v_yr_percent := 0;   
END;





SELECT cardno,secreteno,empname,joining_date,designation,grosssalary,lineno,sectionnm,departmentnm,
           father_name, present_address, birth_date, gender, bloodgroup,salary_grade, religion,wday, incr_amt inramt
FROM TB_PERSONAL_INFO
WHERE company =:p_company
AND   active       = 0
AND   incr_amt > 0 
AND   departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   sectionnm       LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   lineno              LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    cardno          LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY departmentnm,sectionnm,lineno,cardno ASC




SELECT per.departmentnm, per.sectionnm, per.lineno, per.cardno, per.empname, 
       per.joining_date, per.designation, per.salary_grade, (per.grosssalary+per.gross_bk)grosssalary,  per.workertype,
       ABS.tot_lev_one , ABS.attn_one, ABS.prsnt_one, ABS.absnt_one
FROM  TB_CLR_YR_ELEAVE_DAY ABS,TB_PERSONAL_INFO per
WHERE ABS.company  = per.company
AND   ABS.company  = :p_company
AND   ABS.finyear     = :p_year
AND   ABS.cardno   = per.cardno
AND   per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.sectionnm LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   per.designation LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.floorno LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   per.workertype LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   per.lineno LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   per.cardno LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   per.shift LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   per.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm, per.sectionnm, per.cardno ASC






SELECT departmentnm, sectionnm, lineno, cardno, empname, 
       joining_date, designation, salary_grade, grosssalary ,
	   enmname_bangla, designation_bangla, dept_bangla, sec_bangla,workertype
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   TO_CHAR(joining_date,'RRRR')         < :p_year 
AND   RTRIM(TO_CHAR(joining_date,'Month')) = :p_month
AND   departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   sectionnm LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   lineno LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   designation LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   workertype LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   shift       LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   cardno LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY cardno ASC