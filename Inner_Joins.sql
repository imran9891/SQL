--INNER JOINS

/*
select a.emp_no, 
concat(a.first_name, a.last_name) as "name",
b.salary, b.from_date
from employees as a, salaries as b
where a.emp_no = b.emp_no
Order by a.emp_no
*/

/*
Select a.emp_no, 
concat(a.first_name, a.last_name) AS "name",
b.salary, b.from_date
From employees as a
inner join salaries as b on b.emp_no = a.emp_no
order by a.emp_no;
*/

/*
select a.emp_no,
concat(a.first_name, a.last_name) as "name",
b.salary, c.title,
c.from_date As "promoted_on"
From employees AS a
inner join salaries AS b On b.emp_no = a.emp_no
inner join titles AS c on c.emp_no = a.emp_no
and (c.from_date = (b.from_date + interval '2 days')
OR c.from_date = b.from_date)
order by a.emp_no
*/
