select info.cardno, info.secreteno, info.empname, info.joining_date, info.designation, INFO.MOTHER_NAME,
       (info.grosssalary + info.GROSS_BK)grosssalary,  info.lineno, info.SECTIONNM, info.DEPARTMENTNM, info.MARITAL_STATUS, info.RELIGION,
       info.FATHER_NAME, info.PRESENT_ADDRESS, info.BIRTH_DATE, info.GENDER, info.BLOODGROUP,
	   info.ENMNAME_BANGLA, info.DESIGNATION_BANGLA, info.DEPT_BANGLA, info.SEC_BANGLA,
	   info.SALARY_GRADE, info.PERMANENTADDRESS, info.HOUSBANDNAME,
                   other.TOTALCHILD, other.MALECHILD, other.FEMALECHILD, other.NOMINEENAME, other.NOMINEEADDRESS,
                   other.NOMINEERELATION, other.REF1, INFO.COMPANY, pic.EMPPICTURE, other.BIRTH_CERTIFICATE_NO, other.EMAIL_ADDRESS, other.NID, other.OWN_CELLNO,
                  info.PRESENT_ADD_BAN,  info.PRESENT_PO_BAN,  info.PRESENT_PS_BAN,  info.PRESENT_DIST_BAN, 
                  info.PERMANENT_ADD_BAN,  info.PERMANENT_PO_BAN,  info.PERMANENT_PS_BAN,  info.PERMANENT_DIST_BAN,
                   info.FATHER_NAME_BAN,  info.SPOUSE_NAME_BAN,  info.MOTHER_NAME_BAN
from  tb_personal_info info, TB_IDCARD_MULTIPLE mul ,TB_PERSONAL_INFO_OTHER other, TB_PERSONAL_INFO_PICTURE pic
where info.company       =:p_company
and   info.company         = mul.company
and   info.company         = other.company
and   info.company         = pic.company
and   mul.USER_NAME = :p_user
and   info.cardno            = mul.cardno
and   info.cardno            = other.cardno
and   info.cardno            = pic.cardno
------and   info.active          = 0
and   info.GENDER like decode(nvl(:p_gender,'all'),'all','%',:p_gender)




--------------------- final 


select info.CARDNO, info.JOINING_DATE ,info.ENMNAME_BANGLA, info.DESIGNATION_BANGLA, 
info.DEPT_BANGLA, info.SEC_BANGLA,INFO.COMPANY, info.FATHER_NAME_BAN, loan.LOAN_AMT,
loan.LOANDATE, info.MOTHER_NAME_BAN
from  TB_PF_LOAN_AMT loan, tb_personal_info info, TB_IDCARD_MULTIPLE mul
where info.company	 	   			= :p_company
and   loan.company	   				= info.company
and	  mul.COMPANY					= info.COMPANY
and	  loan.FINYEAR	   	 			= :p_year
and	  to_char(loan.LOANDATE,'FMMonth')= :p_month
and   mul.USER_NAME					= :p_user
and	  loan.CARDNO					= mul.CARDNO
and	  info.CARDNO					= mul.CARDNO
order by info.cardno asc

