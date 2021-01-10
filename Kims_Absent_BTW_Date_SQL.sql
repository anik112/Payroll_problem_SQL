select info.cardno,info.empname,info.lineno,info.SECTIONNM,info.designation,
       info.joining_date, info.DEPARTMENTNM, absent.pDATE
from  tb_personal_info info,TB_EMP_ABSENT_DAYS absent 
where  info.company =:p_company 
AND  info.company   = absent.company
and    info.active       = 0
and    info.CARDNO = absent.CARDNO
and    info.DEPARTMENTNM    like decode(nvl(:p_dept,'all'),'all','%',:p_dept) 
and    info.SECTIONNM like decode(nvl(:p_section,'all'),'all','%',:p_section)
and    info.lineno       like decode(nvl(:p_line,'all'),'all','%',:p_line)
and    info.cardno       like decode(nvl(:p_card,'all'),'all','%',:p_card)
order by info.DEPARTMENTNM,info.SECTIONNM,info.CARDNO,absent.pDATE asc



-- Block
select count(cardno) into v_tmp_counter 
from   tb_data_master
where  company  = rec.comid
and    finyear  = to_char(v_date,'RRRR') 
and    finmonth = rtrim(to_char(v_date,'Month'))
and    pdate    = v_date 
and    cardno   = rec.cardno;