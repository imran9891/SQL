--How many employees worked in each department?
/*
select d.dept_name, count(emp_no) as "No.of Employees"
from dept_emp as de
inner join departments As d using (dept_no)
group by d.dept_name;
*/

--How many people were hired on any given date?
/*
select e.hire_date, count(emp_no) as "Employees Hired"
from employees as e
group by e.hire_date
*/

--Show me all the employees, hired after 1991 and count the amount of positions they've had?
/*
Select e.emp_no, e.first_name, e.hire_date, count(t.title) as "Positions"
from employees as e
JOIN titles as t using (emp_no)
where hire_date::text > '1991-12-31'
group by (e.emp_no);
*/

--Show me all the employees that work in the department development and the from and to date?
/*
Select e.emp_no, e.first_name, d.dept_name, de.from_date, de.to_date
from employees as e
join dept_emp as de using(emp_no)
join departments as d ON (d.dept_no = de.dept_no)
where d.dept_name = 'Development'
group by (e.emp_no, de.from_date, de.to_date, d.dept_name);
*/