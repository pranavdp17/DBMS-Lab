SELECT m.ename, count(*)
FROM Employee e,Employee m
WHERE e.MgrNo = m.empno
GROUP BY m.ename
HAVING count(*) =(SELECT MAX(mycount)
from (SELECT COUNT(*) mycount
FROM Employee
GROUP BY MgrNo) a);

SELECT *
FROM employee m
WHERE m.empno IN
(SELECT mgrno
FROM employee)
AND m.sal >
(SELECT avg(e.sal)
FROM employee e
WHERE e.mgrno = m.empno );

select distinct m.mgrno,m.ename from employee e,employee m
where e.mgrno=m.mgrno and e.deptno=m.deptno and e.empno in (
select distinct m.mgrno from employee e,employee m
where e.mgrno=m.mgrno and e.deptno=m.deptno);

select *
from employee e,incentives i
where e.empno=i.empno and 2 = ( select count(*)
from incentives j
where i.incentiveamount <= j.incentiveamount )
and i.incentivedate like '2019-01-__';

SELECT *
FROM employee E
WHERE E.DEPTNO = (SELECT E1.DEPTNO
FROM employee E1
WHERE E1.EMPNO=E.MGRNO);