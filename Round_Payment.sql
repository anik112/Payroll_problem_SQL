----------------- ROUND PAYMENT SQL FUNCTION ------------------------------
					
SELECT 
   TB_MONTH_SALARY.CARDNO, -- select caedno from tb_month_slary
   TB_PERSONAL_INFO.EMPNAME AS EMPLOY_NAME,  -- employ name from tb_personal_info
   TB_PERSONAL_INFO.DESIGNATION, -- designation from tb_personal_info
   TB_PERSONAL_INFO.SALARY_GRADE AS SALARY_GRADE, -- salary grade from tb_personal_info
   TB_PERSONAL_INFO.JOINING_DATE, -- joining date from tb_personal_info
   TB_PERSONAL_INFO.RESIGNATION_DATE, -- resignation date from tb_personal_info
   TB_MONTH_TOTALDAY.CASUAL AS CL, --  casual leave from tb_month_totalday
   TB_MONTH_TOTALDAY.MEDICAL AS SL, -- sick leave from tb_month_totalday
   TB_MONTH_TOTALDAY.EARNED AS EL, -- earn leave from tb_month_totalday
   TB_MONTH_TOTALDAY.TOTALDAY AS MON, -- month day from tb_month_totalday
   TB_MONTH_TOTALDAY.TOTALWORKINGDAY AS WD, -- weekly holiday duty from tb_month_totalday
   TB_MONTH_TOTALDAY.WEEK_DAY AS WH, -- weekly holiday from tb_month_totalday
   TB_MONTH_TOTALDAY.GOVT_DAY AS GH, -- general holiday from tb_month_totalday
   TB_MONTH_TOTALDAY.TOTALABSENT AS ABST, -- absent day from tb_month_totalday
   TB_MONTH_SALARY.BASICSAL AS BASIC_SALARY,  -- Basic salary from tb_month_salary
   TB_MONTH_SALARY.HOUSERENT AS HOUSE_RENT, -- house rent from tb_month_salary
   TB_MONTH_SALARY.MEDICAL, -- medical bill from tb_month_salary
   TB_MONTH_SALARY.TRANSPORT, -- transport bill from tb_month_salary
   TB_MONTH_SALARY.FOODALLOW, -- foodallow from tb_month_salary
   TB_MONTH_SALARY.OTHERALLOW, -- other allow from tb_month_salary
   TB_MONTH_SALARY.GROSSSAL AS GROSS_SALARY, -- gross salary from tb_month_salary
   TB_PROMOTION_INFO.PROSALARY AS INCREMENT_AMOUNT, -- increment amount from tb_month_salary
   TB_MONTH_SALARY.ABSENT_DEDUC AS ABSENT_DED, -- absent amount from tb_month_salary
   TB_MONTH_SALARY.ARREAR_AMT AS ARREAR, -- arrear amount from tb_month_salary
   TB_MONTH_TOTALDAY.LATEDAY AS LD, -- late day from tb_month_totalday
   TB_MONTH_SALARY.ATTBONUS AS BONUS, -- bonus amount from tb_month_salary
   TB_MONTH_SALARY.OTRATE AS OT_RATE, -- OT rate from tb_month_salary
   TB_MONTH_SALARY.OTAMOUNT AS OT_AMOUNT, -- OT Amount from tb_month_salary
   TB_MONTH_TOTALDAY.HOLIDAY_OT AS HOLI_DAY, -- holday ot from tb_month_salary
   TB_MONTH_SALARY.WK_HOLI_BILL AS HD_BILL, -- weekly holiday bill from tb_month_salary
   TB_MONTH_TOTALDAY.TIFFIN_DAY, -- tiffin bill from tb_month_totalday
   TB_MONTH_SALARY.TIFFIN_BILL AS TF_BILL, -- tiffin bill from tb_month_salary
   TB_MONTH_SALARY.STAMP, -- stamp duduc from tb_month_salary
   TB_MONTH_SALARY.NETPAYABLE AS NET_PAYABLE, -- net payble from tb_month_salary
   TB_MONTH_SALARY.ADVANCE_DEDUC, -- advance duduc from tb_month_salary
   TB_MONTH_SALARY.TAX_DEDUC, -- text deduc from tb_month_salary
   TB_MONTH_SALARY.NETPAYMENT AS NET_PAYMENT, -- net payment from tb_month_salary
   -- logic a number 105214 now, 105214%10=4 < 5? then 105214-4=105210
   -- logic a number 145218 now, 145218%10=8 > 5? then 145218+(10-8)=145220
   CASE
    WHEN MOD(TB_MONTH_SALARY.NETPAYMENT,10) > 5
        THEN (TB_MONTH_SALARY.NETPAYMENT+(10-MOD(TB_MONTH_SALARY.NETPAYMENT,10)))
    WHEN MOD(TB_MONTH_SALARY.NETPAYMENT,10) < 5 
        THEN (TB_MONTH_SALARY.NETPAYMENT-MOD(TB_MONTH_SALARY.NETPAYMENT,10))
    ELSE TB_MONTH_SALARY.NETPAYMENT
   END ROUND_NET_PAYMENT, -- round net payment from tb_month_salary
   TB_PERSONAL_INFO.DEPARTMENTNM, -- department name from tb_personal_info
   TB_PERSONAL_INFO.SECTIONNM, -- section name from tb_personal_info
   TB_PERSONAL_INFO.COMPANY, -- company name from tb_personal_info
   TB_MONTH_SALARY.FINYEAR, -- final year
   TB_MONTH_SALARY.FINMONTH -- final month
   
