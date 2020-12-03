select lpad(bgno,10,0), secno from tb_new

update tb_personal_info info
set info.SECRETENO=(
	select lpad(tst.bgno,10,0) 
	from tb_test tst 
	where tst.SECNO=info.SECRETENO
)


select info.SECRETENO, count(info.CARDNO )
from tb_personal_info info
group by info.SECRETENO

delete from tb_new where
secno in (
select secno from tb_new 
)



select CARDNO, SECRETENO from tb_personal_info 


select lpad(tst.bgno,10,0), tst.secno, info.cardno, info.SECRETENO
from tb_test tst, tb_personal_info info
where tst.SECNO=info.SECRETENO
and info.SECRETENO not in ('0006306072','0007630936', '0006317196',
'0006323404','0006330994','0007624879','0006305468','0006331684',
'0000548388','0006306319','0006318054','0007625491','0006306072',
'0007628129')



update tb_personal_info info
set info.SECRETENO=(
	select lpad(tst.bgno,10,0) 
	from tb_test tst 
	where tst.SECNO=info.SECRETENO
	and tst.SECNO not in ('0006306072','0007628129','0006306072','0005816915','0005823548','00063300107','0006333296','0007631661'))
where info.SECRETENO not in ('0006306072','0007630936', '0006317196',
'0006323404','0006330994','0007624879','0006305468','0006331684',
'0000548388','0006306319','0006318054','0007625491','0006306072',
'0007628129')


select info.SECRETENO, count(info.CARDNO )
from tb_personal_info info
where info.SECRETENO not in ('0006306072','0007630936', '0006317196',
'0006323404','0006330994','0007624879','0006305468','0006331684',
'0000548388','0006306319','0006318054','0007625491','0006306072',
'0007628129','0006306072','0005816915','0005823548','00063300107','0006333296','0007631661') group by info.SECRETENO



select count(bgno) from tb_test
group by secno