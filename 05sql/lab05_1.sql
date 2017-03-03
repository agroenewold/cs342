--Andrew Groenewold
--Spring 2017
--Lab 5

--Exercise 5.1a
--get the cross product of Person and Household
select * from Person, Household;
--see how many records are in the cross product
select COUNT(*) from Person, Household;

--Exercise 5.1b
--Retrieve the people who have birthdays specified in the database, ordered by day-of-year
select * from Person where birthdate is not null order by TO_CHAR(birthdate, 'DDD') ASC;
