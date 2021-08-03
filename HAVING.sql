/*
* WHERE applies filters to individual ROWS
* HAVING applies filters to a group as a whole
*/
--Show departments having only female employees and more than 25000
/*
SELECT d.dept_name, count(e.emp_no) AS "# of employees"
from employees as e 
inner join dept_emp AS de using(emp_no)
inner join departments as d using (dept_no)
where e.gender = 'F'
group By d.dept_name
having count(e.emp_no)>25000
*/

--Show me all the employees, hired after 1991, that have had more than 2 titles
/*
Select e.emp_no, e.first_name, e.hire_date, count(t.title) as "# of titles"
From employees AS e
inner join titles as t using (emp_no)
where Extract(year from hire_date) >1991
group by (e.emp_no, e.first_name, e.hire_date)
having count(t.title) > 2
*/

--Show me all the employees that have had more than 15 salary changes that work in the department development
/*
select e.emp_no, e.first_name, d.dept_name, count(s.salary) as "Salary count"
from employees as e
inner join dept_emp as de using(emp_no)
inner join salaries as s using (emp_no)
inner join departments as d using (dept_no)
where de.dept_no = 'd005'
group by (e.emp_no, e.first_name, d.dept_name)
having count(s.salary) > 15
*/

--Show me all the employees that have worked for multiple departments
/*
select e.emp_no, e.first_name, count(de.dept_no) AS "# of departments worked in"
from employees as e
inner join dept_emp as de using (emp_no)
group by (e.emp_no, e.first_name)
having count(de.dept_no)>1
*/