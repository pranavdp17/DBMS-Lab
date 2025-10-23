insert into accident values (11, '2003-01-01','Mysore Road');

insert into accident values (12,'2004-02-02','South end Circle');

insert into accident values (13,'2003-01-21','Bull temple Road');

insert into accident values (14,'2008-02-17','Mysore Road');

insert into accident values (15,'2004-03-05','Kanakpura Road');

select * from accident;

insert into Person (Driver_ID, Name, Address)
values
("A01", "Richard", "Srinivas Nagar"),
("A02", "Pradeep", "Rajaji Nagar"),
("A03", "Smith", "Ashok Nagar"),
("A04", "Venu", "N R Colony"),
("A05", "John", "Hanumanth Nagar");

select * from Person;

insert into Car (Reg_Num, Model, Year)
values
("KA052250", "Indica", 1990),
("KA031181", "Lancer", 1957),
("KA095477", "Toyota", 1998),
("KA053408", "Honda", 2008),
("KA041702", "Audi", 2005);

select * from Car;

insert into Owns (Driver_ID, Reg_Num)
values
("A01", "KA052250"),
("A02", "KA053408"),
("A03", "KA031181"),
("A04", "KA095477"),
("A05", "KA041702");

select * from Owns;

insert into participated (Driver_ID, Reg_Num, Report_Num, Damage_Amount)
values
("A01", "KA052250", 11, 10000),
("A02", "KA053408", 12, 50000),
("A03", "KA095477", 13, 25000),
("A04", "KA031181", 14, 3000),
("A05", "KA041702", 15, 5000);

select * from participated;

update participated set damage_amount=25000

where reg_num='KA053408' and report_num=12;

select * from participated;

select count(distinct driver_id) CNT

from participated a, accident b

where a.report_num=b.report_num and b.accident_date like '%08%';

insert into accident values(16,'2008-03-08','Domlur');

select * from accident;

select accident_date,location from accident;

select driver_id from participated where damage_amount>=25000;