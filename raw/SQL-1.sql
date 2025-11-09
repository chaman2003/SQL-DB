-- Basic SQL Queries
-- Selecting all columns from the employee_demographics table
SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT age
FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;


-- -- PEMDAS
select age+(10*10)/2
from parks_and_recreation.employee_demographics;

select distinct gender,first_name
from parks_and_recreation.employee_demographics;

-- Where Clause & like statement
select first_name,age
from parks_and_recreation.employee_demographics
where age>18 
AND
first_name like "_e%" ; -- starting with 1 any letter and proceed with e and so on ;

-- select first_name,age
from parks_and_recreation.employee_demographics
where age>18 
AND
first_name like "_e_" ; -- starting with 1 letter and middle e and ending with 1 letter 

-- select first_name,age
from parks_and_recreation.employee_demographics
where age>18 
AND
first_name like "_e%" ; -- starting with 1 any letter and proceed with e and so on 

-- SELECT *
FROM parks_and_recreation.employee_demographics;

-- -- Logical Operators
select age,gender,birth_date
from parks_and_recreation.employee_demographics
where (age<=38 and gender="Male") AND birth_date like "198%";

-- -- group by 
select dept_id, avg(salary), min(salary), max(salary), count(salary)
from parks_and_recreation.employee_salary
group by dept_id;

select gender, min(age), max(age), count(age), avg(age)
from parks_and_recreation.employee_demographics
group by gender ;

-- -- order by
select *
from parks_and_recreation.employee_demographics
order by age ASC, asc gender DSC; -- gender based on age 
order by gender,  age DESC;

-- -- HAVING vs WHERE
select gender, min(age), max(age), count(age), avg(age)
from parks_and_recreation.employee_demographics
group by gender 
having avg(age)>39;

select occupation, avg(salary)
from parks_and_recreation.employee_salary
where occupation like "%Manager%"
group by occupation
having avg(salary) > 50000;

-- -- limit 
select occupation, avg(salary) 
from parks_and_recreation.employee_salary
group by occupation
limit 3;

-- -- Alias
select gender, avg(age) as avg_age
from parks_and_recreation.employee_demographics
group by gender
having avg_age>30;

-- -- inner join 
select *
from employee_demographics as dem
inner join employee_salary as sal
on sal.employee_id=dem.employee_id;

select age,  gender, salary 
from employee_demographics as dem
inner join employee_salary as sal
on sal.employee_id=dem.employee_id;

-- -- outer join
select *
from employee_demographics as dem
left outer join employee_salary as sal -- or left join
on sal.employee_id like dem.employee_id;

select *
from employee_demographics as dem
right join employee_salary as sal -- or right outer join
on sal.employee_id like dem.employee_id;

-- -- inner join 
select 
sal1.employee_id as eid,
sal1.first_name as fn,
sal1.last_name as ln,
sal2.employee_id as eid,
sal2.first_name as fn,
sal2.last_name as ln
from employee_salary as sal1
join employee_salary as sal2
on sal1.employee_id+1=sal2.employee_id;

-- -- multiple join
select *
from employee_demographics as dem
inner join employee_salary as sal
on sal.employee_id=dem.employee_id
inner join parks_departments as pd
on sal.dept_id = pd.department_id; 

-- union 
select first_name , last_name, "old man" as label, "old man" as label1
from employee_demographics
where employee_demographics.age > 50 and gender="male"
union
select first_name , last_name, "old woman" as label,  "old woman" as label1
from employee_demographics
where employee_demographics.age > 50 and gender="female"
union
select first_name, last_name, "Highly paid employee" as label, "Highly paid employee" as label1
from employee_salary
where employee_salary.salary>70000
union
select first_name, last_name, "Less paid employee" as label, "Less paid employee" as label1
from employee_salary
where employee_salary.salary<70000
order by first_name, last_name;