-- 1. Display all information in the tables EMP and DEPT. 

SELECT * FROM hr.employees;
SELECT * FROM hr.departments;

-- 2. Display only the hire date and employee name for each employee.  

select hire_date,concat(first_name," ",last_name) as name from employees;

-- 3. Display the ename concatenated with the job ID, separated by a comma and space, and 
-- name the column Employee and Title 

select concat(first_name,",", job_id) as Employee_Title from employees;

--  4. Display the hire date, name and department number for all clerks.  
 
select concat(first_name," ",last_name) as name,hire_date,department_id from employees;

-- 5. Create a query to display all the data from the EMP table. Separate each column by a 
-- comma. Name the column THE OUTPUT   

select concat(employee_id,",", first_name," ", last_name,",",email,",", phone_number,",", hire_date,",", job_id,",", salary,",", 
commission_pct,",", manager_id,",", department_id) as THEOUTPUT from employees;

-- 6. Display the names and salaries of all employees with a salary greater than 2000.

select concat(first_name," ",last_name) as name, salary from employees
where salary > 2000;

-- 7. Display the names and dates of employees with the column headers "Name" and "Start 
-- Date"  
select first_name as name , hire_date as StartDate from employees;

-- 8. Display the names and hire dates of all employees in the order they were hired. 
 
select concat(first_name," ",last_name) as name , hire_date from employees
order by hire_date;

-- 9. Display the names and salaries of all employees in reverse salary order.  

select concat(first_name," ",last_name) as  name, salary from employees
order by salary desc ;
 
-- 10. Display 'ename" and "deptno" who are all earned commission and display salary in 
-- reverse order. 

select first_name, department_id, salary, commission_pct from employees
where commission_pct is not null
order by salary desc ;

-- 11) Display the maximum, minimum and average salary and commission earned. 
 
 select max(salary),min(salary),avg(salary),max(commission_pct),min(commission_pct),avg(commission_pct) from employees;
 
 -- 12) Display the department number, total salary payout and total commission payout for 
-- each department. 
 
 select department_id, sum(salary),sum(commission_pct) from employees
 group by department_id;
 
 -- 13) Display the department number and number of employees in each department.
 
 select  department_id, count(employee_id) from employees 
 group by department_id;
 
 -- 14) Display the department number and total salary of employees in each department. 
 
 select department_id, sum(salary) from employees
 group by department_id;
 
-- 15) Display the employee's name who doesn't earn a commission. Order the result set 
-- without using the column name   
 
 select first_name, commission_pct from employees
 where commission_pct is null
 order by first_name;
 
-- 16) Display the employees name, department id and commission. If an Employee doesn't  
-- earn the commission, then display as 'No commission'. Name the columns appropriately

select concat(first_name," ",last_name) as  name,department_id,if(commission_pct is null ,"no commission","commission") as 
Nocommission from employees;

-- 17) Display the employee's name, salary and commission multiplied by 2. If an Employee 
-- doesn't earn the commission, then display as 'No commission. Name the columns 
-- appropriately 
 
 select concat(first_name," ",last_name) as  name,salary,if(commission_pct is null ,"no commission","commission") as
commissions from employees
where commission_pct *2;
 
-- 18) Display the employee's name, department id who have the first name same as another 
-- employee in the same department  
 
 SELECT e1.first_name , e1.department_id FROM employees e1
JOIN employees e2 ON e1.department_id = e2.department_id 
AND e1.first_name  != e2.first_name  
AND SUBSTRING_INDEX(e1.first_name , ' ', 1) = SUBSTRING_INDEX(e2.first_name , ' ', 1);
 
 -- 19) Display the average of sum of the salaries and group the result with the department id. 
-- Order the result with the department id.  

select department_id ,avg(sum(salary)) from employees
group by department_id;

-- 20) Select the maximum salary of each department along with the department id 

select department_id , max(salary) from employees
group by department_id;

-- 21) Display the commission, if not null display 10% of salary, if null display a default value 1

SELECT first_name,department_id,
    CASE 
        WHEN commission_pct IS NOT NULL THEN commission_pct
        WHEN salary IS NOT NULL THEN salary * 0.1
        ELSE 1
    END AS commission_value
FROM employees;
 
-- 22) Write a query that displays the employee's last names only from the string's 2-5th 
-- position with the first letter capitalized and all other letters lowercase, Give each column an 
-- appropriate label.    

 SELECT concat(upper(substring(last_name,1,2)) , lower(substring(last_name,3,4))) AS "Formatted_Last_Name" FROM employees;

-- 23) Write a query that displays the employee's first name and last name along with a " in 
-- between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the 
-- month on which the employee has joined. 

