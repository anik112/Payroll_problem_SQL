(select cardno, count(pdate) from tb_data_master mst
where finyear=2020
and	  finmonth='December'
group by cardno)
minus

select mst.cardno, count(mst.pdate), tmp.cardno, count(tmp.pdate) 
from tb_data_master mst, tb_data_master_temp tmp
where mst.finyear=2020
and	  mst.finmonth='December'
and	  tmp.finyear=mst.finyear
and	  tmp.finmonth=mst.finmonth
and	  tmp.pdate=mst.pdate
and	  tmp.cardno=mst.cardno
group by mst.cardno, tmp.cardno



select cardno, count(pdate) from tb_data_master
where finyear=2020
and	  finmonth='December'
group by cardno, pdate


select cardno, pdate, intime, outtime, duration, latestatus from tb_data_master_temp
where finyear=2020
and	  finmonth='December'
and	  latestatus='Late'
and	  (cardno,pdate) not in (
select cardno,pdate from tb_data_master
where finyear=2020
and	  finmonth='December'
and	  latestatus='Late'
)

--- select data 

select mst.cardno, mst.pdate, tmp.intime com_initme, mst.intime org_intime, 
tmp.latehr com_latehr, mst.latehr org_latehr, 
tmp.latestatus comp_satus, mst.latestatus org_status, 
tmp.duration comp_duration, mst.duration org_duration, 
tmp.lateded comp_lateded, mst.lateded org_lateded
from  tb_data_master_temp tmp, tb_data_master mst
where tmp.COMPANY=mst.COMPANY
and	  tmp.finyear=mst.finyear
and	  tmp.finmonth=mst.finmonth
and	  tmp.pdate=mst.pdate
and	  tmp.cardno=mst.cardno
and	  tmp.finyear=2020
and	  tmp.finmonth='December'
and	  tmp.latestatus='Late'
and	  (tmp.cardno,tmp.pdate) not in (
	select cardno,pdate from tb_data_master
	where finyear=2020
	and	  finmonth='December'
	and	  latestatus='Late')
	
	
	-------- update data  
update tb_data_master_temp tmp
set (tmp.intime, tmp.latehr, tmp.latestatus, tmp.lateded)=
(select mst.intime, 0, mst.latestatus, 0 from tb_data_master mst
	where mst.COMPANY=tmp.COMPANY
	and	  mst.finyear=tmp.finyear
	and	  mst.finmonth=tmp.finmonth
	and	  mst.pdate=tmp.pdate
	and	  mst.cardno=tmp.cardno)
where tmp.finyear=2020
and	  tmp.finmonth='December'
and	  tmp.latestatus='Late'
and	  (tmp.cardno,tmp.pdate) not in (
	  select cardno,pdate from tb_data_master
	  where finyear=2020
	  and	  finmonth='December'
	  and	  latestatus='Late')