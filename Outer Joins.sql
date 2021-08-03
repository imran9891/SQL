--SELF JOINS
/*
select a.id, a.name as "employee", b.name as "supervisor name"
from employee as a, employee as bool_accum_inv( internal, boolean )
where a.supevisorId = b.id;
*/

--OUTER JOINS: left and right
/*
select count(emp.emp_no)
from employees as emp
left join dept_manager as dep
on emp.emp_no = dep.emp_no
where dep.emp_no is null;
*/
/*
Select a.emp_no,
concat(a.first_name, a.last_name) AS "name",
b.salary,
coalesce(c.title,'no title change') as "Designation",
coalesce(c.from_date::text,'-') AS "title taken on"
from employees as a
inner join salaries as b on b.emp_no = a.emp_no
left join titles as c on c.emp_no = a.emp_no
AND (c.from_date = b.from_date oR c.from_date = b.from_date + interval '2 days')
order by a.emp_no;
*/

--CROSS JOINS, FULL JOINS

/*
select c.firstname, c.lastname, c.customerid, o.orderid 
from customers as c
inner join orders as o on o.customerid = c.customerid
AND (c.state='OH' or c.state='NY' or c.state='OH')
order by o.orderid
*/

/*
select c.firstname, c.lastname, o.orderid 
from orders as o
inner join customers as c on o.customerid = c.customerid
where c.state in ('OH','NY','OH')
order by o.orderid
*/

/*
select p.prod_id, i.quan_in_stock
from products as p
inner join inventory As i on p.prod_id = i.prod_id
*/

/*
select e.first_name, dp.dept_name
from employees as e
inner join dept_emp as de on de.emp_no = e.emp_no
inner join departments as dp on dp.dept_no = de.dept_no
*/s