select concat(first_name," ",last_name) as name ,month(hire_date) as hire_month from employees;

-- 24) Write a query to display the employee's last name and if half of the salary is greater than 
-- ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
-- 1500 each. Provide each column an appropriate label.   

select last_name,if(salary * 0.5  > 1000 , salary * 0.1 + 15000 ,salary * 0.115 + 1500) as totalsalary from employees;
   
-- 25) Write a query that displays the employee's last names with the first letter capitalized and 
-- all other letters lowercase, and the length of the names, for all employees whose name 
-- starts with J, A, or M. Give each column an appropriate label. Sort the results by the 
-- employees' last names   

select concat(upper(substring(last_name,1,1)),lower(substring(last_name,2))) as lastname ,length(last_name)  from employees
where last_name like "j%" or last_name like "A%" or last_name like "M%"
order by last_name;

-- 26) Create a query to display the last name and salary for all employees. Format the salary to 
-- be 15 characters long, left-padded with $. Label the column SALARY  
 
 SELECT last_name,LPAD(salary, 15, '$') AS SALARY FROM employees;
 
-- 27) Display the employee's name if it is a palindrome   

select first_name from employees
where first_name = reverse(first_name);

-- 28) Display First names of all employees with initcaps. 

select concat(upper(substring(first_name,1,1)),lower(substring(first_name,2))) as firstname from employees;
  
-- 29) From LOCATIONS table, extract the word between first and second space from the 
-- STREET ADDRESS column. 

select concat(substring(street_address,1,1),substring(street_address,2,1)) as streetaddress from locations;
  
-- 30) Extract first letter from First Name column and append it with the Last Name. Also add 
-- "@systechusa.com" at the end. Name the column as e-mail address. All characters should 
-- be in lower case. Display this along with their First Name. 

select concat(lower(substring(first_name,1,1)),last_name,"@systechusa.com") as email_address from employees;
 
 -- 31) Display the names and job titles of all employees with the same job as Trenna. 
 
 select job_title,first_name from employees join jobs on jobs.job_id=employees.job_id 
 where first_name = (SELECT Job_title from employees where first_name = 'TRENNA');

-- 32) Display the names and department name of all employees working in the same city as 
-- Trenna.
   
select department_name,first_name from employees 
join departments on employees.department_id = departments.department_id 
where first_name = (SELECT department_name from employees where first_name = 'TRENNA');
   
-- 33) Display the name of the employee whose salary is the lowest. 

select concat(first_name," ",last_name) as name ,salary from employees
where salary= (select min(salary) from employees);

-- 34) Display the names of all employees except the lowest paid.

select concat(first_name," ",last_name) as name ,salary from employees
where salary > (select min(salary) from employees);

-- 35) Write a query to display the last name, department number, department name for all 
-- employees. 

select employees.last_name,departments.department_name,employees.department_id from employees join departments on
employees.department_id=departments.department_id;

-- 36) Create a unique list of all jobs that are in department 4. Include the location of the 
-- department in the output. 

select jobs.job_title,locations.city from employees
join jobs on employees.job_id = jobs.job_id
join departments on employees.department_id = departments.department_id
join locations on departments.location_id = locations.location_id
where departments.department_id = 4;
 
-- 37) Write a query to display the employee last name,department name,location id and city of 
-- all employees who earn commission.  

select employees.last_name, locations.location_id, employees.commission_pct, locations.city, departments.department_id
 from employees
 join departments on employees.department_id = departments.department_id
 join locations on departments.location_id = locations.location_id
where employees.commission_pct is not null ;

-- 38). Display the employee last name and department name of all employees who have an 'a' 
-- in their last name 

select employees.last_name,departments.department_id from employees
 join departments on employees.department_id = departments.department_id
 where employees.last_name like "a%";

-- 39) Write a query to display the last name,job,department number and department name for 
-- all employees who work in ATLANTA.  

select employees.last_name,employees.job_id,departments.department_id,departments.department_name from employees
join departments on employees.department_id = departments.department_id
join locations on departments.location_id = locations.location_id
where locations.city = "ATLANTA";

-- 40) Create a query that displays employees last name,department number,and all the 
-- employees who work in the same department as a given employee.  

SELECT e1.LAST_NAME AS "Employee Last Name", e1.DEPARTMENT_ID AS "Department Number", e2.LAST_NAME AS "Colleague Last Name"
FROM employees e1
JOIN employees e2 ON e1.DEPARTMENT_ID = e2.DEPARTMENT_ID
WHERE e1.LAST_NAME = 'given_employee_last_name';