-- -- string functions
select length("hi");

select upper("hi");

select lower("HI");

select upper(first_name)
from parks_and_recreation.employee_demographics;

SELECT 
    LOWER(first_name)
FROM
    parks_and_recreation.employee_demographics;

select first_name, length(first_name)
from parks_and_recreation.employee_demographics
order by 2;

select trim("        meow       ");
select ltrim("        meow       ");
select rtrim("        meow       ");

select first_name, rtrim(first_name)
from parks_and_recreation.employee_demographics;


select first_name, left(first_name,2)
from parks_and_recreation.employee_demographics;

select first_name, right(first_name,2)
from parks_and_recreation.employee_demographics;

select first_name, substring(first_name,2,3),
substring(birth_date,6,2) as "Birthday-Month"
from parks_and_recreation.employee_demographics;

select first_name, replace(first_name,'a','z')
from parks_and_recreation.employee_demographics;

select first_name, locate("e",first_name)
from parks_and_recreation.employee_demographics;

select first_name, reverse(first_name)
from parks_and_recreation.employee_demographics;

select first_name,  REVERSE(first_name) AS rev,LOCATE('e', REVERSE(first_name)) as loc
from parks_and_recreation.employee_demographics;

select first_name,last_name,
concat(first_name," ",last_name) as full_name
from parks_and_recreation.employee_demographics;

-- -- case statements

select first_name,last_name,age,
CASE
	when age>=50 then "Hello Death"
    when age<=20 then "Hello Minor"
    when age between 21 and 49 then "Hello Major"
END as "Age Moment"
from parks_and_recreation.employee_demographics;

-- -- Case Assignment Problem
-- with id
select  sal.first_name, sal.last_name, sal.salary, sal.dept_id , dept.department_id,
case 
when salary>50000 then salary+(salary*0.07)
when salary<=50000 then salary+(salary*0.05)
when sal.dept_id =6 then salary+(salary*0.1)
end as updated_salary
from parks_and_recreation.employee_salary as sal
JOIN parks_and_recreation.parks_departments AS dept
  ON sal.dept_id = dept.department_id;
  
-- without id
select  sal.first_name, sal.last_name, sal.salary, sal.dept_id , dept.department_name,
case 
when dept.department_name = 'Finance' then sal.salary+(sal.salary*0.1)
when sal.salary>50000 then sal.salary+(sal.salary*0.07)
when sal.salary<=50000 then sal.salary+(sal.salary*0.05)
when dept.department_name = 'Finance' then sal.salary * 1.10
end as updated_salary
from parks_and_recreation.employee_salary as sal
JOIN parks_and_recreation.parks_departments AS dept
  ON sal.dept_id = dept.department_id;

-- subqueries
select *
from parks_and_recreation.employee_demographics 
where employee_id in (select employee_id from employee_salary where dept_id=1);

select salary ,
( select avg(salary) from parks_and_recreation.employee_salary)
from parks_and_recreation.employee_salary;

select avg(max_age)
from
(select gender, avg(age) as avg_age, min(age) as min_age, max(age) as max_age 
from employee_demographics
group by gender) as avg;

-- windows functions
-- over (blank)
select ed.first_name, ed.last_name, gender,avg(salary) over(partition by gender)
from parks_and_recreation.employee_demographics as ed
join parks_and_recreation.employee_salary as es
on ed.employee_id=es.employee_id;

-- over (with partition)
select ed.first_name, ed.last_name, gender,avg(salary) over(partition by gender)
from parks_and_recreation.employee_demographics as ed
join parks_and_recreation.employee_salary as es
on ed.employee_id=es.employee_id;

-- over as rolling table
select ed.first_name, ed.last_name, gender,salary, 
sum(salary) over(partition by gender order by ed.employee_id) as rolling_table
from parks_and_recreation.employee_demographics as ed
join parks_and_recreation.employee_salary as es
on ed.employee_id=es.employee_id;

-- row number
select ed.first_name, ed.last_name, gender,salary, ed.employee_id,
row_number() over(partition by gender order by salary) as sal
from parks_and_recreation.employee_demographics as ed
join parks_and_recreation.employee_salary as es
on ed.employee_id=es.employee_id;

-- rank
select ed.first_name, ed.last_name, gender,salary, ed.employee_id,
row_number() over(partition by gender order by salary desc) as row_num,
rank()  over(partition by gender order by salary desc) as ranks
from parks_and_recreation.employee_demographics as ed
join parks_and_recreation.employee_salary as es
on ed.employee_id=es.employee_id;

-- rank
select ed.first_name, ed.last_name, gender,salary, ed.employee_id,
row_number() over(partition by gender order by salary desc) as row_num,
rank()  over(partition by gender order by salary desc) as ranks,
dense_rank()  over(partition by gender order by salary desc) as Dense_ranks
from parks_and_recreation.employee_demographics as ed
join parks_and_recreation.employee_salary as es
on ed.employee_id=es.employee_id;