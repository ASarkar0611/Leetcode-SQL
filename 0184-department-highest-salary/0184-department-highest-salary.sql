# Write your MySQL query statement below
select d.name as 'Department', tb.name as 'Employee',
tb.salary as 'Salary'
from
(select e.departmentId, e.name, e.salary,
dense_rank() over (partition by e.departmentId order by e.salary desc) as r
from employee e) tb
inner join Department d on tb.departmentId = d.id
where tb.r = 1;
