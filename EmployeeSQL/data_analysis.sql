

--List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e join salaries s
on e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
select last_name, first_name, hire_date
from employees 
where hire_date 
between '1986-01-01' and '1986-12-31';

--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.

select dm.emp_no, dm.dept_no, d.dept_name, e.last_name, e.first_name 
from dept_manager dm 
join departments d
on dm.dept_no = d.dept_no
join employees e
on dm.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_no, dm.dept_name
from employees e
join dept_emp d
on e.emp_no = d.emp_no
join departments dm
on dm.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose 
--last name begins with the letter B.
select first_name, last_name, sex
from employees 
where first_name = 'Hercules' and last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp dm
on e.emp_no = dm.emp_no
join departments d
on dm.dept_no = d.dept_no
where dm.dept_no = 'd007';

--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp dm
on e.emp_no = dm.emp_no
join departments d
on dm.dept_no = d.dept_no
where dm.dept_no = 'd007' or dm.dept_no = 'd005';

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
order by count(last_name) desc;