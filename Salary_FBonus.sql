SELECT sal.cardno, sal.departmentnm, sal.dept_bangla, sal.sectionnm, sal.sec_bangla, sal.lineno, sal.floorno, sal.machineno,
       sal.empname, sal.enmname_bangla, sal.designation, sal.designation_ban, sal.salary_grd, per.joining_date, per.resignation_date,
       mon.total_day, mon.week_day, mon.govt_day, mon.casual, mon.earned, mon.medical, mon.lwp, mon.total_leave, mon.total_present, mon.total_absent, mon.total_attn_day,
       (sal.grosssal_ch+sal.grosssal_bk)grosssal, (sal.basicsal_ch+sal.basicsal_bk)basicsal, (sal.houserent_ch+sal.houserent_bk)houserent, sal.medical medical_sal, sal.transport, sal.foodallow, 
       (sal.otherallow_ch+sal.otherallow_bk)otherallow, (sal.total_absent_ded_ch + sal.total_absent_ded_bk)total_absent_ded, (sal.netwages_ch+sal.netwages_bk)netwages, mon.late_day, 
       (sal.attbonus_ch + sal.attbonus_bk)attbonus,  mon.sal_ot_hr,   sal.otrate, (sal.sal_ot_amt_ch + sal.sal_ot_amt_bk)sal_ot_amt, (sal.fs_bonus_ch + sal.fs_bonus_bk)fs_bonus,
       (sal.arrear_amt_ch + sal.arrear_amt_bk)arrear_amt, (sal.netpayable_ch+sal.netpayable_bk)netpayable, (sal.advance_amt_ch +sal.advance_amt_bk)advance_amt, 
       (sal.adv_sal_ch+sal.adv_sal_bk)adv_sal,  (sal.advance_amt_ch+sal.adv_sal_ch + sal.advance_amt_bk+sal.adv_sal_bk)total_advance, 
       (sal.stamp_ch+sal.stamp_bk)stamp,  (sal.netpayment_ch+sal.netpayment_bk)netpayment, (sal.netpayment_ch_rd+sal.netpayment_bk_rd)netpayment_rd, per.cash_type,  
       per.bank_name,  per.ac_no, per.mft_type,  per.mft_acno 
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  per.company  = :p_company 
AND    sal.company        = per.company 
AND    mon.company     = per.company 
AND    mon.finyear    =  :p_year 
AND    mon.finmonth =  :p_month 
AND    mon.finyear    =  sal.finyear 
AND    mon.finmonth =  sal.finmonth 
AND    (sal.netpayment_ch_rd + sal.netpayment_bk_rd) > 0 
AND    sal.cardno     =  per.cardno 
AND    mon.cardno   =  per.cardno 
AND    sal.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    sal.sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    sal.designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation) 
AND    per.workertype     LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND    sal.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno) 
AND    sal.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno) 
AND    sal.lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.cash_type      LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND    per.bank_name    LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type         LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND    sal.sal_status       LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status      LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    per.shift                LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    sal.cardno            LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND    per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY sal.departmentnm, sal.sectionnm,sal.lineno, sal.cardno ASC