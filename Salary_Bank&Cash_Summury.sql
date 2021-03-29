SELECT COUNT(sal.CARDNO)Total_Emp, sal.SECTIONNM, sal.SEC_BANGLA, SUM(sal.GROSSSAL_CH + sal.GROSSSAL_BK)GROSSSAL, SUM(sal.BASICSAL_CH + sal.BASICSAL_BK)BASICSAL, 
               SUM(sal.HOUSERENT_CH + sal.HOUSERENT_BK)HOUSERENT, 
               SUM(sal.MEDICAL)MEDICAL_SAL, SUM(sal.TRANSPORT)TRANSPORT,  SUM(sal.FOODALLOW)FOODALLOW, SUM(sal.OTHERALLOW_CH + sal.OTHERALLOW_BK)OTHERALLOW,	
               SUM(sal.TOTAL_ABSENT_DED_CH + sal.TOTAL_ABSENT_DED_BK)TOTAL_ABSENT_DED,  
               SUM(sal.NETWAGES_CH + sal.NETWAGES_BK)NETWAGES, SUM(sal.NETWAGES_CH)NETWAGES_CH, SUM(sal.NETWAGES_BK)NETWAGES_BK,
               SUM(sal.ATTBONUS_CH+sal.ATTBONUS_BK)ATTBONUS,  SUM(sal.ATTBONUS_CH)ATTBONUS_CH,  SUM(sal.ATTBONUS_BK)ATTBONUS_BK,  
               SUM(mon.SAL_OT_HR)SAL_OT_HR,   
               SUM(sal.SAL_OT_AMT_CH + sal.SAL_OT_AMT_BK)SAL_OT_AMT, SUM(sal.SAL_OT_AMT_CH)SAL_OT_AMT_CH, SUM(sal.SAL_OT_AMT_BK)SAL_OT_AMT_BK, 
               SUM(sal.ARREAR_AMT_CH + sal.ARREAR_AMT_BK)ARREAR_AMT, SUM(sal.ARREAR_AMT_CH)ARREAR_AMT_CH, SUM(sal.ARREAR_AMT_BK)ARREAR_AMT_BK, 
               SUM(sal.NETPAYABLE_CH + sal.NETPAYABLE_BK)NETPAYABLE,  SUM(sal.NETPAYABLE_CH)NETPAYABLE_CH, SUM(sal.NETPAYABLE_BK)NETPAYABLE_BK,
               SUM(sal.ADVANCE_AMT_CH + sal.ADVANCE_AMT_BK)ADVANCE, SUM(sal.ADV_SAL_CH + sal.ADV_SAL_BK)ADV_SAL,  
               SUM(sal.ADVANCE_AMT_CH + sal.ADV_SAL_CH + sal.ADVANCE_AMT_BK+sal.ADV_SAL_BK)TOTAL_ADVANCE,  SUM(sal.ADVANCE_AMT_CH + sal.ADV_SAL_CH)TOTAL_ADVANCE_CH, SUM(sal.ADVANCE_AMT_BK + sal.ADV_SAL_BK)TOTAL_ADVANCE_BK,
               SUM(sal.STAMP_CH + sal.STAMP_BK)STAMP,  SUM(sal.STAMP_CH)STAMP_CH,  SUM(sal.STAMP_BK)STAMP_BK,  
               SUM(sal.NETPAYMENT_CH + sal.NETPAYMENT_BK)NETPAYMENT, 
               SUM(sal.NETPAYMENT_CH_RD + sal.NETPAYMENT_BK_RD)NETPAYMENT_RD,SUM(sal.NETPAYMENT_CH_RD)NETPAYMENT_RD_CH, SUM(sal.NETPAYMENT_BK_RD)NETPAYMENT_RD_BK
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  per.company  = :p_company 
AND       sal.company        = per.company 
AND       mon.company     = per.company 
AND       mon.finyear       =  :p_year 
AND       mon.finmonth    =  :p_month 
AND       mon.finyear       =  sal.finyear 
AND       mon.finmonth    =  sal.finmonth 
AND       (sal.NETPAYMENT_CH_RD + sal.NETPAYMENT_BK_RD) > 0 
AND       sal.cardno        =  per.cardno 
AND       mon.cardno     =  per.cardno 
AND       sal.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND       sal.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND       per.workertype      LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND       sal.lineno               LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND       sal.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno) 
AND       sal.machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno) 
AND       per.cash_type       LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND       per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND       per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND       sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND       sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND       per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY sal.SECTIONNM,sal.SEC_BANGLA 
ORDER BY sal.SECTIONNM ASC