    select a.sectionnm , a.Total_Emp, b.Emp_0, c.Emp_60, d.Emp_120, e.Emp_180, f.Emp_240,
	       g.Emp_300, h.Emp_360, i.Emp_420, j.Emp_480, k.Emp_540, l.Emp_600, m.Emp_660, 
		   n.Emp_720, o.Privious_ot, p.Avg_otrate
	from 
	(select count(info.cardno)Total_Emp,info.sectionnm
	from   tb_personal_info info, tb_data_master mas
	where  info.company = :p_company
	and    mas.company  = :p_com
	and    mas.finyear  = :p_year
	and    mas.finmonth = :p_month
	and    mas.pdate    = :p_date
	and    (mas.OTMIN + mas.OTPART) > 0
	and    mas.cardno   = info.cardno
	group by info.sectionnm)a,
	(select count(info.cardno)Emp_0 ,info.sectionnm
	from   tb_personal_info info, tb_data_master mas
	where  info.company = :p_company
	and    mas.company  = :p_com
	and    mas.finyear  = :p_year
	and    mas.finmonth = :p_month
	and    mas.pdate    = :p_date
	and    (mas.OTMIN + mas.OTPART) = 0
	and    mas.cardno   = info.cardno
	group by info.sectionnm)b,
	(select count(info.cardno)Emp_60 ,info.sectionnm
	from   tb_personal_info info, tb_data_master mas
	where  info.company = :p_company
	and    mas.company  = :p_com
	and    mas.finyear  = :p_year
	and    mas.finmonth = :p_month
	and    mas.pdate    = :p_date
	and    (mas.OTMIN + mas.OTPART) = 60
	and    mas.cardno   = info.cardno
	group by info.sectionnm)c,
	(select count(info.cardno)Emp_120 ,info.sectionnm
	from   tb_personal_info info, tb_data_master mas
	where  info.company = :p_company
	and    mas.company  = :p_com
	and    mas.finyear  = :p_year
	and    mas.finmonth = :p_month
	and    mas.pdate    = :p_date
	and    (mas.OTMIN + mas.OTPART) = 120
	and    mas.cardno   = info.cardno
	group by info.sectionnm)d,
	(select count(info.cardno)Emp_180 ,info.sectionnm
	from   tb_personal_info info, tb_data_master mas
	where  info.company = :p_company
	and    mas.company  = :p_com
	and    mas.finyear  = :p_year
	and    mas.finmonth = :p_month
	and    mas.pdate    = :p_date
	and    (mas.OTMIN + mas.OTPART) = 180
	and    mas.cardno   = info.cardno
	group by info.sectionnm)e,
	(select count(info.cardno)Emp_240 ,info.sectionnm
	from   tb_personal_info info, tb_data_master mas
	where  info.company = :p_company
	and    mas.company  = :p_com
	and    mas.finyear  = :p_year
	and    mas.finmonth = :p_month
	and    mas.pdate    = :p_date
	and    (mas.OTMIN + mas.OTPART) = 240
	and    mas.cardno   = info.cardno
	group by info.sectionnm)f,
	(select count(info.cardno)Emp_300 ,info.sectionnm
	from   tb_personal_info info, tb_data_master mas
	where  info.company = :p_company
	and    mas.company  = :p_com
	and    mas.finyear  = :p_year
	and    mas.finmonth = :p_month
	and    mas.pdate    = :p_date
	and    (mas.OTMIN + mas.OTPART) = 300
	and    mas.cardno   = info.cardno
	group by info.sectionnm)g,
	(select count(info.cardno)Emp_360 ,info.sectionnm
	from   tb_personal_info info, tb_data_master mas
	where  info.company = :p_company
	and    mas.company  = :p_com
	and    mas.finyear  = :p_year
	and    mas.finmonth = :p_month
	and    mas.pdate    = :p_date
	and    (mas.OTMIN + mas.OTPART) = 360
	and    mas.cardno   = info.cardno
	group by info.sectionnm)h,
	(select count(info.cardno)Emp_420 ,info.sectionnm
	from   tb_personal_info info, tb_data_master mas
	where  info.company = :p_company
	and    mas.company  = :p_com
	and    mas.finyear  = :p_year
	and    mas.finmonth = :p_month
	and    mas.pdate    = :p_date
	and    (mas.OTMIN + mas.OTPART) = 420
	and    mas.cardno   = info.cardno
	group by info.sectionnm)i,
	(select count(info.cardno)Emp_480 ,info.sectionnm
	from   tb_personal_info info, tb_data_master mas
	where  info.company = :p_company
	and    mas.company  = :p_com
	and    mas.finyear  = :p_year
	and    mas.finmonth = :p_month
	and    mas.pdate    = :p_date
	and    (mas.OTMIN + mas.OTPART) = 480
	and    mas.cardno   = info.cardno
	group by info.sectionnm)j,
	(select count(info.cardno)Emp_540 ,info.sectionnm
	from   tb_personal_info info, tb_data_master mas
	where  info.company = :p_company
	and    mas.company  = :p_com
	and    mas.finyear  = :p_year
	and    mas.finmonth = :p_month
	and    mas.pdate    = :p_date
	and    (mas.OTMIN + mas.OTPART) = 540
	and    mas.cardno   = info.cardno
	group by info.sectionnm)k,
	(select count(info.cardno)Emp_600 ,info.sectionnm
	from   tb_personal_info info, tb_data_master mas
	where  info.company = :p_company
	and    mas.company  = :p_com
	and    mas.finyear  = :p_year
	and    mas.finmonth = :p_month
	and    mas.pdate    = :p_date
	and    (mas.OTMIN + mas.OTPART) = 600
	and    mas.cardno   = info.cardno
	group by info.sectionnm)l,
	(select count(info.cardno)Emp_660 ,info.sectionnm
	from   tb_personal_info info, tb_data_master mas
	where  info.company = :p_company
	and    mas.company  = :p_com
	and    mas.finyear  = :p_year
	and    mas.finmonth = :p_month
	and    mas.pdate    = :p_date
	and    (mas.OTMIN + mas.OTPART) = 660
	and    mas.cardno   = info.cardno
	group by info.sectionnm)m,
	(select count(info.cardno)Emp_720 ,info.sectionnm
	from   tb_personal_info info, tb_data_master mas
	where  info.company = :p_company
	and    mas.company  = :p_com
	and    mas.finyear  = :p_year
	and    mas.finmonth = :p_month
	and    mas.pdate    = :p_date
	and    (mas.OTMIN + mas.OTPART) = 720
	and    mas.cardno   = info.cardno
	group by info.sectionnm)n,
	(SELECT (SUM(OTMIN+OTPART)/60) Privious_ot ,info.sectionnm
	from   tb_personal_info info, tb_data_master mas
	where  info.company = :p_company
	and    mas.company  = :p_com
	and    mas.finyear  = :p_year
	and    mas.finmonth = :p_month
	and	   mas.PDATE BETWEEN to_date('1-'||:p_month||'-'||:p_year,'dd/mm/rrrr') AND (to_date(:p_date,'dd/mm/rrrr')-1)
	and	   mas.OTMIN>0
	and    mas.cardno   = info.cardno
	group by info.sectionnm)o,
	(SELECT ROUND(SUM(OT_RATE(info.GROSSSALARY, info.WORKERTYPE))/COUNT(info.CARDNO),2) Avg_otrate, info.sectionnm
	FROM   tb_personal_info info, tb_data_master mas
	where  info.company = :p_company
	and    mas.company  = :p_com
	and    mas.finyear  = :p_year
	and    mas.finmonth = :p_month
	and    mas.pdate    = :p_date
	and	   mas.OTMIN>0
	and    mas.cardno   = info.cardno
	group by info.sectionnm)p
