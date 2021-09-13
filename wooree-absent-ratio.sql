SELECT COUNT(jan_date) cnt_jan, ROUND(SUM(jan_abs_percent)/COUNT(jan_date),2) percent_jan,month_jan
FROM (
SELECT a.totemp totemp,b.jan_prsnt jan_prsnt,(a.totemp - b.jan_prsnt)jan_absnt,b.month_jan, 
              ROUND(((a.totemp - b.jan_prsnt) * 100)/a.totemp,2)jan_abs_percent,b.pdate jan_date
FROM ( 
           SELECT COUNT(cardno)totemp 
           FROM   tb_personal_info 
           WHERE  active       = 0 
           AND        company  = :p_company
)a, 
(SELECT COUNT(cardno)jan_prsnt,pdate,'January' month_jan
            FROM   tb_data_master 
            WHERE  company   = :p_com 
            AND    finyear           = :p_year 
            AND    finmonth        = 'January' 
            GROUP BY pdate
            ORDER BY pdate ASC)
b)
GROUP BY month_jan


SELECT COUNT(apr_date) cnt_apr, ROUND(SUM(apr_abs_percent)/COUNT(apr_date),2) percent_apr,month_apr
FROM (
SELECT a.totemp totemp,b.apr_prsnt apr_prsnt,(a.totemp - b.apr_prsnt)apr_absnt,b.month_apr, 
       ROUND(((a.totemp - b.apr_prsnt) * 100)/a.totemp,2)apr_abs_percent,b.pdate apr_date
FROM ( 
SELECT COUNT(cardno)totemp 
FROM   tb_personal_info 
WHERE  active   = 0 
AND    company  = :p_company)a, 
(SELECT COUNT(cardno)apr_prsnt,pdate,'April' month_apr
FROM   tb_data_master 
WHERE  company   = :p_com 
AND    finyear   = :p_year 
AND    finmonth  = 'April' 
GROUP BY pdate
ORDER BY pdate ASC)b)
GROUP BY month_apr

SELECT COUNT(Jul_date) cnt_Jul, ROUND(SUM(Jul_Abs_percent)/COUNT(Jul_date),2) Percent_Jul,Month_Jul
FROM (
SELECT a.totemp totemp,b.Jul_Prsnt Jul_Prsnt,(a.totemp - b.Jul_Prsnt)Jul_Absnt,b.Month_Jul, 
       ROUND(((a.totemp - b.Jul_Prsnt) * 100)/a.totemp,2)Jul_Abs_percent,b.pdate Jul_date
FROM ( 
SELECT COUNT(cardno)totemp 
FROM   tb_personal_info 
WHERE  active   = 0 
AND    company  = :p_company)a, 
(SELECT COUNT(cardno)Jul_Prsnt,pdate,'July' Month_Jul
FROM   TB_DATA_MASTER 
WHERE  company   = :p_com 
AND    finyear   = :p_year 
AND    finmonth  = 'July' 
GROUP BY pdate
ORDER BY pdate ASC)b)
GROUP BY month_Jul


SELECT COUNT(Oct_date) cnt_Oct, ROUND(SUM(Oct_Abs_percent)/COUNT(Oct_date),2) Percent_Oct,Month_Oct
FROM (
SELECT a.totemp totemp,b.Oct_Prsnt Oct_Prsnt,(a.totemp - b.Oct_Prsnt)Oct_Absnt,b.Month_Oct, 
       ROUND(((a.totemp - b.Oct_Prsnt) * 100)/a.totemp,2)Oct_Abs_percent,b.pdate Oct_date
FROM ( 
SELECT COUNT(cardno)totemp 
FROM   tb_personal_info 
WHERE  active   = 0 
AND    company  = :p_company)a, 
(SELECT COUNT(cardno)Oct_Prsnt,pdate,'October' Month_Oct
FROM   TB_DATA_MASTER 
WHERE  company   = :p_com 
AND    finyear   = :p_year 
AND    finmonth  = 'October' 
GROUP BY pdate
ORDER BY pdate ASC)b)
GROUP BY month_Oct


