 SELECT a.sectionnm , a.Total_Emp, b.Emp_0, c.Emp_60, d.Emp_120, e.Emp_180, f.Emp_240,
	       g.Emp_300, h.Emp_360, i.Emp_420, j.Emp_480, k.Emp_540, l.Emp_600, m.Emp_660, 
		   n.Emp_720, o.Privious_ot, p.Avg_otrate
	FROM 
	(SELECT COUNT(info.cardno)Total_Emp,info.sectionnm
	FROM   TB_PERSONAL_INFO info, TB_DATA_MASTER mas
	WHERE  info.company = :p_company
	AND    mas.company  = :p_com
	AND    mas.finyear  = :p_year
	AND    mas.finmonth = :p_month
	AND    mas.pdate    = :p_date
	AND    (mas.OTMIN + mas.OTPART) > 0
	AND    mas.cardno   = info.cardno
	GROUP BY info.sectionnm)a,
	(SELECT COUNT(info.cardno)Emp_0 ,info.sectionnm
	FROM   TB_PERSONAL_INFO info, TB_DATA_MASTER mas
	WHERE  info.company = :p_company
	AND    mas.company  = :p_com
	AND    mas.finyear  = :p_year
	AND    mas.finmonth = :p_month
	AND    mas.pdate    = :p_date
	AND    (mas.OTMIN + mas.OTPART) = 0
	AND    mas.cardno   = info.cardno
	GROUP BY info.sectionnm)b,
	(SELECT COUNT(info.cardno)Emp_60 ,info.sectionnm
	FROM   TB_PERSONAL_INFO info, TB_DATA_MASTER mas
	WHERE  info.company = :p_company
	AND    mas.company  = :p_com
	AND    mas.finyear  = :p_year
	AND    mas.finmonth = :p_month
	AND    mas.pdate    = :p_date
	AND    (mas.OTMIN + mas.OTPART) = 60
	AND    mas.cardno   = info.cardno
	GROUP BY info.sectionnm)c,
	(SELECT COUNT(info.cardno)Emp_120 ,info.sectionnm
	FROM   TB_PERSONAL_INFO info, TB_DATA_MASTER mas
	WHERE  info.company = :p_company
	AND    mas.company  = :p_com
	AND    mas.finyear  = :p_year
	AND    mas.finmonth = :p_month
	AND    mas.pdate    = :p_date
	AND    (mas.OTMIN + mas.OTPART) = 120
	AND    mas.cardno   = info.cardno
	GROUP BY info.sectionnm)d,
	(SELECT COUNT(info.cardno)Emp_180 ,info.sectionnm
	FROM   TB_PERSONAL_INFO info, TB_DATA_MASTER mas
	WHERE  info.company = :p_company
	AND    mas.company  = :p_com
	AND    mas.finyear  = :p_year
	AND    mas.finmonth = :p_month
	AND    mas.pdate    = :p_date
	AND    (mas.OTMIN + mas.OTPART) = 180
	AND    mas.cardno   = info.cardno
	GROUP BY info.sectionnm)e,
	(SELECT COUNT(info.cardno)Emp_240 ,info.sectionnm
	FROM   TB_PERSONAL_INFO info, TB_DATA_MASTER mas
	WHERE  info.company = :p_company
	AND    mas.company  = :p_com
	AND    mas.finyear  = :p_year
	AND    mas.finmonth = :p_month
	AND    mas.pdate    = :p_date
	AND    (mas.OTMIN + mas.OTPART) = 240
	AND    mas.cardno   = info.cardno
	GROUP BY info.sectionnm)f,
	(SELECT COUNT(info.cardno)Emp_300 ,info.sectionnm
	FROM   TB_PERSONAL_INFO info, TB_DATA_MASTER mas
	WHERE  info.company = :p_company
	AND    mas.company  = :p_com
	AND    mas.finyear  = :p_year
	AND    mas.finmonth = :p_month
	AND    mas.pdate    = :p_date
	AND    (mas.OTMIN + mas.OTPART) = 300
	AND    mas.cardno   = info.cardno
	GROUP BY info.sectionnm)g,
	(SELECT COUNT(info.cardno)Emp_360 ,info.sectionnm
	FROM   TB_PERSONAL_INFO info, TB_DATA_MASTER mas
	WHERE  info.company = :p_company
	AND    mas.company  = :p_com
	AND    mas.finyear  = :p_year
	AND    mas.finmonth = :p_month
	AND    mas.pdate    = :p_date
	AND    (mas.OTMIN + mas.OTPART) = 360
	AND    mas.cardno   = info.cardno
	GROUP BY info.sectionnm)h,
	(SELECT COUNT(info.cardno)Emp_420 ,info.sectionnm
	FROM   TB_PERSONAL_INFO info, TB_DATA_MASTER mas
	WHERE  info.company = :p_company
	AND    mas.company  = :p_com
	AND    mas.finyear  = :p_year
	AND    mas.finmonth = :p_month
	AND    mas.pdate    = :p_date
	AND    (mas.OTMIN + mas.OTPART) = 420
	AND    mas.cardno   = info.cardno
	GROUP BY info.sectionnm)i,
	(SELECT COUNT(info.cardno)Emp_480 ,info.sectionnm
	FROM   TB_PERSONAL_INFO info, TB_DATA_MASTER mas
	WHERE  info.company = :p_company
	AND    mas.company  = :p_com
	AND    mas.finyear  = :p_year
	AND    mas.finmonth = :p_month
	AND    mas.pdate    = :p_date
	AND    (mas.OTMIN + mas.OTPART) = 480
	AND    mas.cardno   = info.cardno
	GROUP BY info.sectionnm)j,
	(SELECT COUNT(info.cardno)Emp_540 ,info.sectionnm
	FROM   TB_PERSONAL_INFO info, TB_DATA_MASTER mas
	WHERE  info.company = :p_company
	AND    mas.company  = :p_com
	AND    mas.finyear  = :p_year
	AND    mas.finmonth = :p_month
	AND    mas.pdate    = :p_date
	AND    (mas.OTMIN + mas.OTPART) = 540
	AND    mas.cardno   = info.cardno
	GROUP BY info.sectionnm)k,
	(SELECT COUNT(info.cardno)Emp_600 ,info.sectionnm
	FROM   TB_PERSONAL_INFO info, TB_DATA_MASTER mas
	WHERE  info.company = :p_company
	AND    mas.company  = :p_com
	AND    mas.finyear  = :p_year
	AND    mas.finmonth = :p_month
	AND    mas.pdate    = :p_date
	AND    (mas.OTMIN + mas.OTPART) = 600
	AND    mas.cardno   = info.cardno
	GROUP BY info.sectionnm)l,
	(SELECT COUNT(info.cardno)Emp_660 ,info.sectionnm
	FROM   TB_PERSONAL_INFO info, TB_DATA_MASTER mas
	WHERE  info.company = :p_company
	AND    mas.company  = :p_com
	AND    mas.finyear  = :p_year
	AND    mas.finmonth = :p_month
	AND    mas.pdate    = :p_date
	AND    (mas.OTMIN + mas.OTPART) = 660
	AND    mas.cardno   = info.cardno
	GROUP BY info.sectionnm)m,
	(SELECT COUNT(info.cardno)Emp_720 ,info.sectionnm
	FROM   TB_PERSONAL_INFO info, TB_DATA_MASTER mas
	WHERE  info.company = :p_company
	AND    mas.company  = :p_com
	AND    mas.finyear  = :p_year
	AND    mas.finmonth = :p_month
	AND    mas.pdate    = :p_date
	AND    (mas.OTMIN + mas.OTPART) = 720
	AND    mas.cardno   = info.cardno
	GROUP BY info.sectionnm)n,
	(SELECT (SUM(mas.OTMIN+mas.OTPART)/60) Privious_ot ,info.sectionnm
	FROM   TB_PERSONAL_INFO info, TB_DATA_MASTER mas
	WHERE  info.company = :p_company
	AND    mas.company  = :p_com
	AND    mas.finyear  = :p_year
	AND    mas.finmonth = :p_month
	AND    mas.PDATE BETWEEN TO_DATE('1-'||:p_month||'-'||:p_year,'dd/mm/rrrr') AND (TO_DATE(:p_date,'dd/mm/rrrr')-1)
	AND    mas.OTMIN>0
	AND    mas.cardno   = info.cardno
	GROUP BY info.sectionnm)o,
	(SELECT ROUND(SUM(OT_RATE(info.GROSSSALARY, info.WORKERTYPE))/COUNT(info.CARDNO),2) Avg_otrate, info.sectionnm
	FROM   TB_PERSONAL_INFO info, TB_DATA_MASTER mas
	WHERE  info.company = :p_company
	AND    mas.company  = :p_com
	AND    mas.finyear  = :p_year
	AND    mas.finmonth = :p_month
	AND    mas.pdate    = :p_date
	AND	   mas.OTMIN>0
	AND    mas.cardno   = info.cardno
	GROUP BY info.sectionnm)p
WHERE a.sectionnm = b.sectionnm(+)
AND   a.sectionnm = c.sectionnm(+)
AND   a.sectionnm = d.sectionnm(+)
AND   a.sectionnm = e.sectionnm(+)
AND   a.sectionnm = f.sectionnm(+)
AND   a.sectionnm = g.sectionnm(+)
AND   a.sectionnm = h.sectionnm(+)
AND   a.sectionnm = i.sectionnm(+)	
AND	  a.sectionnm =	j.sectionnm(+)
AND	  a.sectionnm =	k.sectionnm(+)
AND	  a.sectionnm =	l.sectionnm(+)
AND	  a.sectionnm =	m.sectionnm(+)
AND	  a.sectionnm =	n.sectionnm(+)
AND	  a.sectionnm =	o.sectionnm(+)
AND	  a.sectionnm =	p.sectionnm(+)		
ORDER BY a.sectionnm ASC