FROM TB_MONTH_SALARY
-- join tb_personal_info with tb_month_salary based on cardno and department name
INNER JOIN TB_PERSONAL_INFO ON TB_PERSONAL_INFO.CARDNO=TB_MONTH_SALARY.CARDNO
AND	  TB_PERSONAL_INFO.DEPARTMENTNM='Production'
-- join tb_month_totalday with tb_month_salary based on cadno and finyear and finmonth
INNER JOIN TB_MONTH_TOTALDAY ON TB_MONTH_TOTALDAY.CARDNO=TB_MONTH_SALARY.CARDNO
AND	  TB_MONTH_TOTALDAY.FINYEAR=TB_MONTH_SALARY.FINYEAR
AND	  TB_MONTH_TOTALDAY.FINMONTH=TB_MONTH_SALARY.FINMONTH
-- 
INNER JOIN TB_PROMOTION_INFO ON TB_PROMOTION_INFO.SLNO=(
	  						  	SELECT MAX(SLNO) FROM TB_PROMOTION_INFO 
							  	WHERE 
							  	TB_PROMOTION_INFO.CARDNO=TB_MONTH_SALARY.CARDNO
							  	)
WHERE TB_MONTH_SALARY.FINYEAR=2019
AND	  TB_MONTH_SALARY.FINMONTH='March'
ORDER BY TB_MONTH_SALARY.CARDNO ASC;
--AND	  TB_MONTH_SALARY.DESIGNATION='Finishing Assistant'
--AND	  TB_MONTH_SALARY.CARDNO='014503';











-------------------- ROUND PAYMENT PL-SQL FUNCTION ------------------------------------

CREATE OR REPLACE FUNCTION round_payment(p_payment number, p_digit number) RETURN number IS

   v_ck_number number := 0;
   v_payment   number := 0;

BEGIN
   
   if p_digit = 1 then
      v_payment := p_payment;
   
   elsif p_digit = 2 then
		   
		   begin
		   select substr(p_payment,length(p_payment)) into v_ck_number
		   from   dual;
		   exception
		   when others then v_ck_number := 0;
		   end;

		   if v_ck_number <= 2 then
		      v_payment := trunc(p_payment,-1);
		
		     elsif v_ck_number between 3 and 7 then
		      v_payment := trunc(p_payment,-1) +5;
		
		      elsif v_ck_number >= 8 then
		      v_payment := trunc(p_payment + 10,-1);
			  end if;
   
      elsif p_digit = 3 then
   
		   begin
		   select substr(p_payment,length(p_payment)-1) into v_ck_number
		   from   dual;
		   exception
		   when others then v_ck_number := 0;
		   end;

		   if v_ck_number <= 29 then
		      v_payment := trunc(p_payment,-2);
		
		     elsif v_ck_number between 30 and 79 then
		      v_payment := trunc(p_payment,-2) +50;
		
		      elsif v_ck_number >= 80 then
		      v_payment := trunc(p_payment + 100,-2);
			  end if;
   
        else
   
		   begin
		   select substr(p_payment,length(p_payment)-2) into v_ck_number
		   from   dual;
		   exception
		   when others then v_ck_number := 0;
		   end;

		   if v_ck_number <= 299 then
		      v_payment := trunc(p_payment,-3);
		
		     elsif v_ck_number between 300 and 799 then
		      v_payment := trunc(p_payment,-3) +500;
		
		      elsif v_ck_number >= 800 then
		      v_payment := trunc(p_payment + 1000,-3);
			  end if;
   
      end if;
   
	  return v_payment;

exception
 	when others then v_payment := 0;
END;
/
