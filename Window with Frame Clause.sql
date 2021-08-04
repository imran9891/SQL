--Average salary per department
/*
select d.dept_name, ROUND(AVG(salary)) AS "Avg. Salary"
from salaries 
join dept_emp as de using (emp_no)
join departments as d using (dept_no)
group by dept_no, d.dept_name
*/

--Window Functions create a new column based on functions performed on a subset or "window" of the data
--select max(salary) from salaries
/*
select 
    *,
    MAX(salary) over ()
from salaries
--limit 100
where salary < 70000
*/

--PARTITION BY - divide rows into groups to apply the function against (optional)
/*
select 
    *,
    AVG(salary) Over(
        partition by d.dept_name)
from salaries
join dept_emp as de using (emp_no)
join departments as d using (dept_no)
*/

--order by in window function shows cumulative sum( numeric )
/*
select emp_no,
    count(salary) OVER (
        order by emp_no
        )
From salaries
*/

--FRAME CLAUSE - When using a Frame Clause in a window function we can create a sub-range or frame
--Without ORDER BY by default the framing is usually all partition rows
--With ORDER BY by default the framing is usually everything before the current row and the current row
SELECT emp_no,
       salary,
       count(salary) OVER(
            PARTITION BY emp_no
            --order by salary
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW --rows
        )
FROM salaries