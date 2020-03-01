DECLARE 
   p_date TB_DATA_MOVEMENT.PDATE%type; 
   p_time TB_DATA_MOVEMENT.PTIME%type;
   mx_time  TB_DATA_MOVEMENT.PTIME%type;
   min_time TB_DATA_MOVEMENT.PTIME%type;
   CURSOR c_customers is 
      SELECT PDATE,PTIME FROM TB_DATA_MOVEMENT 
	  where cardno='5F-400575' and pDATE BETWEEN TO_DATE('02/01/2020 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
	  and TO_DATE('02/29/2020 00:00:00', 'MM/DD/YYYY HH24:MI:SS'); 
BEGIN 
   OPEN c_customers; 
   LOOP 
   FETCH c_customers into p_date,p_time; 
      EXIT WHEN c_customers%notfound; 
      dbms_output.put_line(p_date || ' ' || p_time);
	  select min(ptime) into min_time,max(ptime) into mx_time from TB_DATA_MOVEMENT where pdate=p_date;
	  dbms_output.put_line(min_time || ' ' || mx_time);
   END LOOP; 
   CLOSE c_customers; 
END; 