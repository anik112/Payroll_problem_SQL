SELECT per.sectionnm, per.cardno,per.empname, per.departmentnm,per.joining_date, per.designation ,pic.emppicture, SIGN.empsign, 
               per.lineno, per.bloodgroup,  other.nid, per.permanentaddress, per.permanent_add_ban,per.permanent_po_ban,per.permanent_ps_ban, 
               per.permanent_dist_ban, per.enmname_bangla, per.designation_bangla, per.dept_bangla, per.sec_bangla , other.nominee_cellno,
              other.own_cellno, other.purposeofwork, other.emg_con_per_cellno
FROM   TB_PERSONAL_INFO per,TB_PERSONAL_INFO_SIGN SIGN, TB_PERSONAL_INFO_PICTURE pic,
             TB_PERSONAL_INFO_OTHER other, TB_IDCARD_MULTIPLE mul
WHERE  per.company  = :p_company
AND    per.company      = SIGN.company
AND    per.company      = pic.company
AND    per.company      = mul.company
AND    per.company      = other.company
AND    mul.user_name   = :p_user
AND    per.cardno         = SIGN.cardno 
AND    per.cardno         = pic.cardno 
AND    per.cardno         = mul.cardno
AND    per.cardno         = other.cardno 
ORDER BY per.cardno ASC



--------------------------------------

SELECT  per.SECTIONNM, per.cardno,per.empname, per.departmentnm,
        per.joining_date, per.designation ,pic.emppicture, SIGN.empsign, per.lineno, per.BLOODGROUP,  OTHER.NID, per.PERMANENTADDRESS, 
       per.PERMANENT_ADD_BAN,  per.PERMANENT_PO_BAN,  per.PERMANENT_PS_BAN,  per.PERMANENT_DIST_BAN,
        PER.ENMNAME_BANGLA, PER.DESIGNATION_BANGLA, PER.DEPT_BANGLA, PER.SEC_BANGLA , OTHER.NOMINEE_CELLNO,  OTHER.OWN_CELLNO, other.PURPOSEOFWORK, other.EMG_CON_PER_CELLNO
FROM    TB_PERSONAL_INFO per,TB_PERSONAL_INFO_SIGN SIGN, TB_PERSONAL_INFO_PICTURE pic,TB_PERSONAL_INFO_OTHER OTHER,TB_IDCARD_MULTIPLE mul
WHERE   per.company  = :p_company
AND     per.company   = SIGN.company
AND     per.company   = pic.company
AND     per.company  = mul.company
AND     per.company   = OTHER.company
AND    mul.USER_NAME = :p_user
AND     per.cardno  = SIGN.cardno 
AND     per.cardno  = pic.cardno 
AND     per.cardno = mul.cardno
AND     per.cardno  = OTHER.cardno 
ORDER BY per.cardno ASC