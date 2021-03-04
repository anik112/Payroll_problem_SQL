SELECT sal.DEPT_BANGLA, sal.SEC_BANGLA, sal.LINENO, sal.FLOORNO, sal.MACHINENO, per.CARDNO, per.ENMNAME_BANGLA, per.JOINING_DATE, 
       per.RESIGNATION_DATE, sal.DESIGNATION_BAN, sal.SALARY_GRD, mon.TOTAL_DAY, mon.TOTAL_LEAVE, mon.TOTAL_PRESENT, mon.TOTAL_ABSENT, 
       mon.LATE_DAY, sal.MEDICAL, sal.TRANSPORT, sal.FOODALLOW, sal.OTHERALLOW_BK, mon.SAL_OT_HR, sal.OTRATE, mon.TOTAL_HOLIDAY,
       (sal.GROSSSAL_CH + sal.GROSSSAL_BK)GROSSSAL, 
       (sal.BASICSAL_CH + sal.BASICSAL_BK)BASICSAL, 
       (sal.HOUSERENT_CH + sal.HOUSERENT_BK)HOUSERENT,
       (sal.TOTAL_ABSENT_DED_CH + sal.TOTAL_ABSENT_DED_BK)TOTAL_ABSENT_DED,
       (sal.NETWAGES_CH + sal.NETWAGES_BK) NETWAGES,
       (sal.SAL_OT_AMT_CH + sal.SAL_OT_AMT_BK)SAL_OT_AMT,
       (sal.ATTBONUS_CH + sal.ATTBONUS_BK)ATTBONUS,
       (sal.ADVANCE_AMT_CH + sal.ADVANCE_AMT_BK)ADVANCE,
       (sal.ADVANCE_AMT_CH + sal.ADV_SAL_CH + sal.ADVANCE_AMT_BK + sal.ADV_SAL_BK) TOTAL_ADVANCE,
       (sal.ARREAR_AMT_CH + sal.ARREAR_AMT_BK)ARREAR_AMT,
       (sal.FS_BONUS_CH + sal.FS_BONUS_BK)FS_BONUS,
       (sal.NETPAYMENT_CH_RD + sal.NETPAYMENT_BK_RD)NETPAYMENT_RD,
       (sal.NT_BILL_CH + sal.NT_BILL_PT_CH + sal.NT_BILL_BK + sal.NT_BILL_PT_BK) NT_BILL,  
       (sal.TIFFIN_BILL_CH + sal.TIFFIN_BILL_PT_CH + sal.TIFFIN_BILL_BK + sal.TIFFIN_BILL_PT_BK) TIFFIN_BILL,
       (sal.IFTAR_BILL_CH + sal.IFTAR_BILL_BK)IFTAR_BILL,
       (sal.DINNER_BILL_CH + sal.DINNER_BILL_BK)DINNER,
       (sal.GT_HOLI_BILL_CH + sal.GT_HOLI_BILL_BK)GT_HOLI_BILL, 
       (sal.WK_HOLI_BILL_BK + sal.WK_HOLI_BILL_BK)WK_HOLI_BILL
FROM  TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE mon.company  = :p_company 
AND   mon.company  = sal.company 
AND   mon.company  = per.company 
AND   mon.finyear  = :p_year 
AND   mon.finmonth = :p_month 
AND   mon.finyear  = sal.finyear 
AND   mon.finmonth = sal.finmonth 
AND   (sal.NETPAYMENT_CH_RD + sal.NETPAYMENT_BK_RD) > 0 
AND   mon.cardno   = sal.cardno 
AND   mon.cardno   = per.cardno 
AND   per.DEPARTMENTNM LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.SECTIONNM    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   per.DESIGNATION  LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.WORKERTYPE   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   per.FLOORNO      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   per.MACHINENO    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
AND   per.lineno       LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   per.SHIFT        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   sal.SAL_STATUS   LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND   sal.PAY_STATUS   LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)  
AND   per.CASH_TYPE    LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND   per.BANK_NAME    LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND	  per.MFT_TYPE     LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   per.cardno       LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND   per.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.DEPARTMENTNM,per.SECTIONNM,per.lineno,per.cardno ASC


-------------------------------------------------------------------------------- Temp Data  


