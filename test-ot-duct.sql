
update tb_data_master
set
outtime=(to_char(substr(outtime,1,instr(outtime,':')-1))-1)||substr(outtime,3),
duration=(to_char(substr(duration,1,instr(duration,':')-1))-1)||substr(duration,instr(duration,':')),
otpart=(otpart-60),
outtime_v=(to_char(substr(outtime_v,1,instr(outtime_v,':')-1))-1)||substr(outtime_v,3),
duration_v=(to_char(substr(duration_v,1,instr(duration_v,':')-1))-1)||substr(duration_v,instr(duration_v,':'))
where company=2
and	  finyear=2020
and	  finmonth='September'
and	  pdate='5-Sep-2020' 
and	  otpart>0
and	  cardno in (select cardno from done_cardnos)



----------------------------------



select count(cardno) from tb_data_master
where company=2
and	 finyear=2020
and	 finmonth='September'
and	 otpart>0
and	 pdate='23-Sep-2020'
and	 cardno not in (select cardno from tb_personal_info 
						where company='Apparel Plus Limited.' 
						and	  otorg='Y' 
						and	  otcom='Y'
						and	  joining_date between '1-Sep-2020' and '30-Sep-2020'
)
order by cardno asc






select * from tb_data_master
where company=2
and	 finyear=2020
and	 finmonth='September'
and	 otmin=0
and	 pdate='5-Sep-2020'
and	 cardno in (select cardno from tb_personal_info 
						where company='Apparel Plus Limited.' 
						and	  otorg='Y' 
						and	  otcom='Y'
						and	  joining_date between '1-Sep-2020' and '30-Sep-2020'
)
order by cardno asc





select * from tb_data_master mst, 
tb_personal_info info
where mst.finyear=2020
and	 mst.finmonth='September'
and	 mst.otmin=0
and	 mst.pdate='5-Sep-2020'
and	 info.COMPANY='Apparel Plus Limited.'
and	 info.ACTIVE=0
and  info.OTORG='Y'
and	 info.OTCOM='Y'
and	 info.CARDNO=mst.CARDNO



and	 info.cardno in (select cardno from tb_personal_info 
						where company='Apparel Plus Limited.' 
						and	  otorg='Y' 
						and	  otcom='Y'
						and	  joining_date between '1-Sep-2020' and '30-Sep-2020'
)


----------------------------


select pdate,
(to_char(substr(outtime,1,instr(outtime,':')-1))-1)||substr(outtime,3) mod_outtime, outtime,
(to_char(substr(duration,1,instr(duration,':')-1))-1)||substr(duration,instr(duration,':')) mod_duration, duration,
(otmin-60) mod_otmin, otmin, (otpart-60) mod_ot_part, otpart,
(to_char(substr(outtime_v,1,instr(outtime_v,':')-1))-1)||substr(outtime_v,3) mod_outtime_v, outtime_v,
(to_char(substr(duration_v,1,instr(duration_v,':')-1))-1)||substr(duration_v,instr(duration_v,':')) mod_duration_v, duration_v,
(otmin_v-60) mod_otmin_v, otmin_v
from tb_data_master 
where company=2
and	  finyear=2020
and	  finmonth='September'
and	  pdate='5-Sep-2020' 
and	  otpart>0
and	  cardno in (select cardno from done_cardnos)


-----------------------------


select pdate, cardno, otmin from tb_data_master
where company=2
and	 finyear=2020
and	 finmonth='September'
and	 otmin>60
order by cardno asc


select * from
(select count(pdate) datecount, cardno, sum(otmin)/60 othr from tb_data_master
	where company=2
	and	 finyear=2020
	and	 finmonth='September'
	and	 otmin>0
	and	 cardno not in (select cardno from tb_personal_info 
						where company='Apparel Plus Limited.' 
						and	  otorg='Y' 
						and	  otcom='Y'
						and	  joining_date between '1-Sep-2020' and '30-Sep-2020')
	group by cardno) tbl
where tbl.othr>15
and	  tbl.datecount>15
											
				
											
					
select cardno from tb_personal_info 
where company='Apparel Plus Limited.' 
and	  otorg='Y' 
and	  otcom='Y'
and	  active=0
and	  cardno not in (select cardno from tb_personal_info 
					where company='Apparel Plus Limited.' 
					and	  otorg='Y' 
					and	  otcom='Y'
					and	  joining_date between '1-Sep-2020' and '30-Sep-2020')



select pdate, cardno, otmin from tb_data_master
where company=2
and	 finyear=2020
and	 finmonth='September'
and	 otmin>60
and	 cardno='11906'
order by cardno asc



------------------------------------------------------





declare
v_othr number:=0;
v_cardno tb_personal_info.cardno%type;
v_otmin tb_data_master.otmin%type;
v_date	tb_data_master.pdate%type;

cursor cur_id is (select cardno from tb_personal_info 
where company='Apparel Plus Limited.' 
and	  otorg='Y' 
and	  otcom='Y'
and	  active=0
and	  cardno not in (select cardno from tb_personal_info 
					where company='Apparel Plus Limited.' 
					and	  otorg='Y' 
					and	  otcom='Y'
					and	  joining_date between '1-Sep-2020' and '30-Sep-2020'));
begin
OPEN cur_id; 
   LOOP 
   FETCH cur_id into v_cardno; 
      EXIT WHEN cur_id%notfound; 
	  
	  cursor cur_dates is 
	  select otmin, padte from tb_data_master
	  where finyear=2020
	  and 	finmonth='September'
	  and	otmin>0
	  and	cardno=v_cardno);
	  
	  open cur_dates;
	  loop
	  fetch cur_dates into v_otmin, v_date;
	  exit when cur_dates%notfound;
	  dbms_output.put_line(v_time||'  -- '||v_date||'\n');
	  end loop;
	  close cur_dates;
	  
      dbms_output.put_line(v_cardno||'  -- '||v_date);
   END LOOP; 
CLOSE cur_id; 
end;


select cardno, pdate, otmin from tb_data_master
where company=2
and	 finyear=2020
and	 finmonth='September'
and	 otmin>0
and	 pdate='5-Sep-2020'