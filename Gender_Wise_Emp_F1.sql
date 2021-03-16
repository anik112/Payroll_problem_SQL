SELECT a.gen_wise_emp, a.gender, b.total_emp_gender , ROUND((a.gen_wise_emp*100)/b.total_emp_gender ,2) gender_wise_percent
FROM  
    (SELECT COUNT(*) gen_wise_emp,NVL(gender,'Not Define') gender 
    FROM  TB_PERSONAL_INFO
    WHERE company = :v_company
    AND   departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
    AND   sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND   workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
    AND   designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
    AND   floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND   machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
    AND   lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
    AND   shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
    AND   active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
    GROUP BY gender
    ORDER BY gender ASC
    )a,
    (SELECT COUNT(*) total_emp_gender
    FROM  TB_PERSONAL_INFO
    WHERE company =:v_company
    AND   departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
    AND   sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND   workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
    AND   designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
    AND   floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND   machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
    AND   lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
    AND   shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
    AND   active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
    )b
	
	
	
------------------------------------ 




SELECT a.grade_wise_emp, a.sal_grade, b.total_emp_grade, ROUND((a.grade_wise_emp * 100)/b.total_emp_grade,2) grd_wise_percent
FROM
    (SELECT COUNT(*)grade_wise_emp,NVL(salary_grade,'Not Define')sal_grade 
    FROM  TB_PERSONAL_INFO
    WHERE company =:v_company
    AND   departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
    AND   sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND   workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
    AND   designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
    AND   floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND   machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
    AND   lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
    AND   shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
    AND   active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
    GROUP BY salary_grade
    ORDER BY salary_grade ASC
    )a,
    (SELECT COUNT(*) total_emp_grade
    FROM  TB_PERSONAL_INFO
    WHERE company =:v_company
    AND   departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
    AND   sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND   workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
    AND   designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
    AND   floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND   machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
    AND   lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
    AND   shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
    AND   active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
    )b
	
	
----------------------------------


SELECT a.salary_wise_emp, a.salary, b.total_emp_sal, ROUND((a.salary_wise_emp * 100)/b.total_emp_sal,2) sal_wise_percent
FROM 
    (SELECT COUNT(*) salary_wise_emp,NVL((grosssalary + gross_bk), 0) salary 
    FROM  TB_PERSONAL_INFO
    WHERE company  =:v_company
    AND   departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
    AND   sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND   workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
    AND   designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
    AND   floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND   machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
    AND   lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
    AND   shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
    AND   active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
    GROUP BY (grosssalary + gross_bk)
    ORDER BY (grosssalary + gross_bk) ASC
    )a,
    (SELECT COUNT(*) total_emp_sal 
    FROM  TB_PERSONAL_INFO
    WHERE company =:v_company
    AND   departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
    AND   sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND   workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
    AND   designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
    AND   floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND   machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
    AND   lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
    AND   shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
    AND   active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
    )b
	
	
-------------------------------------



SELECT a.gender_join, a.gender_join_emp, b.total_join_emp, ROUND((a.gender_join_emp * 100)/b.total_join_emp,2) join_wise_percent
FROM 
    (SELECT COUNT(*)gender_join_emp, NVL(gender,'Not Define') gender_join 
    FROM  TB_PERSONAL_INFO
    WHERE company = :v_company
    AND   TO_CHAR(joining_date,'RRRR')         = :p_year
    AND   RTRIM(TO_CHAR(joining_date,'Month')) = :p_month
    AND   departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
    AND   sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND   workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
    AND   designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
    AND   floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND   machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
    AND   lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
    AND   shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
    AND   active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
    GROUP BY gender
    ORDER BY gender ASC
    )a,
    (SELECT COUNT(*) total_join_emp 
    FROM   TB_PERSONAL_INFO
    WHERE company = :v_company
    AND   TO_CHAR(joining_date,'RRRR')         = :p_year
    AND   RTRIM(TO_CHAR(joining_date,'Month')) = :p_month
    AND   departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
    AND   sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND   workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
    AND   designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
    AND   floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND   machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
    AND   lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
    AND   shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
    AND   active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
    )b
	
	
	
--------------------------------------------



SELECT a.gender_resign, a.gender_resign_emp, b.total_resign_emp, ROUND((a.gender_resign_emp * 100)/b.total_resign_emp,2) resign_wise_percent
FROM 
    (SELECT COUNT(*)gender_resign_emp, NVL(gender,'Not Define')gender_resign  
    FROM  TB_PERSONAL_INFO
    WHERE company  = :v_company
    AND   TO_CHAR(resignation_date,'RRRR')         = :p_year
    AND   RTRIM(TO_CHAR(resignation_date,'Month')) = :p_month
    AND   departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
    AND   sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND   workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
    AND   designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
    AND   floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND   machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
    AND   lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
    AND   shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
    AND   active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
    GROUP BY gender
    ORDER BY gender ASC
    )a,
    (SELECT COUNT(*) total_resign_emp 
    FROM  TB_PERSONAL_INFO
    WHERE company  = :v_company
    AND   TO_CHAR(resignation_date,'RRRR')         = :p_year
    AND   RTRIM(TO_CHAR(resignation_date,'Month')) = :p_month
    AND   departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
    AND   sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND   workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
    AND   designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
    AND   floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND   machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
    AND   lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
    AND   shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
    AND   active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
    )b
	
-----------------------------



SELECT a.gender_salary, a.gender_sal_emp, b.total_sal_emp ,ROUND((a.gender_sal_emp * 100)/b.total_sal_emp ,2) gen_sal_wise_percent
FROM 
    (SELECT COUNT(emp.cardno) gender_sal_emp, NVL(emp.gender,'Not Define') gender_salary 
    FROM  TB_PERSONAL_INFO emp, TB_MONTH_SALARY sal
    WHERE emp.company  = :v_company
    AND   emp.company  = sal.company
    AND   sal.finyear  = :p_year
    AND   sal.finmonth = :p_month
    AND   sal.cardno   = emp.cardno
    AND   emp.departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
    AND   emp.sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND   emp.workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
    AND   emp.designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
    AND   emp.floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND   emp.machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
    AND   emp.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
    AND   emp.shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
    AND   emp.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
    GROUP BY gender
    ORDER BY gender ASC
    )a,
    (SELECT COUNT(emp.cardno) total_sal_emp 
    FROM  TB_PERSONAL_INFO emp, TB_MONTH_SALARY sal
    WHERE emp.company  = :v_company
    AND   emp.company  = sal.company
    AND   sal.finyear  = :p_year
    AND   sal.finmonth = :p_month
    AND   sal.cardno   = emp.cardno
    AND   emp.departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
    AND   emp.sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND   emp.workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
    AND   emp.designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
    AND   emp.floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND   emp.machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
    AND   emp.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
    AND   emp.shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
    AND   emp.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
    )b
	
	
	
	
	
	
	
	
	
	
	
	
    AND   departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
    AND   sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND   workertype      LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
    AND   designation     LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
    AND   floorno            LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND   machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
    AND   lineno             LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
    AND   shift                LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
    AND   active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)