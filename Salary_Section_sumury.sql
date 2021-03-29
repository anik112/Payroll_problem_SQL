SELECT COUNT(sal.CARDNO)Total_Emp, sal.SECTIONNM, sal.SEC_BANGLA, SUM(sal.GROSSSAL_CH + sal.GROSSSAL_BK)GROSSSAL, SUM(sal.BASICSAL_CH + sal.BASICSAL_BK)BASICSAL, SUM(sal.HOUSERENT_CH + sal.HOUSERENT_BK)HOUSERENT, 
       SUM(sal.MEDICAL)MEDICAL_SAL, SUM(sal.TRANSPORT)TRANSPORT,  SUM(sal.FOODALLOW)FOODALLOW, SUM(sal.OTHERALLOW_CH + sal.OTHERALLOW_BK)OTHERALLOW,	
       SUM(sal.TOTAL_ABSENT_DED_CH + sal.TOTAL_ABSENT_DED_BK)TOTAL_ABSENT_DED,  SUM(sal.NETWAGES_CH + sal.NETWAGES_BK)NETWAGES, SUM(sal.ATTBONUS_CH+sal.ATTBONUS_BK)ATTBONUS,  
       SUM(mon.SAL_OT_HR)SAL_OT_HR,   SUM(sal.SAL_OT_AMT_CH + sal.SAL_OT_AMT_BK)SAL_OT_AMT, SUM(sal.ARREAR_AMT_CH + sal.ARREAR_AMT_BK)ARREAR_AMT, 
       SUM(sal.NETPAYABLE_CH + sal.NETPAYABLE_BK)NETPAYABLE, SUM(sal.ADVANCE_AMT_CH + sal.ADVANCE_AMT_BK)ADVANCE, SUM(sal.ADV_SAL_CH + sal.ADV_SAL_BK)ADV_SAL,  
       SUM(sal.ADVANCE_AMT_CH + sal.ADV_SAL_CH + sal.ADVANCE_AMT_BK+sal.ADV_SAL_BK)TOTAL_ADVANCE,  SUM(sal.STAMP_CH + sal.STAMP_BK)STAMP,  SUM(sal.NETPAYMENT_CH + sal.NETPAYMENT_BK)NETPAYMENT, 
       SUM(sal.NETPAYMENT_CH_RD + sal.NETPAYMENT_BK_RD)NETPAYMENT_RD
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
AND    mon.cardno     =  per.cardno 
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
GROUP BY sal.SECTIONNM,sal.SEC_BANGLA 
ORDER BY sal.SECTIONNM ASC


---------- new-- 

SELECT COUNT(sal.cardno)total_emp, sal.sectionnm, sal.sec_bangla, SUM(sal.grosssal_ch + sal.grosssal_bk)grosssal, 
              SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal, SUM(sal.houserent_ch + sal.houserent_bk)houserent,SUM(sal.medical)medical_sal, 
              SUM(sal.transport)transport,  SUM(sal.foodallow)foodallow, SUM(sal.otherallow_ch + sal.otherallow_bk)otherallow,
              SUM(sal.total_absent_ded_ch + sal.total_absent_ded_bk)total_absent_ded,  SUM(sal.netwages_ch + sal.netwages_bk)netwages, 
              SUM(sal.attbonus_ch+sal.attbonus_bk)attbonus,SUM(mon.sal_ot_hr)sal_ot_hr,   SUM(sal.sal_ot_amt_ch + sal.sal_ot_amt_bk)sal_ot_amt,
              SUM(sal.arrear_amt_ch + sal.arrear_amt_bk)arrear_amt,SUM(sal.netpayable_ch + sal.netpayable_bk)netpayable, 
              SUM(sal.advance_amt_ch + sal.advance_amt_bk)advance, SUM(sal.adv_sal_ch + sal.adv_sal_bk)adv_sal,
              SUM(sal.advance_amt_ch + sal.adv_sal_ch + sal.advance_amt_bk+sal.adv_sal_bk)total_advance,  SUM(sal.stamp_ch + sal.stamp_bk)stamp,  
              SUM(sal.netpayment_ch + sal.netpayment_bk)netpayment, SUM(sal.netpayment_ch_rd + sal.netpayment_bk_rd)netpayment_rd
FROM   tb_month_salary sal,tb_month_totalday  mon, tb_personal_info per 
WHERE  per.company   = :p_company 
AND       sal.company     = per.company 
AND       mon.company   = per.company 
AND       mon.finyear       =  :p_year 
AND       mon.finmonth    =  :p_month 
AND       mon.finyear       =  sal.finyear 
AND       mon.finmonth    =  sal.finmonth 
AND        (sal.netpayment_ch_rd + sal.netpayment_bk_rd) > 0 
AND       sal.cardno        =  per.cardno 
AND       mon.cardno      =  per.cardno 
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
GROUP BY sal.sectionnm,sal.sec_bangla 
ORDER BY sal.sectionnm ASC
