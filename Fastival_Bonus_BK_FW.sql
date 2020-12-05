select bamt.CARDNO, info.EMPNAME, info.DESIGNATION, bamt.GROSSSAL, bamt.RPAYMENT, info.AC_NO
from   TB_BONUS_AMOUNT bamt,TB_PERSONAL_INFO info
where  info.COMPANY    = :p_company
and    info.COMPANY    = bamt.company
and    bamt.FINYEAR    = :p_year
and    bamt.FINMONTH   = :p_month
and    bamt.NPAYMENT > 0
and    info.cardno     = bamt.cardno 
and    info.DEPARTMENTNM like decode(nvl(:p_dept,'all'),'all','%',:p_dept) 
and    info.SECTIONNM   like decode(nvl(:p_section,'all'),'all','%',:p_section) 
and    info.lineno    like decode(nvl(:p_line,'all'),'all','%',:p_line) 
and    info.WORKERTYPE like decode(nvl(:p_woker,'all'),'all','%',:p_woker)
and    info.shift       like decode(nvl(:p_shift,'all'),'all','%',:p_shift) 
and    info.cardno    like decode(nvl(:p_card,'all'),'all','%',:p_card) 
AND    info.CASH_TYPE    LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    bamt.PAY_STATUS    LIKE DECODE(NVL(:p_pay_sal,'all'),'all','%',:p_pay_sal) 
AND    info.BANK_NAME  LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
and    info.active like decode(nvl(:p_active,'all'),'all','%',:p_active)
order by info.lineno,bamt.CARDNO asc


---- for MFT Format  
select bamt.CARDNO, info.EMPNAME, info.DESIGNATION, bamt.GROSSSAL, bamt.RPAYMENT, info.AC_NO, info.MFS_ACNO
from   TB_BONUS_AMOUNT bamt,TB_PERSONAL_INFO info
where  info.COMPANY    = :p_company
and    info.COMPANY    = bamt.company
and    bamt.FINYEAR    = :p_year
and    bamt.FINMONTH   = :p_month
and    bamt.NPAYMENT > 0
and    info.cardno     = bamt.cardno 
and    info.DEPARTMENTNM like decode(nvl(:p_dept,'all'),'all','%',:p_dept) 
and    info.SECTIONNM   like decode(nvl(:p_section,'all'),'all','%',:p_section) 
and    info.lineno    like decode(nvl(:p_line,'all'),'all','%',:p_line) 
and    info.WORKERTYPE like decode(nvl(:p_woker,'all'),'all','%',:p_woker)
and    info.shift       like decode(nvl(:p_shift,'all'),'all','%',:p_shift) 
and    info.cardno    like decode(nvl(:p_card,'all'),'all','%',:p_card) 
AND    info.CASH_TYPE    LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    bamt.PAY_STATUS    LIKE DECODE(NVL(:p_pay_sal,'all'),'all','%',:p_pay_sal) 
AND    info.BANK_NAME  LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    info.MFS_TYPE  LIKE DECODE(NVL(:p_mfs_type,'all'),'all','%',:p_mfs_type)
and    info.active like decode(nvl(:p_active,'all'),'all','%',:p_active)
order by info.lineno,bamt.CARDNO asc




-------- CF_AC_status formula 
v_status  varchar2(25);

function CF_AC_StatusFormula return Char is

  v_status  varchar2(25);
  
begin
  
  if :p_bkname is not null then
     v_status := 'A/C No';
		  
  else
  v_status := 'A/C No';   	 
  end if;
  
  return v_status;
  
end;
  

  
 select distinct bonus_name 
from   TB_BONUS_SETUP
where  bonus_year   = :p_year
and    bonus_month  = :p_month
and    bonus_name is not null
and    BONUS_CATEGORY = :p_bonus_type  