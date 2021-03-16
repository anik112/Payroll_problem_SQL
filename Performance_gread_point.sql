SELECT a.performance, a.sectionnm, a.percnt,b.totcnt, ROUND((a.percnt * 100) / b.totcnt,2) PERCENT
FROM
    (SELECT NVL(other.performance,'*Not Define*') performance, info.sectionnm, COUNT(other.cardno) percnt 
	FROM   TB_PERSONAL_INFO_OTHER other,TB_PERSONAL_INFO info 
	WHERE  info.company = :p_company
	AND    info.company = other.company
	AND    info.cardno  = other.cardno
	AND    other.purposeofwork LIKE DECODE(NVL(:p_purposewk,'all'),'all','%',:p_purposewk)
	AND    info.gender         LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
	AND    info.active         LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)                   
	GROUP BY other.performance,info.sectionnm
	)a,
	(SELECT COUNT(other.cardno) totcnt 
	FROM   TB_PERSONAL_INFO_OTHER other,TB_PERSONAL_INFO info
	WHERE  info.company = :p_company
	AND    info.company = other.company
	AND    info.cardno  = other.cardno	  
	AND    other.purposeofwork LIKE DECODE(NVL(:p_purposewk,'all'),'all','%',:p_purposewk)
	AND    info.gender         LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
	AND    info.active         LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
	)b
ORDER BY a.sectionnm , a.performance ASC



--------------------------------------- v2   




SELECT a.PURPOSEOFWORK, a.sectionnm, a.percnt,b.totcnt, ROUND((a.percnt * 100) / b.totcnt,2) PERCENT
FROM  
    (SELECT NVL(OTHER.PURPOSEOFWORK,'*Not Define*') PURPOSEOFWORK,  INFO.sectionnm, COUNT(OTHER.CARDNO) percnt 
    FROM  TB_PERSONAL_INFO_OTHER OTHER,TB_PERSONAL_INFO INFO 
    WHERE INFO.company = :p_company
    AND   INFO.company = OTHER.company
    AND   INFO.CARDNO  = OTHER.CARDNO
    AND   other.purposeofwork LIKE DECODE(NVL(:p_purposewk,'all'),'all','%',:p_purposewk)
    AND   info.gender         LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
    AND   info.active         LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)                  
    GROUP BY OTHER.PURPOSEOFWORK ,INFO.sectionnm 
    )a,
    (SELECT COUNT(other.CARDNO) totcnt 
    FROM  TB_PERSONAL_INFO_OTHER other,TB_PERSONAL_INFO INFO
    WHERE info.company = :p_company
    AND   INFO.company = OTHER.company
    AND   INFO.CARDNO  = OTHER.CARDNO	  
    AND   other.purposeofwork LIKE DECODE(NVL(:p_purposewk,'all'),'all','%',:p_purposewk)
    AND   info.gender         LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
    AND   info.active         LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
    )b
ORDER BY a.sectionnm , a.PURPOSEOFWORK ASC	  