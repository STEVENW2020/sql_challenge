-- Part 1 list employee number, last name, first name, sex and salary
select Employees.emp_no, 
	Employees.last_name, 
	Employees.first_name, 
	Employees.sex, 
	Salaries.salary
from Employees
inner join Salaries on
Employees.emp_no = Salaries.emp_no;

-- part 2 list first name, last name and hire date for employees hired in 1986

select employees.emp_no,
	employees.first_name,
	employees.last_name,
	employees.hire_date
from employees
where hire_date > '12/31/1985' and hire_date < '01/01/1987';

-- part 3 list manager of each department with department number, department name, 
-- managers employee number, last name, first name

-- select t1.dept_no,
-- 	t3.dept_name,
-- 	t1.emp_no,
-- 	t2.first_name,
-- 	t2.last_name
-- from dept_mgr as t1
-- join employees as t2 on
-- t1.emp_no = t2.emp_no
-- join departments as t3
-- on t3.dept_no = t1.dept_no;

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	dept_mgr.dept_no,
	departments.dept_name
FROM employees
inner JOIN dept_mgr on
employees.emp_no = dept_mgr.emp_no
full join departments on
dept_mgr.dept_no = departments.dept_no;

-- part 4 list the department of each employee including employee number, last name, first name,  and department name.

-- select dep_mgr.emp_no,
-- 	t1.last_name,
-- 	t1.first_name,
-- 	t3.dept_name
-- from employees as t1
-- join dept_emp as t2
-- on t1.emp_no = t2.emp_no
-- join departments as t3
-- on t3.dept_no = t2.dept_no;

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	dept_emp.dept_no,
	departments.dept_name
FROM employees
inner JOIN dept_emp on
employees.emp_no = dept_emp.emp_no
inner join departments on
dept_emp.dept_no = departments.dept_no;

-- part 5 find where first name is Hercules and last name starts with B

select employees.first_name,
	employees.last_name,
	employees.sex
from employees
where first_name = 'Hercules' and last_name like 'B%'; 

-- part 6 - List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.

-- select t1.emp_no
-- 	, t1.last_name
-- 	, t1.first_name
-- 	, t3.dept_name
-- from employees as t1
-- join dept_emp as t2
-- on t1.emp_no = t2.emp_no
-- join departments as t3
-- on t3.dept_no = t2.dept_no
-- where t3.dept_name = 'Sales';


SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
inner JOIN dept_emp on
employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales';

-- part 7 List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
inner JOIN dept_emp on
employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales' or dept_name = 'Development' ;

-- part 8 In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.

select last_name, count (last_name) as name_cnt
from employees
group by last_name
order by name_cnt desc;
	