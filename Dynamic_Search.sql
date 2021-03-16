SELECT  info.sectionnm, info.cardno, info.secreteno, info.empname, info.designation, pic.emppicture 
FROM     TB_PERSONAL_INFO info, TB_PERSONAL_INFO_PICTURE pic
WHERE  info.company  = :p_company
AND    info.company      = pic.company
AND    info.cardno         = pic.cardno
AND    info.cardno                     LIKE '%'||:card||'%'
AND    info.secreteno                LIKE DECODE (NVL(:secrete,'all'),'all','%',:secrete)	
AND    UPPER(info.empname)  LIKE '%'||UPPER(:ename)||'%'
AND    info.ac_no                      LIKE DECODE (NVL(:p_bankac,'all'),'all','%',:p_bankac)
ORDER BY info.cardno ASC	 


--------------------------------


SELECT info.sectionnm, info.cardno, info.secreteno, info.empname, info.designation, pic.emppicture 
FROM TB_PERSONAL_INFO info, TB_PERSONAL_INFO_PICTURE pic
WHERE  info.company  = :p_company
AND    info.company    = pic.company
AND    info.cardno       = pic.cardno
AND    info.cardno                     LIKE '%'||:card||'%'
AND    info.secreteno                LIKE DECODE (NVL(:secrete,'all'),'all','%',:secrete)	
AND    UPPER(info.empname)  LIKE '%'||UPPER(:ename)||'%'
AND    info.mft_acno                      LIKE DECODE (NVL(:p_bankac,'all'),'all','%',:p_bankac)
ORDER BY info.cardno ASC 


---------------------------------



SELECT info.sectionnm, info.cardno, info.secreteno, info.empname, info.designation, pic.emppicture 
FROM TB_PERSONAL_INFO info, TB_PERSONAL_INFO_PICTURE pic, TB_PERSONAL_INFO_OTHER other
WHERE  info.company  = :p_company
AND    info.company    = pic.company
AND    info.company    = other.company
AND    info.cardno       = pic.cardno
AND    info.cardno       = other.cardno
AND    info.cardno                     LIKE '%'||:card||'%'
AND    info.secreteno                LIKE DECODE (NVL(:secrete,'all'),'all','%',:secrete)	
AND    UPPER(info.empname)  LIKE '%'||UPPER(:ename)||'%'
AND    other.own_cellno LIKE DECODE (NVL(:p_cellno,'all'),'all','%',:p_cellno)
ORDER BY info.cardno ASC	 


---------------------------------------



SELECT info.sectionnm, info.cardno, info.secreteno, info.empname, info.designation, pic.emppicture 
FROM   TB_PERSONAL_INFO info, TB_PERSONAL_INFO_PICTURE pic, TB_PERSONAL_INFO_OTHER other
WHERE  info.company  = :p_company
AND    info.company    = pic.company
AND    info.company    = other.company
AND    info.cardno       = pic.cardno
AND    info.cardno       = other.cardno
AND    info.cardno                     LIKE '%'||:card||'%'
AND    info.secreteno                LIKE DECODE (NVL(:secrete,'all'),'all','%',:secrete)	
AND    UPPER(info.empname)  LIKE '%'||UPPER(:ename)||'%'
AND    other.nominee_cellno LIKE DECODE (NVL(:p_cellno,'all'),'all','%',:p_cellno)
ORDER BY info.cardno ASC	 


-----------------------



SELECT info.sectionnm, info.cardno, info.secreteno, info.empname, info.designation, pic.emppicture 
FROM TB_PERSONAL_INFO info, TB_PERSONAL_INFO_PICTURE pic
WHERE  info.company  = :p_company
AND    info.company    = pic.company
AND    info.cardno       = pic.cardno
AND    info.cardno                     LIKE '%'||:card||'%'
AND    info.secreteno                LIKE DECODE (NVL(:secrete,'all'),'all','%',:secrete)	
AND    UPPER(info.empname)  LIKE '%'||UPPER(:ename)||'%'
ORDER BY info.cardno ASC	 