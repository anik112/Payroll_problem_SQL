
SELECT  a.sectionnm, a.total_emp total_emp, NVL(b.total_t17,0) total_t17,
        NVL(c.total_t19,0) total_t19, NVL(d.total_t22,0) total_t22,NVL(e.total_t24,0) total_t24,
		NVL(f.total_t05,0) total_t05,
		(NVL(b.total_t17,0) + NVL(c.total_t19,0) + NVL(d.total_t22,0) + NVL(e.total_t24,0) + NVL(f.total_t05,0)) total_tt
FROM 
(SELECT info.sectionnm, NVL(COUNT(info.cardno),0) total_emp
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company   = :p_company 
AND   mapp.company   = :p_com
AND   mapp.finyear   = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate     = :p_date
AND   mapp.outtime IS NOT NULL 
AND   mapp.cardno    = info.cardno 
GROUP BY info.sectionnm
ORDER BY info.sectionnm ASC)a,
(SELECT info.sectionnm, NVL(COUNT(info.cardno),0) total_t17
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company   = :p_company 
AND   mapp.company   = :p_com
AND   mapp.finyear      = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate     = :p_date
AND   ((mapp.outtime BETWEEN  '08:00:01 AM' AND '11:59:59 AM') OR  (mapp.outtime BETWEEN  '12:00:00 PM' AND '17:00:00 PM'))
AND   mapp.outtime IS NOT NULL 
AND   mapp.cardno    = info.cardno 
GROUP BY info.sectionnm)b,
(SELECT info.sectionnm, NVL(COUNT(info.cardno),0) total_t19
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company   = :p_company 
AND   mapp.company   = :p_com
AND   mapp.finyear   = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate     = :p_date
AND   mapp.outtime BETWEEN  '17:00:01 PM' AND '20:00:00 PM'
AND   mapp.outtime IS NOT NULL 
AND   mapp.cardno    = info.cardno 
GROUP BY info.sectionnm)c,
(SELECT info.sectionnm, NVL(COUNT(info.cardno),0) total_t22
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company   = :p_company 
AND   mapp.company   = :p_com
AND   mapp.finyear   = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate     = :p_date
AND   mapp.outtime BETWEEN  '20:00:01 PM' AND '22:00:00 PM'
AND   mapp.outtime IS NOT NULL 
AND   mapp.cardno    = info.cardno 
GROUP BY info.sectionnm)d,
(SELECT info.sectionnm, NVL(COUNT(info.cardno),0) total_t24
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company   = :p_company 
AND   mapp.company   = :p_com
AND   mapp.finyear   = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate     = :p_date
AND   mapp.outtime BETWEEN  '22:00:01 PM' AND '23:59:59 PM'
AND   mapp.outtime IS NOT NULL 
AND   mapp.cardno    = info.cardno 
GROUP BY info.sectionnm)e,
(SELECT info.sectionnm, NVL(COUNT(info.cardno),0) total_t05
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company   = :p_company 
AND   mapp.company   = :p_com
AND   mapp.finyear   = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate     = :p_date
AND   mapp.outtime BETWEEN  '00:00:01 AM' AND '06:40:01 AM'
AND   mapp.outtime IS NOT NULL 
AND   mapp.cardno    = info.cardno 
GROUP BY info.sectionnm)f
WHERE  a.sectionnm    = b.sectionnm(+)
AND    a.sectionnm    = c.sectionnm(+)
AND    a.sectionnm    = d.sectionnm(+)
AND    a.sectionnm    = e.sectionnm(+)
AND    a.sectionnm    = f.sectionnm(+)
ORDER BY a.sectionnm ASC