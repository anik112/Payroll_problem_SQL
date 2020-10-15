select
substr(to_char(instarttime,'hh24:mi:ss AM'),1,2)||substr(to_char(instarttime,'hh24:mi:ss AM'),4,2)||substr(to_char(instarttime,'hh24:mi:ss AM'),7,2) st_str_time,
instarttime
from TB_DUTY_SCHEDULE_SETUP




select substr(intime,1,2) intm_hr, substr(intime,4,2) intm_min, substr(intime,7,2) intm_sec,
substr(outtime,1,2) outtm_hr, substr(outtime,4,2) outtm_min, substr(outtime,7,2) outtm_sec, intime, outtime,
substr(duration,1,instr(duration,':')-1) dur_hr, substr(duration,instr(duration,':')+1) dur_min from tb_data_master


select info.SECTIONNM, sum(tmp.NETPAYMENT) 
from TB_MONTH_SALARY tmp, tb_personal_info info
where tmp.finyear=2020
and	  tmp.finmonth='February'
and	  info.ACTIVE=0
and	  info.CARDNO=tmp.CARDNO
group by info.SECTIONNM

--and	  cardno in (select cardno from tb_personal_info where active=0)