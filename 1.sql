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
