SELECT a.cardno, a.empname, a.lineno, a.sectionnm, a.totalcnt, 
       b.fifteen, c.tweenty , d.thirty,  e.forty, a.designation
FROM 
(SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM,info.designation, NVL(COUNT(info.cardno),0) totalcnt
FROM  tb_data_master mapp,tb_personal_info info ,TB_IDCARD_MULTIPLE mul
WHERE info.company       = :p_company 
AND   mapp.company      = :p_com
AND   info.company      = mul.company
AND   info.DEPARTMENTNM = :p_dept 
AND   mapp.finyear        = :p_year
AND   mapp.finmonth     = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   mul.USER_NAME = :p_user
AND   info.cardno          = mapp.cardno
AND   info.cardno         = mul.cardno
GROUP BY info.cardno,info.empname,info.lineno,info.SECTIONNM,info.designation
ORDER BY info.SECTIONNM,info.lineno,info.cardno ASC
)a,
(SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM, NVL(COUNT(info.cardno),0) fifteen
FROM  tb_data_master mapp,tb_personal_info info ,TB_IDCARD_MULTIPLE mul
WHERE info.company       = :p_company 
AND   mapp.company      = :p_com
AND   info.company      = mul.company
AND   info.DEPARTMENTNM = :p_dept 
AND   mapp.finyear        = :p_year
AND   mapp.finmonth     = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   mapp.latehr BETWEEN 0 AND 15
AND   mul.USER_NAME = :p_user
AND   info.cardno          = mapp.cardno
AND   info.cardno          = mul.cardno
GROUP BY info.cardno,info.empname,info.lineno,info.SECTIONNM
ORDER BY info.SECTIONNM,info.lineno,info.cardno ASC
)b,
(SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM, NVL(COUNT(info.cardno),0) tweenty
FROM  tb_data_master mapp,tb_personal_info info ,TB_IDCARD_MULTIPLE mul
WHERE info.company       = :p_company 
AND   mapp.company      = :p_com
AND   info.company      = mul.company
AND   info.DEPARTMENTNM = :p_dept 
AND   mapp.finyear        = :p_year
AND   mapp.finmonth     = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   mapp.latehr BETWEEN 16 AND 20
AND   mul.USER_NAME = :p_user
AND   info.cardno          = mapp.cardno
AND   info.cardno          = mul.cardno
GROUP BY info.cardno,info.empname,info.lineno,info.SECTIONNM
ORDER BY info.SECTIONNM,info.lineno,info.cardno ASC
)c,
(SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM, NVL(COUNT(info.cardno),0) thirty
FROM  tb_data_master mapp,tb_personal_info info ,TB_IDCARD_MULTIPLE mul
WHERE info.company      = :p_company 
AND   mapp.company      = :p_com
AND   info.company      = mul.company
AND   info.DEPARTMENTNM = :p_dept 
AND   mapp.finyear      = :p_year
AND   mapp.finmonth   = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   mapp.latehr BETWEEN 21 AND 30
AND   mul.USER_NAME = :p_user
AND   info.cardno        = mapp.cardno
AND   info.cardno       = mul.cardno
GROUP BY info.cardno,info.empname,info.lineno,info.SECTIONNM
ORDER BY info.SECTIONNM,info.lineno,info.cardno ASC
)d,
(SELECT info.cardno,info.empname,info.lineno,info.SECTIONNM, NVL(COUNT(info.cardno),0) forty
FROM  tb_data_master mapp,tb_personal_info info ,TB_IDCARD_MULTIPLE mul
WHERE info.company      = :p_company 
AND   mapp.company      = :p_com
AND   info.company      = mul.company
AND   info.DEPARTMENTNM = :p_dept 
AND   mapp.finyear       = :p_year
AND   mapp.finmonth    = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   mapp.latehr >= 31
AND   mul.USER_NAME = :p_user
AND   info.cardno         = mapp.cardno
AND   info.cardno        = mul.cardno
GROUP BY info.cardno,info.empname,info.lineno,info.SECTIONNM
ORDER BY info.SECTIONNM,info.lineno,info.cardno ASC
)e
WHERE a.cardno = b.cardno (+)
AND   a.cardno = c.cardno (+)
AND   a.cardno = d.cardno (+)
AND   a.cardno = e.cardno (+)