SELECT sal.CARDNO, sal.DEPARTMENTNM, sal.DEPT_BANGLA, sal.SECTIONNM, sal.SEC_BANGLA, sal.LINENO, sal.FLOORNO, sal.MACHINENO,

       sal.EMPNAME, sal.ENMNAME_BANGLA, sal.DESIGNATION, sal.DESIGNATION_BAN, sal.SALARY_GRD, per.JOINING_DATE, per.RESIGNATION_DATE,
	   
       mon.TOTAL_DAY, mon.WEEK_DAY, mon.GOVT_DAY, mon.CASUAL, mon.EARNED, mon.MEDICAL, mon.LWP, mon.TOTAL_LEAVE, mon.TOTAL_PRESENT, mon.TOTAL_ABSENT,
	   
      (sal.GROSSSAL_BK + sal.GROSSSAL_BK)GROSSSAL, (sal.BASICSAL_CH + sal.BASICSAL_BK)BASICSAL, (sal.HOUSERENT_CH + sal.HOUSERENT_BK)HOUSERENT, sal.MEDICAL MEDICAL_SAL, sal.TRANSPORT, sal.FOODALLOW, 
	  
      (sal.OTHERALLOW_CH +  sal.OTHERALLOW_BK)OTHERALLOW, (sal.TOTAL_ABSENT_DED_CH + sal.TOTAL_ABSENT_DED_BK)TOTAL_ABSENT_DED, (sal.NETWAGES_CH + sal.NETWAGES_BK)NETWAGES, mon.LATE_DAY, 
      (sal.ATTBONUS_CH + sal.ATTBONUS_BK)ATTBONUS,  mon.SAL_OT_HR,   sal.OTRATE, (sal.SAL_OT_AMT_CH + sal.SAL_OT_AMT_BK)SAL_OT_AMT, (sal.FS_BONUS_CH + sal.FS_BONUS_BK)FS_BONUS,
      (sal.ARREAR_AMT_CH + sal.ARREAR_AMT_BK)ARREAR_AMT, (sal.NETPAYABLE_CH + sal.NETPAYABLE_BK)NETPAYABLE, (sal.ADVANCE_AMT_CH + sal.ADVANCE_AMT_BK)ADVANCE_AMT, (sal.ADV_SAL_CH + sal.ADV_SAL_BK)ADV_SAL,  
      (sal.ADVANCE_AMT_CH+sal.ADV_SAL_CH + sal.ADVANCE_AMT_BK+sal.ADV_SAL_BK)TOTAL_ADVANCE, (sal.STAMP_CH + sal.STAMP_BK)STAMP,  (sal.NETPAYMENT_CH + sal.NETPAYMENT_BK)NETPAYMENT, 
      (sal.NETPAYMENT_CH_RD + sal.NETPAYMENT_BK_RD)NETPAYMENT_RD,
      (sal.NT_BILL_CH + sal.NT_BILL_PT_CH + sal.NT_BILL_BK + sal.NT_BILL_PT_BK)NT_BILL,  (sal.TIFFIN_BILL_CH + sal.TIFFIN_BILL_PT_CH + sal.TIFFIN_BILL_BK + sal.TIFFIN_BILL_PT_BK)TIFFIN_BILL,
      (sal.IFTAR_BILL_BK + sal.IFTAR_BILL_BK)IFTAR_BILL, (sal.DINNER_BILL_CH + sal.DINNER_BILL_BK)DINNER_BILL,  (sal.GT_HOLI_BILL_CH + sal.GT_HOLI_BILL_BK)GT_HOLI_BILL, (sal.WK_HOLI_BILL_CH + sal.WK_HOLI_BILL_BK)WK_HOLI_BILL, 
      per.CASH_TYPE,  per.BANK_NAME,  per.AC_NO, per.MFT_TYPE,  per.MFT_ACNO 
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  per.company  = :p_company 
AND    sal.company        = per.company 
AND    mon.company     = per.company 
AND    mon.finyear       =  :p_year 
AND    mon.finmonth    =  :p_month 
AND    mon.finyear       =  sal.finyear 
AND    mon.finmonth    =  sal.finmonth 
AND     (sal.NETPAYMENT_CH_RD + sal.NETPAYMENT_BK_RD) > 0 
AND    sal.cardno        =  per.cardno 
AND    mon.cardno      =  per.cardno 
AND    sal.DEPARTMENTNM LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    sal.SECTIONNM   LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    sal.lineno    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    sal.DESIGNATION   LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation) 
AND    per.WORKERTYPE   LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker) 
AND    sal.FLOORNO   LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno) 
AND    sal.MACHINENO   LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno) 
AND    per.SHIFT    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    sal.CARDNO    LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND    per.CASH_TYPE   LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND    per.BANK_NAME   LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.MFT_TYPE   LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND      per.ACTIVE      LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND      sal.SAL_STATUS      LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND      sal.PAY_STATUS      LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
ORDER BY sal.DEPARTMENTNM, sal.SECTIONNM,sal.lineno, sal.cardno ASC