SELECT COUNT(Feb_date) cnt_Feb, ROUND(SUM(Feb_Abs_percent)/COUNT(Feb_date),2) Percent_Feb,Month_Feb
FROM (
SELECT a.totemp totemp,b.Feb_Prsnt Jan_Prsnt,(a.totemp - b.Feb_Prsnt)Feb_Absnt,b.Month_Feb, 
       ROUND(((a.totemp - b.Feb_Prsnt) * 100)/a.totemp,2)Feb_Abs_percent,b.pdate Feb_date
FROM ( 
SELECT COUNT(cardno)totemp 
FROM   tb_personal_info 
WHERE  active   = 0 
AND    company  = :p_company)a, 
(SELECT COUNT(cardno)Feb_Prsnt,pdate,'February' Month_Feb
FROM   TB_DATA_MASTER 
WHERE  company   = :p_com 
AND    finyear   = :p_year 
AND    finmonth  = 'February' 
GROUP BY pdate
ORDER BY pdate ASC)b)
GROUP BY month_Feb


SELECT COUNT(May_date) cnt_May, ROUND(SUM(May_Abs_percent)/COUNT(May_date),2) Percent_May,Month_May
FROM (
SELECT a.totemp totemp,b.May_Prsnt Mar_Prsnt,(a.totemp - b.May_Prsnt)May_Absnt,b.Month_May, 
       ROUND(((a.totemp - b.May_Prsnt) * 100)/a.totemp,2)May_Abs_percent,b.pdate May_date
FROM ( 
SELECT COUNT(cardno)totemp 
FROM   tb_personal_info 
WHERE  active   = 0 
AND    company  = :p_company)a, 
(SELECT COUNT(cardno)May_Prsnt,pdate,'May' Month_May
FROM   TB_DATA_MASTER 
WHERE  company   = :p_com 
AND    finyear   = :p_year 
AND    finmonth  = 'May' 
GROUP BY pdate
ORDER BY pdate ASC)b)
GROUP BY month_May


SELECT COUNT(Aug_date) cnt_Aug, ROUND(SUM(Aug_Abs_percent)/COUNT(Aug_date),2) Percent_Aug,Month_Aug
FROM (
SELECT a.totemp totemp,b.Aug_Prsnt Aug_Prsnt,(a.totemp - b.Aug_Prsnt)Aug_Absnt,b.Month_Aug, 
       ROUND(((a.totemp - b.Aug_Prsnt) * 100)/a.totemp,2)Aug_Abs_percent,b.pdate Aug_date
FROM ( 
SELECT COUNT(cardno)totemp 
FROM   tb_personal_info 
WHERE  active   = 0 
AND    company  = :p_company)a, 
(SELECT COUNT(cardno)Aug_Prsnt,pdate,'August' Month_Aug
FROM   TB_DATA_MASTER 
WHERE  company   = :p_com 
AND    finyear   = :p_year 
AND    finmonth  = 'August' 
GROUP BY pdate
ORDER BY pdate ASC)b)
GROUP BY month_Aug


SELECT COUNT(Nov_date) cnt_Nov, ROUND(SUM(Nov_Abs_percent)/COUNT(Nov_date),2) Percent_Nov,Month_Nov
FROM (
SELECT a.totemp totemp,b.Nov_Prsnt Nov_Prsnt,(a.totemp - b.Nov_Prsnt)Nov_Absnt,b.Month_Nov, 
       ROUND(((a.totemp - b.Nov_Prsnt) * 100)/a.totemp,2)Nov_Abs_percent,b.pdate Nov_date
FROM ( 
SELECT COUNT(cardno)totemp 
FROM   tb_personal_info 
WHERE  active   = 0 
AND    company  = :p_company)a, 
(SELECT COUNT(cardno)Nov_Prsnt,pdate,'November' Month_Nov
FROM   TB_DATA_MASTER 
WHERE  company   = :p_com 
AND    finyear   = :p_year 
AND    finmonth  = 'November' 
GROUP BY pdate
ORDER BY pdate ASC)b)
GROUP BY month_Nov


