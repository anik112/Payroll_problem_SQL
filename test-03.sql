select pdate, sum(otmin)/60
from tb_data_master
where finyear=2021
and	  finmonth='January'
and	  sectionnm='Visor'
group by pdate



select  sum(mst.otmin)/60
from tb_data_master mst, tb_personal_info info
where mst.COMPANY=2
and	  mst.finyear=2021
and	  mst.finmonth='January'
and	  mst.sectionnm='Visor'
and	  info.PAY_SAL='Y'
and	  info.CASH_TYPE='CASH'
and	  info.BANK_NAME='CASH'
and	  info.ACTIVE=0
and	  info.COMPANY='9 Star Apparels Industries Ltd.'
and	  info.CARDNO=mst.CARDNO


--------------------------------------


select info.cardno, sum(mst.otmin)/60
from tb_data_master mst, tb_personal_info info
where mst.company=2
and	  mst.finyear=2021
and	  mst.finmonth='January'
and	  info.COMPANY='Natural Denims Ltd.'
and	  info.SECTIONNM='Sewing' 
and	  info.ACTIVE=0
and	  info.JOINING_DATE between '01-Jan-2021' and '30-Jan-2021'
and	  mst.cardno=info.cardno
group by info.cardno
order by info.cardno asc


---------------



select cardno
from tb_month_salary sal, tb_personal_info info
where sal.finyear=2021
and	  sal.finmonth='January'
and	  info.COMPANY='Natural Denims Ltd.'
and	  info.SECTIONNM='Sewing' 
and	  info.ACTIVE=0
and	  info.JOINING_DATE between '01-Jan-2021' and '30-Jan-2021'
and	  info.OTCOM='Y'
and	  info.OTORG='Y'
and	  sal.cardno=sal.cardno
group by info.cardno
order by info.cardno asc



------------------------



select * from
(select info.cardno, sum(mst.otmin)/60 org_ot
from tb_data_master mst, tb_personal_info info
where mst.company=2
and	  mst.finyear=2021
and	  mst.finmonth='January'
and	  mst.pdate not in ('01-Jan-2021', '08-Jan-2021', '15-Jan-2021','22-Jan-2021', '29-Jan-2021' )
and	  info.COMPANY='Natural Denims Ltd.'
and	  info.SECTIONNM='Sewing' 
and	  info.ACTIVE=1
and	  info.OTCOM='Y'
and	  info.OTORG='Y'
and	  info.RESIGNATION_DATE between '01-Jan-2021' and '30-Jan-2021'
and	  mst.cardno=info.cardno
group by info.cardno
order by info.cardno asc) a,
(select info.cardno, sum(tld.otmin+tld.otminpart+tld.holiday_ot) sal_ot
from tb_month_totalday tld, tb_personal_info info
where tld.company='Natural Denims Ltd.'
and	  info.COMPANY=tld.COMPANY
and	  tld.finyear=2021
and	  tld.finmonth='January'
and	  info.SECTIONNM='Sewing' 
and	  info.ACTIVE=1
and	  info.RESIGNATION_DATE between '01-Jan-2021' and '30-Jan-2021'
and	  tld.cardno=info.cardno
group by info.cardno
order by info.cardno asc) b,
(select info.cardno, sum((substr(mst.duration,0,instr(mst.duration,':')-1))-1) holiday_ot
from tb_data_master mst, tb_personal_info info
where mst.company=2
and	  mst.finyear=2021
and	  mst.finmonth='January'
and	  mst.pdate in ('01-Jan-2021', '08-Jan-2021', '15-Jan-2021','22-Jan-2021', '29-Jan-2021' )
and	  info.COMPANY='Natural Denims Ltd.'
and	  info.SECTIONNM='Sewing' 
and	  info.ACTIVE=0
and	  info.RESIGNATION_DATE between '01-Jan-2021' and '30-Jan-2021'
and	  info.OTCOM='Y'
and	  info.OTORG='Y'
and	  mst.cardno=info.cardno
group by info.cardno
order by info.cardno asc) c
where a.CARDNO=b.CARDNO(+) 
and	   a.cardno=c.cardno(+)


---------------------------------------------------------







select cardno, sum(substr(mst.duration,0,instr(mst.duration,':')-1)) holiday_ot
from tb_data_master mst, tb_personal_info info
where mst.company=2
and	  mst.finyear=2021
and	  mst.finmonth='January'
and	  mst.pdate in ('01-Jan-2021', '08-Jan-2021', '15-Jan-2021','22-Jan-2021', '29-Jan-2021' )
and	  info.COMPANY='Natural Denims Ltd.'
and	  info.SECTIONNM='Sewing' 
and	  info.ACTIVE=0
and	  info.JOINING_DATE between '01-Jan-2021' and '30-Jan-2021'
and	  mst.cardno=info.cardno
group by cardno
order by cardno asc

select * from
(select info.cardno, sum(mst.otmin)/60 org_ot
from tb_data_master mst, tb_personal_info info
where mst.company=2
and	  mst.finyear=2021
and	  mst.finmonth='January'
and	  mst.pdate not in ('01-Jan-2021', '08-Jan-2021', '15-Jan-2021','22-Jan-2021', '29-Jan-2021' )
and	  info.COMPANY='Natural Denims Ltd.'
and	  info.SECTIONNM='Sewing' 
and	  info.ACTIVE=0
and	  info.JOINING_DATE between '01-Jan-2021' and '30-Jan-2021'
and	  mst.cardno=info.cardno
group by info.cardno
order by info.cardno asc) a,
(select info.cardno, sum(tld.otmin+tld.otminpart+tld.holiday_ot) sal_ot
from tb_month_totalday tld, tb_personal_info info
where tld.company='Natural Denims Ltd.'
and	  info.COMPANY=tld.COMPANY
and	  tld.finyear=2021
and	  tld.finmonth='January'
and	  info.SECTIONNM='Sewing' 
and	  info.ACTIVE=0
and	  info.JOINING_DATE between '01-Jan-2021' and '30-Jan-2021'
and	  tld.cardno=info.cardno
group by info.cardno
order by info.cardno asc) b,
(select info.cardno, sum((substr(mst.duration,0,instr(mst.duration,':')-1))-1) holiday_ot
from tb_data_master mst, tb_personal_info info
where mst.company=2
and	  mst.finyear=2021
and	  mst.finmonth='January'
and	  mst.pdate in ('01-Jan-2021', '08-Jan-2021', '15-Jan-2021','22-Jan-2021', '29-Jan-2021' )
and	  info.COMPANY='Natural Denims Ltd.'
and	  info.SECTIONNM='Sewing' 
and	  info.ACTIVE=0
and	  info.JOINING_DATE between '01-Jan-2021' and '30-Jan-2021'
and	  info.OTCOM='Y'
and	  info.OTORG='Y'
and	  mst.cardno=info.cardno
group by info.cardno
order by info.cardno asc) c
where a.CARDNO=b.CARDNO(+) 
and	   a.cardno=c.cardno(+)