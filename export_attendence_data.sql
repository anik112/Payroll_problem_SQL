DECLARE 
   p_date TB_DATA_MOVEMENT.PDATE%type; 
   p_time TB_DATA_MOVEMENT.PTIME%type;
   secrect_no  TB_DATA_MOVEMENT.SECRETENO%type;
   status TB_DATA_MOVEMENT.STATUS%type;
   CURSOR c_customers is 
      SELECT PDATE,PTIME, SECRETENO, STATUS FROM TB_DATA_MOVEMENT 
	  where PDATE = '11-Nov-2020';
BEGIN 
   OPEN c_customers; 
   LOOP 
   FETCH c_customers into p_date,p_time, secrect_no, status; 
      EXIT WHEN c_customers%notfound; 
      dbms_output.put_line('101:'||secrect_no||':'||TO_CHAR( p_date, 'YYYYMMDD' ) ||':'||(substr(p_time,0,2)||substr(p_time,4,2)||substr(p_time,7,2))||':11');
   END LOOP; 
   CLOSE c_customers; 
END; 