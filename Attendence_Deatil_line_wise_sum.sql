SELECT aa.lineno,aa.total_emp, NVL(a.total_prsnt,0)total_prsnt, NVL(bb.total_p0,0)total_p0,
       NVL(b.total_p30,0)total_p30,   NVL(c.total_p60,0)total_p60,   NVL(cc.total_p90,0)total_p90,
	   NVL(d.total_p120,0)total_p120, NVL(e.total_p150,0)total_p150, NVL(f.total_p180,0)total_p180,
	   NVL(g.total_p210,0)total_p210, NVL(h.total_p240,0)total_p240, NVL(i.total_p270,0)total_p270,
	   NVL(j.total_p300,0)total_p300, NVL(k.total_p330,0)total_p330, NVL(l.total_p360,0)total_p360,
	   NVL(m.total_p390,0)total_p390, NVL(n.total_p420,0)total_p420, NVL(o.total_p450,0)total_p450,
	   NVL(p.total_p480,0)total_p480, NVL(q.total_p510,0)total_p510, NVL(r.total_p540,0)total_p540,
	   NVL(s.total_p570,0)total_p570, NVL(t.total_p600,0)total_p600, NVL(u.total_p630,0)total_p630,
	   NVL(v.total_p660,0)total_p660, NVL(w.total_p690,0)total_p690, NVL(x.total_p720,0)total_p720,
	   NVL(y.total_p750,0)total_p750, NVL(z.total_p780,0)total_p780    
FROM 
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_emp
    FROM  TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   info.active        = 0 
    GROUP BY info.lineno
    ORDER BY info.lineno ASC
    )aa,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_prsnt
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company   = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   mapp.cardno     = info.cardno 
    GROUP BY info.lineno
    )a,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p0
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 0
    AND   mapp.cardno   = info.cardno  
    GROUP BY info.lineno
    )bb,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p30
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 30
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )b,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p60
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 60
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )c,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p90
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 90
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )cc,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p120
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 120
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )d,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p150
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 150
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )e,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p180
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 180
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )f,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p210
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 210
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )g,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p240
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 240
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )h,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p270 
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 270
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )i,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p300
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 300
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )j,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p330
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 330
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )k,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p360
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 360
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )l,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p390
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 390
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )m,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p420
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 420
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )n,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p450
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 450
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )o,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p480
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 480
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )p,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p510
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 510
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )q,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p540
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 540
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )r,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p570
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 570
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )s,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p600
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 600
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )t,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p630
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 630
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )u,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p660
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 660
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )v,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p690
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 690
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )w,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p720
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 720
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )x,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p750
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 750
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )y,
    (SELECT info.lineno, NVL(COUNT(info.cardno),0) total_p780
    FROM  TB_DATA_MASTER mapp,TB_PERSONAL_INFO info 
    WHERE info.company  = :p_company 
    AND   mapp.company  = :p_com
    AND   mapp.finyear      = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND   mapp.finmonth   = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND   mapp.pdate       = :p_date
    AND   (mapp.otmin + mapp.otpart) = 780
    AND   mapp.cardno   = info.cardno 
    GROUP BY info.lineno
    )z
WHERE  aa.lineno    = a.lineno(+)
AND    aa.lineno    = b.lineno(+)
AND    aa.lineno    = bb.lineno(+)
AND    aa.lineno    = c.lineno(+)
AND    aa.lineno    = cc.lineno(+)
AND    aa.lineno    = d.lineno(+)
AND    aa.lineno    = e.lineno(+)
AND    aa.lineno    = f.lineno(+)
AND    aa.lineno    = g.lineno(+)
AND    aa.lineno    = h.lineno(+)
AND    aa.lineno    = i.lineno(+)
AND    aa.lineno    = j.lineno(+)
AND    aa.lineno    = k.lineno(+)
AND    aa.lineno    = l.lineno(+)
AND    aa.lineno    = m.lineno(+)
AND    aa.lineno    = n.lineno(+)
AND    aa.lineno    = o.lineno(+)
AND    aa.lineno    = p.lineno(+)
AND    aa.lineno    = q.lineno(+)
AND    aa.lineno    = r.lineno(+)
AND    aa.lineno    = s.lineno(+)
AND    aa.lineno    = t.lineno(+)
AND    aa.lineno    = u.lineno(+)
AND    aa.lineno    = v.lineno(+)
AND    aa.lineno    = w.lineno(+)
AND    aa.lineno    = x.lineno(+)
AND    aa.lineno    = y.lineno(+)
AND    aa.lineno    = z.lineno(+)
