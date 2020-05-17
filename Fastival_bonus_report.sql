select bamt.CARDNO, bamt.GROSSSAL,bamt.BASICSAL,bamt.BAMOUNT,
       info.DEPARTMENTNM,info.SECTIONNM,info.LINENO,info.JOINING_DATE,
	   info.DESIGNATION,(info.EMPNAME||' ('||info.DESIGNATION|| ')')EMPNAME, 
	   info.WORKERTYPE,info.PAYMENT_TYPE,info.BANKNAME,info.ACNO,
	   other.NID
from   TB_BONUS_AMOUNT bamt,TB_PERSONAL_INFO info, tb_personal_info_other other
where  info.COMPANY  = 'Vision Apparels (Pvt.) Ltd.-1'  
and    info.company  = bamt.company
and	   other.COMPANY = info.COMPANY
and    bamt.FINYEAR  like decode(nvl(:p_year,'all'),'all','%',:p_year) 
and    bamt.FINMONTH like decode(nvl(:p_month,'all'),'all','%',:p_month)
and    bamt.BAMOUNT > 0
and    info.cardno   = bamt.cardno
and	   other.CARDNO = info.CARDNO
and    info.DEPARTMENTNM like decode(nvl(:p_dept,'all'),'all','%',:p_dept) 
and    info.SECTIONNM   like decode(nvl(:p_section,'all'),'all','%',:p_section) 
and    info.lineno    like decode(nvl(:p_line,'all'),'all','%',:p_line) 
and    info.cardno    like decode(nvl(:p_card,'all'),'all','%',:p_card)  
and    info.active like decode(nvl(:p_active,'all'),'all','%',:p_active)
and	   info.PAYMENT_TYPE like decode(nvl(:p_payment_type,'all'),'all','%',:p_payment_type)
order by info.lineno,bamt.CARDNO asc