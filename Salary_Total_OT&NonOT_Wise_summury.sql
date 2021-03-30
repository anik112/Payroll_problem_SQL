SELECT COUNT(sal.cardno)total_emp_n, sal.sectionnm sectionnm_n, sal.sec_bangla sec_bangla_n, SUM(sal.grosssal_ch + sal.grosssal_bk)grosssal_n,
               SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal_n, SUM(sal.houserent_ch + sal.houserent_bk)houserent_n,SUM(sal.medical)medical_sal_n, 
               SUM(sal.transport)transport_n,SUM(sal.foodallow)foodallow_n, SUM(sal.otherallow_ch + sal.otherallow_bk)otherallow_n,	
               SUM(sal.total_absent_ded_ch + sal.total_absent_ded_bk)total_absent_ded_n,  SUM(sal.netwages_ch + sal.netwages_bk)netwages_n, 
               SUM(sal.attbonus_ch+sal.attbonus_bk)attbonus_n,SUM(mon.sal_ot_hr)sal_ot_hr_n, SUM(sal.sal_ot_amt_ch + sal.sal_ot_amt_bk)sal_ot_amt_n,
               SUM(sal.arrear_amt_ch + sal.arrear_amt_bk)arrear_amt_n,SUM(sal.netpayable_ch + sal.netpayable_bk)netpayable_n, 
               SUM(sal.advance_amt_ch + sal.advance_amt_bk)advance_n, SUM(sal.adv_sal_ch + sal.adv_sal_bk)adv_sal_n,
               SUM(sal.advance_amt_ch + sal.adv_sal_ch + sal.advance_amt_bk+sal.adv_sal_bk)total_advance_n, 
               SUM(sal.stamp_ch + sal.stamp_bk)stamp_n,  SUM(sal.netpayment_ch + sal.netpayment_bk)netpayment_n, 
               SUM(sal.netpayment_ch_rd + sal.netpayment_bk_rd)netpayment_rd_n, SUM(nt_bill_ch + nt_bill_pt_ch + nt_bill_bk + nt_bill_pt_bk)nt_bill_n,
               SUM(tiffin_bill_ch + tiffin_bill_pt_ch + tiffin_bill_bk + tiffin_bill_pt_bk)tf_bill_n,SUM(iftar_bill_ch + iftar_bill_bk)if_bill_n,
               SUM(dinner_bill_ch + dinner_bill_bk)dn_bill_n,  SUM(gt_holi_bill_ch + gt_holi_bill_bk)gt_bill_n, SUM(wk_holi_bill_ch + wk_holi_bill_bk)wk_bill_n
FROM   tb_month_salary sal,tb_month_totalday  mon, tb_personal_info per 
WHERE  per.company    = :p_company 
AND       per.company     = sal.company 
AND       per.company     = mon.company 
AND       mon.finyear       =  :p_year 
AND       mon.finmonth    =  :p_month 
AND       mon.finyear       =  sal.finyear 
AND       mon.finmonth    =  sal.finmonth 
AND       (sal.netpayment_ch_rd + sal.netpayment_bk_rd) > 0 
AND       per.otorg          = 'N'
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

---------------- ORORG = 'Y'    


SELECT COUNT(sal.cardno)total_emp_y, sal.sectionnm sectionnm_y, sal.sec_bangla sec_bangla_y, SUM(sal.grosssal_ch + sal.grosssal_bk)grosssal_y,
               SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal_y, SUM(sal.houserent_ch + sal.houserent_bk)houserent_y,SUM(sal.medical)medical_sal_y, 
               SUM(sal.transport)transport_y,SUM(sal.foodallow)foodallow_y, SUM(sal.otherallow_ch + sal.otherallow_bk)otherallow_y,	
               SUM(sal.total_absent_ded_ch + sal.total_absent_ded_bk)total_absent_ded_y,  SUM(sal.netwages_ch + sal.netwages_bk)netwages_y, 
               SUM(sal.attbonus_ch+sal.attbonus_bk)attbonus_y,SUM(mon.sal_ot_hr)sal_ot_hr_y, SUM(sal.sal_ot_amt_ch + sal.sal_ot_amt_bk)sal_ot_amt_y,
               SUM(sal.arrear_amt_ch + sal.arrear_amt_bk)arrear_amt_y,SUM(sal.netpayable_ch + sal.netpayable_bk)netpayable_y, 
               SUM(sal.advance_amt_ch + sal.advance_amt_bk)advance_y, SUM(sal.adv_sal_ch + sal.adv_sal_bk)adv_sal_y,
               SUM(sal.advance_amt_ch + sal.adv_sal_ch + sal.advance_amt_bk+sal.adv_sal_bk)total_advance_y, 
               SUM(sal.stamp_ch + sal.stamp_bk)stamp_y,  SUM(sal.netpayment_ch + sal.netpayment_bk)netpayment_y, 
               SUM(sal.netpayment_ch_rd + sal.netpayment_bk_rd)netpayment_rd_y, SUM(nt_bill_ch + nt_bill_pt_ch + nt_bill_bk + nt_bill_pt_bk)nt_bill_y,
               SUM(tiffin_bill_ch + tiffin_bill_pt_ch + tiffin_bill_bk + tiffin_bill_pt_bk)tf_bill_y,SUM(iftar_bill_ch + iftar_bill_bk)if_bill_y,
               SUM(dinner_bill_ch + dinner_bill_bk)dn_bill_y,  SUM(gt_holi_bill_ch + gt_holi_bill_bk)gt_bill_y, SUM(wk_holi_bill_ch + wk_holi_bill_bk)wk_bill_y
FROM   tb_month_salary sal,tb_month_totalday  mon, tb_personal_info per 
WHERE  per.company    = :p_company 
AND       per.company     = sal.company 
AND       per.company     = mon.company 
AND       mon.finyear       =  :p_year 
AND       mon.finmonth    =  :p_month 
AND       mon.finyear       =  sal.finyear 
AND       mon.finmonth    =  sal.finmonth 
AND       (sal.netpayment_ch_rd + sal.netpayment_bk_rd) > 0 
AND       per.otorg          = 'Y'
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