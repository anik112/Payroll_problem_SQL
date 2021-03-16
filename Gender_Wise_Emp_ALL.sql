SELECT COUNT(*) grade_emp, NVL(salary_grade,'Not Define') sal_grade, NVL(designation,'Not Define') designation, 
       MAX(grosssalary + gross_bk) max_gross, MIN(grosssalary + gross_bk) min_gross 
FROM  TB_PERSONAL_INFO
WHERE company =:v_company
AND   TO_CHAR(joining_date,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
AND   lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
GROUP BY salary_grade, designation
ORDER BY salary_grade,designation ASC









--------------- F3  



SELECT COUNT(*) grade_emp, NVL(departmentnm,'Not Define') deparment, NVL(designation,'Not Define') designation, 
       MAX(grosssalary+gross_bk) max_gross, MIN(grosssalary+gross_bk)min_gross 
FROM  TB_PERSONAL_INFO
WHERE company  = :v_company
AND   departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   sectionnm    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   workertype   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   designation  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   floorno      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
AND   lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   shift        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY departmentnm, designation
ORDER BY departmentnm,designation ASC


-------------------------- F4    


SELECT COUNT(*)Grade_Emp, NVL(SECTIONNM,'Not Define')sections, NVL(DESIGNATION,'Not Define')Designation, 
       NVL((GROSSSALARY+GROSS_BK),0)GROSS
FROM   TB_PERSONAL_INFO
WHERE  company  =:v_company
AND   departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   sectionnm     LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   workertype    LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   designation   LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   floorno           LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
AND   lineno            LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   shift               LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   active            LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY SECTIONNM, DESIGNATION, (GROSSSALARY + GROSS_BK)
ORDER BY SECTIONNM,DESIGNATION, (GROSSSALARY + GROSS_BK) ASC





------------------------------ F5  



SELECT COUNT(*)Grade_Emp,NVL(SALARY_GRADE,'Nil')Sal_Grade, SUM(GROSSSALARY+GROSS_BK)Total_GROSS, 
       MAX(GROSSSALARY+GROSS_BK)Max_GROSS, MIN(GROSSSALARY+GROSS_BK)Min_GROSS,
	   ROUND((SUM(GROSSSALARY+GROSS_BK)/COUNT(cardno)),2)Avg_Salary 
FROM   TB_PERSONAL_INFO
WHERE  company  =:v_company
AND   active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND   DEPARTMENTNM    LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   SECTIONNM LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   WORKERTYPE LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   DESIGNATION LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   FLOORNO LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   MACHINENO LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
AND   lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   SHIFT LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
GROUP BY SALARY_GRADE
ORDER BY SALARY_GRADE ASC	



------------------------------- F6  


SELECT COUNT(*)Grade_Emp,NVL(SALARY_GRADE,'Nil')Sal_Grade, SUM(GROSSSALARY+GROSS_BK)Total_GROSS, 
       MAX(GROSSSALARY+GROSS_BK)Max_GROSS, MIN(GROSSSALARY+GROSS_BK)Min_GROSS,
	   ROUND((SUM(GROSSSALARY+GROSS_BK)/COUNT(cardno)),2)Avg_Salary 
FROM  TB_PERSONAL_INFO
WHERE company = :v_company
AND   departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   sectionnm     LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   workertype    LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   designation   LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   floorno           LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
AND   lineno            LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   shift               LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   active            LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY SALARY_GRADE
ORDER BY SALARY_GRADE ASC	



--------------------------------- F7   


SELECT COUNT(*)grade_emp, NVL(departmentnm,'Not Define')dept, NVL(designation,'Not Define')designation, 
       SUM(grosssalary+gross_bk)total_gross, NVL(sectionnm,'Not Define')SECTION
FROM  TB_PERSONAL_INFO
WHERE company  =:v_company
AND   departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   sectionnm     LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   workertype    LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   designation   LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   floorno           LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
AND   lineno            LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   shift               LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   active            LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY departmentnm, sectionnm, designation
ORDER BY departmentnm, sectionnm, designation ASC





AND   departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   sectionnm     LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   workertype    LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   designation   LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   floorno           LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   machineno    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
AND   lineno            LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   shift               LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   active            LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)