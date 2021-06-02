SELECT * FROM TB_DATA_MASTER_TEMP
WHERE company=4
AND   finyear=2021
AND   finmonth='May'
AND   pdate BETWEEN '02-May-2021' AND '11-May-2021'
AND   outtime IS NULL

--and   otmin_v>= 30
AND   otmin=120



SELECT tmp.CARDNO, tmp.PDATE, tmp.INTIME, tmp.OUTTIME, tmp.OTHR, mst.INTIME, mst.OUTTIME, mst.DURATION, mst.OTHR 
FROM TB_DATA_MASTER_TEMP tmp, TB_DATA_MASTER mst
WHERE tmp.company=4
AND   tmp.COMPANY = mst.COMPANY
AND   tmp.finyear=2021
AND   tmp.FINYEAR=mst.FINYEAR
AND   tmp.finmonth='May'
AND   tmp.FINMONTH=mst.FINMONTH
AND   tmp.pdate BETWEEN '02-May-2021' AND '11-May-2021'
AND   tmp.PDATE = mst.PDATE
AND   tmp.outtime IS NULL
AND   tmp.CARDNO = mst.CARDNO




UPDATE TB_DATA_MASTER_TEMP
SET outtime='17:'||TRUNC(DBMS_RANDOM.VALUE(10, 30))||':'||TRUNC(DBMS_RANDOM.VALUE(10, 59))||' PM',
    duration= '10:'||TRUNC(DBMS_RANDOM.VALUE(30, 50))
WHERE company = 4
AND   finyear = 2021
AND   finmonth= 'May'
AND   pdate BETWEEN '02-May-2021' AND '11-May-2021'
AND   outtime IS NULL
AND   otmin=120



UPDATE TB_DATA_MASTER_TEMP tmp
SET (outtime,duration)=
(SELECT outtime, duration
FROM TB_DATA_MASTER
WHERE company = 4
AND   finyear = 2021
AND   finmonth= 'May'
AND   pdate=tmp.PDATE
AND   cardno=tmp.CARDNO)
WHERE company=4
AND   finyear=2021
AND   finmonth='May'
AND   pdate BETWEEN '02-May-2021' AND '11-May-2021'
and   outtime is null