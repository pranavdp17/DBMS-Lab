select * from car order by year asc;

select count(report_num)

from car c, participated p

where c.reg_num=p.reg_num and c.model='Lancer';

select * from participated order by damage_amount desc;

select avg(damage_amount) from participated;

delete from participated where damage_amount<13600;

select * from participated;

select name from person , participated a where person.driver_id=a.driver_id;

select max(damage_amount) from participated;