select info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
          mapp.duration,mapp.earlystatus,info.sectionnm,info.departmentnm, info.designation
from   tb_data_master mapp,tb_personal_info info 
where  info.company  = :p_company 
and   mapp.company  = :p_com
and   mapp.finyear      = to_char(:p_date,'rrrr')
and   mapp.finmonth   = rtrim(to_char(:p_date,'Month'))
and   mapp.pdate        = :p_date 
and   mapp.earlystatus is not null
and   info.cardno         = mapp.cardno
and   info.departmentnm    like decode(nvl(:p_dept,'all'),'all','%',:p_dept) 
and   info.sectionnm          like decode(nvl(:p_section,'all'),'all','%',:p_section)
and   info.designation        like decode(nvl(:p_designation,'all'),'all','%',:p_designation)
and   info.workertype         like decode(nvl(:p_woker,'all'),'all','%',:p_woker)
and   info.floorno               like decode(nvl(:p_floorno,'all'),'all','%',:p_floorno)
and   info.machineno         like decode(nvl(:p_machineno,'all'),'all','%',:p_machineno)
and   info.lineno                 like decode(nvl(:p_line,'all'),'all','%',:p_line)
and   info.shift                    like decode(nvl(:p_shift,'all'),'all','%',:p_shift)
and   info.gender               like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
and   info.cardno               like decode(nvl(:p_card,'all'),'all','%',:p_card) 
order by info.departmentnm,info.sectionnm,info.lineno,info.cardno asc


----------------------------




select info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
          mapp.duration,mapp.earlystatus,info.sectionnm,info.departmentnm, info.designation
from  tb_data_master mapp,tb_personal_info info 
where info.company    =:p_company 
and   mapp.company  =:p_com
and   mapp.finyear      = to_char(:p_date,'rrrr')
and   mapp.finmonth   = rtrim(to_char(:p_date,'Month'))
and   mapp.pdate       =:p_date 
and   mapp.earlystatus is not null
and   info.cardno       = mapp.cardno
and   info.departmentnm in (select item_name from tb_setup_item where company   =:p_company  and user_name = :p_user and  item_name is not null )
and   info.gender like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
union
select info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
          mapp.duration,mapp.earlystatus,info.sectionnm,info.departmentnm, info.designation
from  tb_data_master mapp,tb_personal_info info 
where info.company    =:p_company 
and   mapp.company  =:p_com
and   mapp.finyear      = to_char(:p_date,'rrrr')
and   mapp.finmonth   = rtrim(to_char(:p_date,'Month'))
and   mapp.pdate       =:p_date 
and   mapp.earlystatus is not null
and   info.cardno       = mapp.cardno
and   info.sectionnm in (select item_name from tb_setup_item where company   =:p_company  and user_name = :p_user and  item_name is not null )
and   info.gender like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
union
select info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
          mapp.duration,mapp.earlystatus,info.sectionnm,info.departmentnm, info.designation
from  tb_data_master mapp,tb_personal_info info 
where info.company    =:p_company 
and   mapp.company  =:p_com
and   mapp.finyear      = to_char(:p_date,'rrrr')
and   mapp.finmonth   = rtrim(to_char(:p_date,'Month'))
and   mapp.pdate       =:p_date 
and   mapp.earlystatus is not null
and   info.cardno       = mapp.cardno
and   info.designation in (select item_name from tb_setup_item where company   =:p_company  and user_name = :p_user and  item_name is not null )
and   info.gender like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
union
select info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
          mapp.duration,mapp.earlystatus,info.sectionnm,info.departmentnm, info.designation
from  tb_data_master mapp,tb_personal_info info 
where info.company    =:p_company 
and   mapp.company  =:p_com
and   mapp.finyear      = to_char(:p_date,'rrrr')
and   mapp.finmonth   = rtrim(to_char(:p_date,'Month'))
and   mapp.pdate       =:p_date 
and   mapp.earlystatus is not null
and   info.cardno       = mapp.cardno
and   info.workertype in (select item_name from tb_setup_item where company   =:p_company  and user_name = :p_user and  item_name is not null )
and   info.gender like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
union
select info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
          mapp.duration,mapp.earlystatus,info.sectionnm,info.departmentnm, info.designation
from  tb_data_master mapp,tb_personal_info info 
where info.company    =:p_company 
and   mapp.company  =:p_com
and   mapp.finyear      = to_char(:p_date,'rrrr')
and   mapp.finmonth   = rtrim(to_char(:p_date,'Month'))
and   mapp.pdate       =:p_date 
and   mapp.earlystatus is not null
and   info.cardno       = mapp.cardno
and   info.floorno in (select item_name from tb_setup_item where company   =:p_company  and user_name = :p_user and  item_name is not null )
and   info.gender like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
union
select info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
          mapp.duration,mapp.earlystatus,info.sectionnm,info.departmentnm, info.designation
from  tb_data_master mapp,tb_personal_info info 
where info.company    =:p_company 
and   mapp.company  =:p_com
and   mapp.finyear      = to_char(:p_date,'rrrr')
and   mapp.finmonth   = rtrim(to_char(:p_date,'Month'))
and   mapp.pdate       =:p_date 
and   mapp.earlystatus is not null
and   info.cardno       = mapp.cardno
and   info.machineno in (select item_name from tb_setup_item where company   =:p_company  and user_name = :p_user and  item_name is not null )
and   info.gender like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
union
select info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
          mapp.duration,mapp.earlystatus,info.sectionnm,info.departmentnm, info.designation
from  tb_data_master mapp,tb_personal_info info 
where info.company    =:p_company 
and   mapp.company  =:p_com
and   mapp.finyear      = to_char(:p_date,'rrrr')
and   mapp.finmonth   = rtrim(to_char(:p_date,'Month'))
and   mapp.pdate       =:p_date 
and   mapp.earlystatus is not null
and   info.cardno       = mapp.cardno
and   info.lineno in (select item_name from tb_setup_item where company   =:p_company  and user_name = :p_user and  item_name is not null )
and   info.gender like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
union
select info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
          mapp.duration,mapp.earlystatus,info.sectionnm,info.departmentnm, info.designation
from  tb_data_master mapp,tb_personal_info info 
where info.company    =:p_company 
and   mapp.company  =:p_com
and   mapp.finyear      = to_char(:p_date,'rrrr')
and   mapp.finmonth   = rtrim(to_char(:p_date,'Month'))
and   mapp.pdate       =:p_date 
and   mapp.earlystatus is not null
and   info.cardno       = mapp.cardno
and   info.shift         in (select item_name from tb_setup_item where company   =:p_company  and user_name = :p_user and  item_name is not null ) 
and   info.gender like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
union
select info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
          mapp.duration,mapp.earlystatus,info.sectionnm,info.departmentnm, info.designation
from  tb_data_master mapp,tb_personal_info info ,tb_idcard_multiple mul
where info.company   =:p_company 
and   info.company     =mul.company
and   mapp.company  =:p_com
and   mapp.finyear      = to_char(:p_date,'rrrr')
and   mapp.finmonth   = rtrim(to_char(:p_date,'Month'))
and   mapp.pdate       =:p_date 
and   info.cardno        =mul.cardno 
and   info.cardno        = mapp.cardno
and   mapp.earlystatus is not null 
and   info.gender like decode(nvl(:p_gender,'all'),'all','%',:p_gender)