create database supplier;
use supplier;
CREATE TABLE Supplier (
    sid INT PRIMARY KEY,
    sname VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Parts (
    pid INT PRIMARY KEY,
    pname VARCHAR(50),
    color VARCHAR(50)
);

CREATE TABLE Catalog (
    sid INT,
    pid INT,
    cost DECIMAL(10, 2),
    PRIMARY KEY (sid, pid),
    FOREIGN KEY (sid) REFERENCES Supplier(sid),
    FOREIGN KEY (pid) REFERENCES Parts(pid)
);

INSERT INTO SUPPLIER (SID, SNAME, CITY) VALUES
(10001, 'Acme Widget', 'Bangalore'),
(10002, 'Johns', 'Kolkata'),
(10003, 'Vimal', 'Mumbai'),
(10004, 'Reliance', 'Delhi');

INSERT INTO PARTS (PID, PNAME, COLOR) VALUES
(20001, 'Book', 'Red'),
(20002, 'Pen', 'Red'),
(20003, 'Pencil', 'Green'),
(20004, 'Mobile', 'Green'),
(20005, 'Charger', 'Black');

INSERT INTO CATALOG (SID, PID, COST) VALUES
(10001, 20001, 10),
(10001, 20002, 10),
(10001, 20003, 30),
(10001, 20004, 10),
(10001, 20005, 10),
(10002, 20001, 10),
(10002, 20002, 20),
(10003, 20003, 30),
(10004, 20003, 40);

select distinct p.pname
from parts p
join catalog c on p.pid = c.pid;

select s.sname
from supplier s
join catalog c on s.sid = c.sid
group by s.sid, s.sname
having count(distinct c.pid) = (select count(*) from parts);

select s.sname
from supplier s
join catalog c on s.sid = c.sid
join parts p on c.pid = p.pid
where p.color = 'red'
group by s.sid, s.sname
having count(distinct p.pid) = (
    select count(*) from parts where color = 'red'
);

select p.pname
from parts p
join catalog c1 on p.pid = c1.pid
join supplier s on c1.sid = s.sid
where s.sname = 'acme widget'
and p.pid not in (
    select c2.pid
    from catalog c2
    where c2.sid != c1.sid
);

select p.pid, s.sname
from parts p
join catalog c on p.pid = c.pid
join supplier s on c.sid = s.sid
where c.cost = (
    select max(c2.cost)
    from catalog c2
    where c2.pid = p.pid
);

