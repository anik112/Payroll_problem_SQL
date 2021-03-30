SELECT SUM(hazar)hazar, SUM(pancho)pancho, SUM(duisho)duisho, SUM(aksho)aksho, SUM(panchash)panchash, 
          SUM(bish)bish, SUM(dash)dash, SUM(panch)panch, SUM(dui)dui, SUM(ek)ek,
          sectionnm, COUNT(cardno)total_emp, SUM(payment_amt)payment_amt
FROM TB_CLR_DENOMINATION
GROUP BY sectionnm
ORDER BY sectionnm ASC




-------------------- Table  

CREATE TABLE TB_CLR_DENOMINATION
(
  DEPARTMENTNM  VARCHAR2(150 BYTE),
  SECTIONNM     VARCHAR2(150 BYTE),
  LINENO        VARCHAR2(50 BYTE),
  FLOORNO       VARCHAR2(50 BYTE),
  MACHINENO     VARCHAR2(80 BYTE),
  CARDNO        VARCHAR2(15 BYTE),
  HAZAR         NUMBER,
  PANCHO        NUMBER,
  DUISHO        NUMBER,
  AKSHO         NUMBER,
  USENESS       NUMBER,
  USENESS_TM    NUMBER,
  USENESS_PT    NUMBER,
  PANCHASH      NUMBER,
  CHALIS        NUMBER,
  BISH          NUMBER,
  DASH          NUMBER,
  PANCH         NUMBER,
  DUI           NUMBER,
  EK            NUMBER,
  USELESS       NUMBER,
  USELESS_TM    NUMBER,
  USELESS_PT    NUMBER,
  PAYMENT_AMT   NUMBER DEFAULT 0
)
