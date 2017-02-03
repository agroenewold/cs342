--Andrew Groenewold
--CS342, lab01, ex1.1
--list all the rows of the departments table.
select * from departments;

--find the number of employees in the database (nb., use the COUNT() aggregate function for this).
select count(*) from employees;

--list the employees who:
--make more than $15,000 per year.
select * from Employees where salary > 15000;

--were hired from 2002–2004 (inclusive).
select * from employees where hire_date between '01-JAN-02' and '31-DEC-04';

--have a phone number that doesn’t have the area code 515 (nb., use NOT LIKE with the wildcard %).
select * from employees where phone_number not like '515%';

--list the names of the employees who are in the finance department. Try to format the names as “firstname lastname” using concatenation (i.e., || ) and order them alphabetically.
select first_name || ' ' || last_name from (employees INNER JOIN departments ON employees.department_id = departments.department_id) where department_name = 'Finance' order by first_name;

--list the city, state and country name for all locations in the Asian region.
select city,state_province,country_name from ((locations INNER JOIN countries on locations.country_id = countries.country_id) inner join regions on countries.region_id = regions.region_id) where region_name = 'Asia';

--list the locations that have no state or province specified in the database.
select * from locations where state_province is null;
