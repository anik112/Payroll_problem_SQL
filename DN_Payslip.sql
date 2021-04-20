
select info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
          mapp.duration,round(mapp.otmin/60)othr,round(mapp.otmin/60)||':00' ot,
        info.sectionnm,info.departmentnm, info.designation , info.joining_date
from  tb_data_master  mapp,tb_personal_info info 
where info.company   =:p_company 
and   mapp.company  = :p_com
and   mapp.finyear       = to_char(:p_date,'rrrr')
and   mapp.finmonth    = rtrim(to_char(:p_date,'Month'))
and   mapp.pdate       =:p_date 
and   mapp.dinner  = 1
and   info.cardno        = mapp.cardno
and   info.departmentnm    like decode(nvl(:p_dept,'all'),'all','%',:p_dept) 
and   info.sectionnm          like decode(nvl(:p_section,'all'),'all','%',:p_section)
and   info.designation        like decode(nvl(:p_designation,'all'),'all','%',:p_designation)
and   info.workertype         like decode(nvl(:p_wtype,'all'),'all','%',:p_wtype) 
and   info.floorno                like decode(nvl(:p_floorno,'all'),'all','%',:p_floorno) 
and   info.machineno         like decode(nvl(:p_machineno,'all'),'all','%',:p_machineno)
and   info.lineno                 like decode(nvl(:p_line,'all'),'all','%',:p_line)  
and   info.shift                    like decode(nvl(:p_shift,'all'),'all','%',:p_shift)
and   info.cash_type          like decode(nvl(:p_payment_type,'all'),'all','%',:p_payment_type) 
and   info.bank_name        like decode(nvl(:p_bkname,'all'),'all','%',:p_bkname) 
and   info.mft_type             like decode(nvl(:p_mft_type,'all'),'all','%',:p_mft_type)
and   info.gender               like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.cardno               like decode(nvl(:p_card,'all'),'all','%',:p_card)  
and   info.active                like decode(nvl(:p_active,'all'),'all','%',:p_active)
order by info.lineno,info.cardno asc