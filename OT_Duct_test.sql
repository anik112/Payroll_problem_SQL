select count(cardno), pdate, sum(otmin), duration from tb_data_master where otmin>120 group by cardno, pdate, duration


select * from tb_personal_info where active=0 and otorg='Y'

select * from tb_data_master where pdate='2-May-2020' and otmin>0




--- update OT
select (to_char(substr(outtime,1,instr(outtime,':')-1))-1)||substr(outtime,3) mod_outtime, outtime,
(to_char(substr(duration,1,instr(duration,':')-1))-1)||substr(duration,instr(duration,':')) mod_duration, duration,
(otmin-60) mod_otmin, otmin,
(to_char(substr(outtime_v,1,instr(outtime_v,':')-1))-1)||substr(outtime_v,3) mod_outtime_v, outtime_v,
(to_char(substr(duration_v,1,instr(duration_v,':')-1))-1)||substr(duration_v,instr(duration_v,':')) mod_duration_v, duration_v,
(otmin_v-60) mod_otmin_v, otmin_v
from tb_data_master 
where company=2
and	  finyear=2020
and	  finmonth='May'
and	  pdate='2-May-2020' 
and   otmin>0



select cardno from tb_personal_info where company='9 Star Apparels Industries Ltd.' and active=0 and otorg='Y' and otcom='Y'




select * from tb_data_master 
where company=2
and	 finyear=2020
and	 finmonth='May'
and	 pdate='2-May-2020' 
and	 otmin>0
and	 cardno in (select cardno from tb_personal_info where company='9 Star Apparels Industries Ltd.' and active=0 and otorg='Y' and otcom='Y')



select * from tb_personal_info 
where  active=0 
and	   otorg='Y'
and	   otcom='Y'
and	   cardno in (select cardno from tb_data_master 
	   		  	 where	 company=2
				 and	 finyear=2020
				 and	 finmonth='May'
				 and	 pdate='2-May-2020' 
				 and	 otmin>0)
				 
				 
select * from
(select count(pdate) datecount, cardno, sum(otmin)/60 othr from tb_data_master
	where company=2
	and	 finyear=2020
	and	 finmonth='February'
	and	 otmin>0
	group by cardno) tbl
where tbl.othr>16


select pdate, cardno, otmin from tb_data_master
where company=2
and	 finyear=2020
and	 finmonth='February'
and	 otmin>60
order by cardno asc




select * from (
select tbl.cardno, count(tbl.pdate) cunt_date, sum(tbl.otmin) from  (
select cardno, pdate, otmin from tb_data_master
where company=2
and	 finyear=2020
and	 finmonth='September'
and	 otmin>0) tbl
where tbl.pdate between '5-Sep-2020' and '23-Sep-2020'
group by tbl.cardno
) tbl2
where tbl2.cunt_date=17


 ----------- must be OT have 5 to 23 sep

select * from (
select tbl.cardno, count(tbl.pdate) cunt_date, sum(tbl.otmin) from  (
select cardno, pdate, otmin from tb_data_master_temp
where company=2
and	 finyear=2020
and	 finmonth='September'
and	 otmin>0) tbl
where tbl.pdate between '5-Sep-2020' and '23-Sep-2020'
group by tbl.cardno
) tbl2
where tbl2.cunt_date=17