SELECT COUNT(Mar_date) cnt_Mar, ROUND(SUM(Mar_Abs_percent)/COUNT(Mar_date),2) Percent_Mar,Month_Mar
FROM (
SELECT a.totemp totemp,b.Mar_Prsnt Mar_Prsnt,(a.totemp - b.Mar_Prsnt)Mar_Absnt,b.Month_Mar, 
       ROUND(((a.totemp - b.Mar_Prsnt) * 100)/a.totemp,2)Mar_Abs_percent,b.pdate Mar_date
FROM ( 
SELECT COUNT(cardno)totemp 
FROM   tb_personal_info 
WHERE  active   = 0 
AND    company  = :p_company)a, 
(SELECT COUNT(cardno)Mar_Prsnt,pdate,'March' Month_Mar
FROM   TB_DATA_MASTER 
WHERE  company   = :p_com 
AND    finyear   = :p_year 
AND    finmonth  = 'March' 
GROUP BY pdate
ORDER BY pdate ASC)b)
GROUP BY month_Mar


SELECT COUNT(Jun_date) cnt_Jun, ROUND(SUM(Jun_Abs_percent)/COUNT(Jun_date),2) Percent_Jun,Month_Jun
FROM (
SELECT a.totemp totemp,b.Jun_Prsnt Jun_Prsnt,(a.totemp - b.Jun_Prsnt)Jun_Absnt,b.Month_Jun, 
       ROUND(((a.totemp - b.Jun_Prsnt) * 100)/a.totemp,2)Jun_Abs_percent,b.pdate Jun_date
FROM ( 
SELECT COUNT(cardno)totemp 
FROM   tb_personal_info 
WHERE  active   = 0 
AND    company  = :p_company)a, 
(SELECT COUNT(cardno)Jun_Prsnt,pdate,'June' Month_Jun
FROM   TB_DATA_MASTER 
WHERE  company   = :p_com 
AND    finyear   = :p_year 
AND    finmonth  = 'June' 
GROUP BY pdate
ORDER BY pdate ASC)b)
GROUP BY month_Jun

SELECT COUNT(Sep_date) cnt_Sep, ROUND(SUM(Sep_Abs_percent)/COUNT(Sep_date),2) Percent_Sep,Month_Sep
FROM (
SELECT a.totemp totemp,b.Sep_Prsnt Sep_Prsnt,(a.totemp - b.Sep_Prsnt)Sep_Absnt,b.Month_Sep, 
       ROUND(((a.totemp - b.Sep_Prsnt) * 100)/a.totemp,2)Sep_Abs_percent,b.pdate Sep_date
FROM ( 
SELECT COUNT(cardno)totemp 
FROM   tb_personal_info 
WHERE  active   = 0 
AND    company  = :p_company)a, 
(SELECT COUNT(cardno)Sep_Prsnt,pdate,'September' Month_Sep
FROM   TB_DATA_MASTER 
WHERE  company   = :p_com 
AND    finyear   = :p_year 
AND    finmonth  = 'September' 
GROUP BY pdate
ORDER BY pdate ASC)b)
GROUP BY month_Sep


SELECT COUNT(Dec_date) cnt_Dec, ROUND(SUM(Dec_Abs_percent)/COUNT(Dec_date),2) Percent_Dec,Month_Dec
FROM (
SELECT a.totemp totemp,b.Dec_Prsnt Dec_Prsnt,(a.totemp - b.Dec_Prsnt)Dec_Absnt,b.Month_Dec, 
       ROUND(((a.totemp - b.Dec_Prsnt) * 100)/a.totemp,2)Dec_Abs_percent,b.pdate Dec_date
FROM ( 
SELECT COUNT(cardno)totemp 
FROM   tb_personal_info 
WHERE  active   = 0 
AND    company  = :p_company)a, 
(SELECT COUNT(cardno)Dec_Prsnt,pdate,'December' Month_Dec
FROM   TB_DATA_MASTER 
WHERE  company   = :p_com 
AND    finyear   = :p_year 
AND    finmonth  = 'December' 
GROUP BY pdate
ORDER BY pdate ASC)b)
GROUP BY month_Dec