FUNCTION CF_INwordFormula RETURN VARCHAR2 IS
  
  ----FUNCTION GET_AMOUNT_INWORDS  RETURN VARCHAR2 IS

		TYPE number_chart IS TABLE OF VARCHAR2(10)INDEX BY BINARY_INTEGER;
		
		number_tab number_chart;
		
		crore   NUMBER ;
		lakh    NUMBER;
		thou    NUMBER;
		hund    NUMBER;
		doubl   NUMBER;
		deci    NUMBER;
		
		v_text   VARCHAR2(500) := '';
		a_number NUMBER;

BEGIN
	
		a_number := NVL(:grosssalary,0);
		
		number_tab(1)  := 'One' ;
		number_tab(2)  := 'Two' ;
		number_tab(3)  := 'Three' ;
		number_tab(4)  := 'Four' ;
		number_tab(5)  := 'Five' ;
		number_tab(6)  := 'Six' ;
		number_tab(7)  := 'Seven' ;
		number_tab(8)  := 'Eight' ;
		number_tab(9)  := 'Nine' ;
		number_tab(10) := 'Ten' ;
		number_tab(11) := 'Eleven' ;
		number_tab(12) := 'Twelve' ;
		number_tab(13) := 'Thirteen' ;
		number_tab(14) := 'Fourteen' ;
		number_tab(15) := 'Fifteen' ;
		number_tab(16) := 'Sixteen' ;
		number_tab(17) := 'Seventeen' ;
		number_tab(18) := 'Eighteen' ;
		number_tab(19) := 'Nineteen' ;
		number_tab(20) := 'Twenty' ;
		number_tab(30) := 'Thirty' ;
		number_tab(40) := 'Forty' ;
		number_tab(50) := 'Fifty' ;
		number_tab(60) := 'Sixty' ;
		number_tab(70) := 'Seventy' ;
		number_tab(80) := 'Eighty' ;
		number_tab(90) := 'Ninety' ;

			crore := FLOOR(a_number/10000000);
			lakh  := FLOOR((a_number -TRUNC(a_number, -7))/1E5) ;
			thou  := FLOOR((a_number -TRUNC(a_number, -5))/1E3) ;
			hund  := FLOOR((a_number -TRUNC(a_number, -3))/1E2) ;
			doubl := FLOOR(a_number -TRUNC(a_number, -2));
			deci  := (a_number -TRUNC(a_number)) * 100 ;

					IF a_number = 0 THEN
					RETURN 'Zero';
					END IF;

--IF crore <> 0 THEN
--v_text := v_text||GET_AMOUNT_INWORDS(crore)||' Crore'||' ';
---END IF;

		IF lakh <> 0 THEN
		  IF lakh <= 20 OR lakh MOD 10 = 0 THEN
		    v_text := v_text || number_tab(lakh)|| ' Lakh'||' ';
		  ELSE
		    v_text := v_text || number_tab(TRUNC(lakh,-1))||' '||
		              number_tab(TRUNC(lakh,0) - TRUNC(lakh,-1))|| ' Lakh'|| ' ';
		  END IF;
		END IF;

				IF thou <> 0 THEN
				  IF thou <= 20 OR thou MOD 10 = 0 THEN
				    v_text := v_text || number_tab(thou)|| ' Thousand'||' ';
				  ELSE
				    v_text := v_text || number_tab(TRUNC(thou,-1))||' '||
				              number_tab(TRUNC(thou,0) - TRUNC(thou,-1))|| ' Thousand '|| ' ';
				  END IF;
				END IF;

						IF hund <> 0 THEN
						  v_text := v_text || number_tab(hund)||' '||'Hundred '||' ';
						END IF;

								IF doubl <> 0 THEN
								  IF doubl <= 20 OR doubl MOD 10 = 0 THEN
								    v_text := v_text || number_tab(doubl)|| '  ';
								  ELSE
								    v_text := v_text || number_tab(TRUNC(doubl,-1))||' '||
								              number_tab(TRUNC(doubl,0) - TRUNC(doubl,-1))|| '  ';
								  END IF;
								END IF;

										IF deci <> 0 THEN
										  IF deci <= 20 OR deci MOD 10 = 0 THEN
										    v_text := v_text || 'And '||number_tab(deci)|| ' Paisa ';
										  ELSE
										    v_text := v_text ||  'And '||number_tab(TRUNC(deci,-1))||' '||
										              number_tab(TRUNC(deci,0) - TRUNC(deci,-1))|| ' Paisa ';
										  END IF;
										END IF;

RETURN v_text ||'Taka Only';

EXCEPTION
  WHEN OTHERS THEN v_text := 'Taka Only';											

END;