where a.sectionnm = b.sectionnm(+)
and   a.sectionnm = c.sectionnm(+)
and   a.sectionnm = d.sectionnm(+)
and   a.sectionnm = e.sectionnm(+)
and   a.sectionnm = f.sectionnm(+)
and   a.sectionnm = g.sectionnm(+)
and   a.sectionnm = h.sectionnm(+)
and   a.sectionnm = i.sectionnm(+)	
and	  a.sectionnm =	j.sectionnm(+)
and	  a.sectionnm =	k.sectionnm(+)
and	  a.sectionnm =	l.sectionnm(+)
and	  a.sectionnm =	m.sectionnm(+)
and	  a.sectionnm =	n.sectionnm(+)
and	  a.sectionnm =	o.sectionnm(+)
and	  a.sectionnm =	p.sectionnm(+)		
order by a.sectionnm asc



-----------------


SELECT (SUM(mas.OTMIN+mas.OTPART)/60) Privious_ot ,info.sectionnm
	from   tb_personal_info info, tb_data_master mas
	where  info.company = :p_company
	and    mas.company  = :p_com
	and    mas.finyear  = :p_year
	and    mas.finmonth = :p_month
	and	   mas.PDATE BETWEEN to_date('1-'||:p_month||'-'||:p_year,'dd/mm/rrrr') AND (to_date(:p_date,'dd/mm/rrrr')-1)
	and	   mas.OTMIN>0
	and    mas.cardno   = info.cardno
	group by info.sectionnm