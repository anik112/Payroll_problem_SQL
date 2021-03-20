SELECT a.cardno, a.yr, b.mn, a.empname,a.designation,a.joining_date,a.departmentnm,a.sectionnm, a.lineno,a.grosssalary
FROM 
    (SELECT cardno, empname,designation,joining_date,departmentnm,sectionnm,lineno, (grosssalary + gross_bk)grosssalary, duration_yr(:p_date, joining_date)yr
    FROM    TB_PERSONAL_INFO 
    WHERE   company  =  :p_company
    AND     departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
    AND     sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND     designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
    AND     workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
    AND     floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND     machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
    AND     lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
    AND     shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
    AND     gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
    AND     cardno            LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
    AND     active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
    ) a,
    (SELECT cardno, duration_mn(:p_date, joining_date)mn
    FROM    TB_PERSONAL_INFO
    WHERE   company  =  :p_company
    AND     departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
    AND     sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND     designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
    AND     workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
    AND     floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND     machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
    AND     lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
    AND     shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
    AND     gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
    AND     cardno            LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
    AND     active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
    ) b
WHERE a.cardno = b.cardno	  
AND   a.yr         LIKE DECODE(NVL( :p_year,'all'),'all','%',:p_year)
AND   b.mn       LIKE DECODE(NVL( :p_month,'all'),'all','%',:p_month)
ORDER BY a.cardno ASC


-------------------


SELECT a.cardno, a.yr, b.mn, a.empname,a.designation,a.joining_date,a.departmentnm,a.sectionnm, a.lineno,a.grosssalary
FROM 
    (SELECT cardno, empname,designation,joining_date,departmentnm,sectionnm,lineno, (grosssalary + gross_bk)grosssalary, duration_yr(:p_date, joining_date)yr
    FROM    TB_PERSONAL_INFO 
    WHERE   company  =  :p_company
    AND     departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
    AND     sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND     designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
    AND     workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
    AND     floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND     machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
    AND     lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
    AND     shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
    AND     gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
    AND     cardno            LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
    AND     active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
    ) a,
    (SELECT cardno, duration_mn(:p_date, joining_date)mn
    FROM    TB_PERSONAL_INFO
    WHERE   company  =  :p_company
    AND     departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
    AND     sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND     designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
    AND     workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
    AND     floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND     machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
    AND     lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
    AND     shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
    AND     gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
    AND     cardno            LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
    AND     active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
    ) b
WHERE  a.cardno  = b.cardno	  
AND  a.yr   >= :p_year 
AND  b.mn  LIKE DECODE(NVL( :p_month,'all'),'all','%',:p_month)
ORDER BY a.cardno ASC


------------------  F2    --------------------------------------------------------------------------------

SELECT a.cardno, a.yr, b.mn, a.empname,a.designation,a.joining_date,a.departmentnm,a.sectionnm, a.lineno,a.grosssalary, a.workertype
FROM 
    (SELECT cardno, empname,designation,joining_date,departmentnm,sectionnm,lineno, (grosssalary + gross_bk)grosssalary, workertype,
    duration_yr(:p_date, joining_date)yr
    FROM    TB_PERSONAL_INFO 
    WHERE   company  =  :p_company
    AND     departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
    AND     sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND     designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
    AND     workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
    AND     floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND     machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
    AND     lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
    AND     shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
    AND     gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
    AND     cardno            LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
    AND     active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
    ) a,
    (SELECT cardno, duration_mn(:p_date, joining_date)mn
    FROM    TB_PERSONAL_INFO
    WHERE   company  =  :p_company
    AND     departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
    AND     sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND     designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
    AND     workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
    AND     floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND     machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
    AND     lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
    AND     shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
    AND     gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
    AND     cardno            LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
    AND     active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
    ) b
WHERE a.cardno = b.cardno	  
AND   a.yr         LIKE DECODE(NVL( :p_year,'all'),'all','%',:p_year)
AND   b.mn       LIKE DECODE(NVL( :p_month,'all'),'all','%',:p_month)
ORDER BY a.cardno ASC

----------------
SELECT a.cardno, a.yr, b.mn, a.empname,a.designation,a.joining_date,a.departmentnm,a.sectionnm, a.lineno,a.grosssalary, a.workertype
FROM 
    (SELECT cardno, empname,designation,joining_date,departmentnm,sectionnm,lineno, (grosssalary + gross_bk)grosssalary, workertype,
    duration_yr(:p_date, joining_date)yr
    FROM    TB_PERSONAL_INFO 
    WHERE   company  =  :p_company
    AND     departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
    AND     sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND     designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
    AND     workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
    AND     floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND     machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
    AND     lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
    AND     shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
    AND     gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
    AND     cardno            LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
    AND     active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
    ) a,
    (SELECT cardno, duration_mn(:p_date, joining_date)mn
    FROM    TB_PERSONAL_INFO
    WHERE   company  =  :p_company
    AND     departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
    AND     sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
    AND     designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
    AND     workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
    AND     floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND     machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
    AND     lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
    AND     shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
    AND     gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
    AND     cardno            LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
    AND     active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
    ) b
