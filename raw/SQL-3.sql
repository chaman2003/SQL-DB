-- CTE
with cte as 
(
select gender, min(age), max(age), avg(age) as avg_age
from parks_and_recreation.employee_demographics as ed
join employee_salary as es
on ed.employee_id=es.employee_id
group by gender
)
select avg(avg_age)
from cte;

-- Nested CTE
with cte1 as 
(
select employee_id, gender
from parks_and_recreation.employee_demographics as ed
where gender like "male"
),
cte2 as (
select employee_id,salary
from parks_and_recreation.employee_salary as es
where salary>=50000
)
select *
from cte1
join cte2
on cte1.employee_id=cte2.employee_id;


-- temporary Tables
create temporary table temp_table(
movie varchar (50),
hero varchar(50)
);
insert into temp_table
values("Baahubali","Prabhas");

select *
from temp_table;

create temporary table salary_above_50k as (
select ed.employee_id, ed.first_name, ed.last_name, es.salary
from parks_and_recreation.employee_demographics as ed 
join parks_and_recreation.employee_salary as es
on ed.employee_id=es.employee_id
where es.salary >= 50000
);

-- create temporary table salary_below_70k as (
-- select salary 
-- from parks_and_recreation.employee_salary
-- where salary<=70000
-- );

-- select first_name, last_name, salary
-- from  salary_below_70k;

-- Stored Procedures 
delimiter $$
create procedure stored_procedure1()
begin 
	select *
	from parks_and_recreation.employee_salary
	where salary>=50000;
	select *
	from parks_and_recreation.employee_salary
	where salary>=50000;
end $$
delimiter ;

call parks_and_recreation.stored_procedure1();


create procedure stored_procedure3(huggymuffin int)
	select salary
	from parks_and_recreation.employee_salary
	where employee_id=huggymuffin;

call parks_and_recreation.stored_procedure3(2);

-- triggers 
delimiter $$
create trigger employee_insert
after insert
on parks_and_recreation.employee_salary
for each row
begin
	insert into parks_and_recreation.audit_log (employee_id,first_name,last_name)
	values (new.employee_id, new.first_name, new.last_name);
end $$
delimiter ;

insert into parks_and_recreation.employee_salary (employee_id, first_name, last_name, occupation, salary,dept_id)
values (101, 'John', 'Doe', 'Developer', 55000, NULL);

-- EVENTS
delimiter $$
create event delete_retirees
on schedule every 30 seconds
do
begin
	delete
	from parks_and_recreation.employee_demographics
	where age > 65;
end
$$
delimiter ;

