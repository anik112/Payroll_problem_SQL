DECLARE 
Sec_name tb_personal_info.SECTIONNM%type;
Line_no tb_personal_info.LINENO%type;
s_Cardno tb_personal_info.CARDNO%type;
Empname tb_personal_info.EMPNAME%type;
Join_date tb_personal_info.JOINING_DATE%type;
desi tb_personal_info.DESIGNATION%type;
Sal_grade tb_personal_info.SALARY_GRADE%type;
Gross_sal tb_personal_info.GROSSSALARY%type;
Birth_date tb_personal_info.BIRTH_DATE%type;
Mobile tb_personal_info.MOBILE%type;
Acno tb_personal_info.AC_NO%type;
Fat_name tb_personal_info.FATHER_NAME%type;
Moth_name tb_personal_info.MOTHER_NAME%type;
Spo_name tb_personal_info.HOUSBANDNAME%type;
Pre_add tb_personal_info.PRESENT_ADDRESS%type;
Per_add tb_personal_info.PERMANENTADDRESS%type;
Marlt tb_personal_info.MARITAL_STATUS%type;
Gender tb_personal_info.GENDER%type;
Nid tb_personal_info_other.NID%type;
f_month_salary tb_month_salary.NETPAYMENT%type;
s_month_salary tb_month_salary.NETPAYMENT%type;
t_month_salary tb_month_salary.NETPAYMENT%type;


CURSOR c_emp is 
SELECT  sectionnm, LINENO,
CARDNO, EMPNAME, JOINING_DATE, DESIGNATION,
SALARY_GRADE, GROSSSALARY, BIRTH_DATE, MOBILE, AC_NO,
FATHER_NAME, MOTHER_NAME, HOUSBANDNAME, PRESENT_ADDRESS,
PERMANENTADDRESS, MARITAL_STATUS, GENDER
FROM tb_personal_info
	  where active=0;
i number:=1;
	  
BEGIN 
   OPEN c_emp; 
   LOOP 
   FETCH c_emp into Sec_name, Line_no, s_Cardno, Empname, Join_date,
Desi, Sal_grade, Gross_sal, Birth_date, Mobile, Acno, Fat_name,
Moth_name, Spo_name, Pre_add, Per_add, Marlt, Gender;
      EXIT WHEN c_emp%notfound; 
	  -- Frist month
	  begin
	  select tb_month_salary.NETPAYMENT 
	  into f_month_salary from tb_month_salary 
	  where finyear=2019 and finmonth='January'
	  and tb_month_salary.CARDNO=s_Cardno;

	  exception
	  when NO_DATA_FOUND then 
	  f_month_salary:= null;
	  end;
	  -- second month
	  begin
	  select tb_month_salary.NETPAYMENT 
	  into s_month_salary from tb_month_salary 
	  where finyear=2019 and finmonth='February'
	  and tb_month_salary.CARDNO=s_Cardno;

	  exception
	  when NO_DATA_FOUND then 
	  s_month_salary:= null;
	  end;
	  -- third month
	  begin
	  select tb_month_salary.NETPAYMENT 
	  into t_month_salary from tb_month_salary 
	  where finyear=2019 and finmonth='March'
	  and tb_month_salary.CARDNO=s_Cardno;

	  exception
	  when NO_DATA_FOUND then 
	  t_month_salary:= null;
	  end;

      dbms_output.put_line(i||'	'||Sec_name ||'   '||Line_no ||'   '||s_Cardno||'   '||Empname||'   '|| Join_date
	  ||'   1at month: '||f_month_salary
	  ||'	2nd month: '||s_month_salary
	  ||'	3rd month: '||t_month_salary);
	  i:=i+1;
   END LOOP; 
   CLOSE c_emp; 
END;





---Desi||'   '|| Sal_grade ||'   '||Gross_sal ||'   '||Birth_date ||'   '||Mobile ||'   '||Acno ||'   '||Fat_name||'   '||
--Moth_name ||'   '||Spo_name||'   '||Pre_add||'   '||Per_add||'   '|| Marlt ||'   '||Gender
