--- service banifit calculation 
select  cardno,secreteno,empname,joining_date,designation,grosssalary,lineno,SECTIONNM,DEPARTMENTNM,WORKERTYPE, RESIGNATION_DATE, 
           (RESIGNATION_DATE+1)Payment_Date, PRESENT_ADDRESS, PERMANENTADDRESS,
           rtrim(to_char(RESIGNATION_DATE,'Month'))Month_Reg, to_char(RESIGNATION_DATE,'RRRR')Year_Reg,
           trunc(months_between(RESIGNATION_DATE,JOINING_DATE)/12)YR ,
           trunc(mod( months_between(RESIGNATION_DATE,JOINING_DATE) ,12))MN,
           trunc(RESIGNATION_DATE - add_months( JOINING_DATE, months_between(RESIGNATION_DATE,JOINING_DATE)))DD,
           PRESENT_ADD_BAN, PERMANENT_ADD_BAN, ENMNAME_BANGLA, DESIGNATION_BANGLA, DEPT_BANGLA, SEC_BANGLA, OTORG
from tb_personal_info
where company   =:p_company
AND  joining_date IS NOT NULL
AND  RESIGNATION_DATE IS NOT NULL
-------and   active         = 0
and   grosssalary > 0 
and   to_char(RESIGNATION_DATE,'RRRR')  like decode(nvl(:p_year,'all'),'all','%',:p_year)
and   rtrim(to_char(RESIGNATION_DATE,'Month'))  like decode(nvl(:p_month,'all'),'all','%',:p_month)
and   DEPARTMENTNM    like decode(nvl(:p_deptname,'all'),'all','%',:p_deptname)
and   SECTIONNM like decode(nvl(:p_section,'all'),'all','%',:p_section)
and   DESIGNATION like decode(nvl(:p_desig,'all'),'all','%',:p_desig)
and   WORKERTYPE like decode(nvl(:p_worker,'all'),'all','%',:p_worker)
and   lineno       like decode(nvl(:p_lineno,'all'),'all','%',:p_lineno)
and    SHIFT like decode(nvl(:p_shift,'all'),'all','%',:p_shift)
and   cardno       like decode(nvl(:p_cardno,'all'),'all','%',:p_cardno) 
and   SHIFT like decode(nvl(:p_shift,'all'),'all','%',:p_shift) 
and   GENDER like decode(nvl(:p_gender,'all'),'all','%',:p_gender) 
order by DEPARTMENTNM,SECTIONNM,lineno,cardno asc



-- procudure 
function CF_Basic_DayFormula return Number is

 v_year number := 0;
 v_cal_day number :=0;
  
begin
	
-- for selecting the calculation 30 or 14
if :YR >= 9 then
	v_cal_day:=30;
else if :YR >= 4 then
	v_cal_day:=14;
else
    v_cal_day:=0;
end if;

-- for increment .5 or 1 year 
if :MN >= 8 then
	v_year :=1;
else if :MN >= 4 then
	v_year :=.5;
else
	v_year :=0;
end if;


-- exceptional case
if (:YR=9) and (:MN<8) then 
	v_year:=0;
	v_cal_day:=14;
else if (:YR=4) and (:MN<8) then
	v_year:=0;
	v_cal_day:=0;
end if;
--


v_year := (round((:YR + v_year) * v_cal_day));
  
return v_year;

exception
 when others then v_year := 0; 	 	
end;


function CF_Basic_DayFormula return Number is

 v_year_day number := 0;
 v_cal_day  number := 0;
  
begin
	
	--------------
	-------*********** Service Year >= 10 years
	if  :YR >= 10 then
		  if :MN >= 8 then
		  	 v_year_day := (:YR + 1);
	       v_cal_day  := (30 * v_year_day);

		  elsif :MN between 4 and 7 then
		  	 v_year_day := (:YR + 0.5);
	       v_cal_day  := (30 * v_year_day);
	    
	       else   
		  	 v_year_day := :YR;
	       v_cal_day  := (30 * v_year_day);
	       end if;

	-------*********** Service Year >= 9 and <10 years
	elsif  (:YR >= 9 and :YR < 10) then
		  if :MN >= 8 then
		  	 v_year_day := (:YR + 1);
	       v_cal_day  := (30 * v_year_day);

		  elsif :MN between 4 and 7 then
		  	 v_year_day := (:YR + 0.5);
	       v_cal_day  := (14 * v_year_day);
	    
	       else   
		  	 v_year_day := :YR;
	       v_cal_day  := (14 * v_year_day);
	       end if;

-------*********** Service Year >= 4 and < 9 years	       
	 elsif  (:YR >= 5 and :YR < 9) then    
		  if :MN >= 8 then
		  	 v_year_day := (:YR + 1);
	       v_cal_day  := (14 * v_year_day);

		  elsif :MN between 4 and 7 then
		  	 v_year_day := (:YR + 0.5);
	       v_cal_day  := (14 * v_year_day);
	    
	       else   
		  	 v_year_day := :YR;
	       v_cal_day  := (0 * v_year_day);
	       end if;

-------*********** Service Year >= 4 and < 9 years	       
	 elsif  (:YR >= 4 and :YR < 5) then    
		  if :MN >= 8 then
		  	 v_year_day := (:YR + 1);
	       v_cal_day  := (14 * v_year_day);

		  elsif :MN between 4 and 7 then
		  	 v_year_day := 0;
	       v_cal_day  := (14 * v_year_day);
	    
	       else   
		  	 v_year_day := 0;
	       v_cal_day  := (0 * v_year_day);
	       end if;
   
   else
	 v_year_day := 0;
	 v_cal_day  := (0 * v_year_day);
	 end if;
	 
   return v_year_day;

exception
 when others then v_year_day := 0; 	 	
end;


