select distinct mov.ptime ,info.cardno,info.empname,info.designation,
               info.lineno,info.joining_date,info.departmentnm,info.sectionnm
from   tb_data_movement mov,tb_personal_info info
where  info.company = :p_company 
and    mov.company    = :p_com 
and    mov.pdate          = :p_date 
and    mov.cardno        = info.cardno 
and    info.departmentnm    like decode(nvl(:p_dept,'all'),'all','%',:p_dept)
and    info.sectionnm          like decode(nvl(:p_section,'all'),'all','%',:p_section)
and    info.designation        like decode(nvl(:p_designation,'all'),'all','%',:p_designation)
and    info.workertype         like decode(nvl(:p_woker,'all'),'all','%',:p_woker)
and    info.floorno                like decode(nvl(:p_floorno,'all'),'all','%',:p_floorno)
and    info.machineno         like decode(nvl(:p_machineno,'all'),'all','%',:p_machineno)
and    info.lineno                 like decode(nvl(:p_line,'all'),'all','%',:p_line)
and    info.shift                    like decode(nvl(:p_shift,'all'),'all','%',:p_shift)
and    info.gender               like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
and    info.cardno               like decode(nvl(:cardno,'all'),'all','%',:cardno)
order by info.lineno,info.cardno ,mov.ptime asc

--------------------------------------------------------

select distinct mov.ptime ,info.cardno,info.empname,info.designation,
               info.lineno,info.joining_date,info.departmentnm,info.sectionnm
from   tb_data_movement mov,tb_personal_info info
where  info.company = :p_company 
and    mov.company    = :p_com 
and    mov.pdate          = :p_date 
and    mov.cardno        = info.cardno 
and   info.departmentnm in (select item_name from tb_setup_item where company =:p_company  and user_name = :p_user and  item_name is not null ) 
and   info.gender            like decode(nvl(:p_gender,'all'),'all','%',:p_gender)	
union
select distinct mov.ptime ,info.cardno,info.empname,info.designation,
               info.lineno,info.joining_date,info.departmentnm,info.sectionnm
from   tb_data_movement mov,tb_personal_info info
where  info.company = :p_company 
and    mov.company    = :p_com 
and    mov.pdate          = :p_date 
and    mov.cardno        = info.cardno 
and   info.sectionnm    in (select item_name from tb_setup_item where company =:p_company  and user_name = :p_user and  item_name is not null ) 
and   info.gender       like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
union
select distinct mov.ptime ,info.cardno,info.empname,info.designation,
               info.lineno,info.joining_date,info.departmentnm,info.sectionnm
from   tb_data_movement mov,tb_personal_info info
where  info.company = :p_company 
and    mov.company    = :p_com 
and    mov.pdate          = :p_date 
and    mov.cardno        = info.cardno 
and   info.designation  in (select item_name from tb_setup_item where company =:p_company  and user_name = :p_user and  item_name is not null ) 
and   info.gender        like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
union
select distinct mov.ptime ,info.cardno,info.empname,info.designation,
               info.lineno,info.joining_date,info.departmentnm,info.sectionnm
from   tb_data_movement mov,tb_personal_info info
where  info.company = :p_company 
and    mov.company    = :p_com 
and    mov.pdate          = :p_date 
and    mov.cardno        = info.cardno 
and   info.workertype   in  (select item_name from tb_setup_item where company =:p_company  and user_name = :p_user and  item_name is not null ) 
and   info.gender                  like decode(nvl(:p_gender,'all'),'all','%',:p_gender)	
union
select distinct mov.ptime ,info.cardno,info.empname,info.designation,
               info.lineno,info.joining_date,info.departmentnm,info.sectionnm
from   tb_data_movement mov,tb_personal_info info
where  info.company = :p_company 
and    mov.company    = :p_com 
and    mov.pdate          = :p_date 
and    mov.cardno        = info.cardno 
and   info.floorno      in (select item_name from tb_setup_item where company   =:p_company  and user_name = :p_user and  item_name is not null ) 
and   info.gender            like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
union
select distinct mov.ptime ,info.cardno,info.empname,info.designation,
               info.lineno,info.joining_date,info.departmentnm,info.sectionnm
from   tb_data_movement mov,tb_personal_info info
where  info.company = :p_company 
and    mov.company    = :p_com 
and    mov.pdate          = :p_date 
and    mov.cardno        = info.cardno 
and   info.machineno    in (select item_name from tb_setup_item where company   =:p_company  and user_name = :p_user and  item_name is not null ) 
and   info.gender               like decode(nvl(:p_gender,'all'),'all','%',:p_gender)	
union
select distinct mov.ptime ,info.cardno,info.empname,info.designation,
               info.lineno,info.joining_date,info.departmentnm,info.sectionnm
from   tb_data_movement mov,tb_personal_info info
where  info.company = :p_company 
and    mov.company    = :p_com 
and    mov.pdate          = :p_date 
and    mov.cardno        = info.cardno 
and   info.lineno       in (select item_name from tb_setup_item where company   =:p_company  and user_name = :p_user and  item_name is not null ) 
and   info.gender         like decode(nvl(:p_gender,'all'),'all','%',:p_gender)	
union
select distinct mov.ptime ,info.cardno,info.empname,info.designation,
               info.lineno,info.joining_date,info.departmentnm,info.sectionnm
from   tb_data_movement mov,tb_personal_info info
where  info.company = :p_company 
and    mov.company    = :p_com 
and    mov.pdate          = :p_date 
and    mov.cardno        = info.cardno 
and   info.shift         in (select item_name from tb_setup_item where company   =:p_company  and user_name = :p_user and  item_name is not null ) 
and   info.gender        like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
union
select distinct mov.ptime ,info.cardno,info.empname,info.designation,
               info.lineno,info.joining_date,info.departmentnm,info.sectionnm
from   tb_data_movement mov,tb_personal_info info, tb_idcard_multiple mul
where  info.company = :p_company
and    info.company = mul.company
and    mov.company    = :p_com
and    mul.user_name  = :p_user
and    mov.pdate          = :p_date 
and    mov.cardno        = info.cardno
and    mov.cardno        = mul.cardno
order by lineno,cardno ,ptime asc