WHERE a.cardno = b.cardno	  
AND  a.yr   >= :p_year 
AND   b.mn       LIKE DECODE(NVL( :p_month,'all'),'all','%',:p_month)
ORDER BY a.cardno ASC



----------------- selected  



SELECT a.cardno, a.yr, b.mn, a.empname,a.designation,a.joining_date,a.departmentnm,a.sectionnm, a.lineno,a.grosssalary
FROM 
    (SELECT info.cardno, info.empname, info.designation, info.joining_date, info.departmentnm, info.sectionnm,
	    info.lineno, (info.grosssalary + info.gross_bk)grosssalary, duration_yr(:p_date, info.joining_date)yr
    FROM      TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul
    WHERE   info.company         = :p_company
    AND         info.company         = mul.company
    AND         mul.USER_NAME = :p_user
    AND         info.cardno            = mul.cardno
    ) a,
    (SELECT info.cardno, duration_mn(:p_date, info.joining_date)mn
    FROM     TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul
    WHERE  info.company         = :p_company
    AND        info.company         = mul.company
    AND        mul.USER_NAME = :p_user
    AND        info.cardno            = mul.cardno
    ) b
WHERE a.cardno = b.cardno	  
AND   a.yr    LIKE DECODE(NVL( :p_year,'all'),'all','%',:p_year)
AND   b.mn  LIKE DECODE(NVL( :p_month,'all'),'all','%',:p_month)
ORDER BY a.cardno ASC

---------------------


SELECT a.cardno, a.yr, b.mn, a.empname,a.designation,a.joining_date,a.departmentnm,a.sectionnm, a.lineno,a.grosssalary
FROM 
    (SELECT info.cardno, info.empname, info.designation, info.joining_date, info.departmentnm, info.sectionnm,
	        info.lineno, (info.grosssalary + info.gross_bk)grosssalary, duration_yr(:p_date, info.joining_date)yr
    FROM    TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul
    WHERE   info.company  = :p_company
    AND     info.company  = mul.company
    AND     mul.user_name = :p_user
    AND     info.cardno   = mul.cardno
    ) a,
    (SELECT info.cardno, duration_mn(:p_date, info.joining_date)mn
    FROM    TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul
    WHERE   info.company  = :p_company
    AND     info.company  = mul.company
    AND     mul.user_name = :p_user
    AND     info.cardno   = mul.cardno
    ) b
WHERE  a.cardno  = b.cardno	  
AND  a.yr    >=  :p_year 
AND  b.mn  LIKE DECODE(NVL( :p_month,'all'),'all','%',:p_month)
ORDER BY a.cardno ASC




-------------------- F2    ----------------------------------------------------------------------



SELECT a.cardno, a.yr, b.mn, a.empname,a.designation,a.joining_date,a.departmentnm,a.sectionnm, a.lineno,a.grosssalary, a.workertype
FROM 
    (SELECT info.cardno, info.empname, info.designation, info.joining_date, info.departmentnm, info.sectionnm,
    info.lineno, (info.grosssalary + info.gross_bk)grosssalary, info.workertype,
    duration_yr(:p_date, joining_date)yr
    FROM    TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul
    WHERE  info.company         = :p_company
    AND        info.company         = mul.company
    AND        mul.USER_NAME = :p_user
    AND        info.cardno            = mul.cardno
    ) a,
    (SELECT info.cardno, duration_mn(:p_date, info.joining_date)mn
    FROM    TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul
    WHERE  info.company         = :p_company
    AND        info.company         = mul.company
    AND        mul.USER_NAME = :p_user
    AND        info.cardno            = mul.cardno
    ) b
WHERE a.cardno = b.cardno	  
AND   a.yr         LIKE DECODE(NVL( :p_year,'all'),'all','%',:p_year)
AND   b.mn       LIKE DECODE(NVL( :p_month,'all'),'all','%',:p_month)
ORDER BY a.cardno ASC




---------------------



SELECT a.cardno, a.yr, b.mn, a.empname,a.designation,a.joining_date,a.departmentnm,a.sectionnm, a.lineno,a.grosssalary, a.workertype
FROM 
    (SELECT info.cardno, info.empname, info.designation, info.joining_date, info.departmentnm, info.sectionnm,
    info.lineno, (info.grosssalary + info.gross_bk)grosssalary, info.workertype,
    duration_yr(:p_date, joining_date)yr
    FROM    TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul
    WHERE  info.company         = :p_company
    AND        info.company         = mul.company
    AND        mul.USER_NAME = :p_user
    AND        info.cardno            = mul.cardno
    ) a,
    (SELECT info.cardno, duration_mn(:p_date, info.joining_date)mn
    FROM    TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul
    WHERE  info.company         = :p_company
    AND        info.company         = mul.company
    AND        mul.USER_NAME = :p_user
    AND        info.cardno            = mul.cardno
    ) b
WHERE a.cardno = b.cardno	  
AND   a.yr           >= :p_year 
AND   b.mn         LIKE DECODE(NVL( :p_month,'all'),'all','%',:p_month)
ORDER BY a.cardno ASC