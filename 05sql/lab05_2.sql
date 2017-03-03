--Andrew Groenewold
--Spring 2017
--Lab 5

--Exercise 5.2a
select * from (select * from Person where birthdate is not null order by birthdate desc) where ROWNUM=1;

--Exercise 5.2b
--With no distinct it will select people multiple times if there are more than 2 people with the same name
select distinct person1.id, concat(concat(person1.firstName, ' '), person1.lastName) as FullName from Person person1, Person person2
where person1.firstName = person2.firstName and person1.id <> person2.id;

--Exercise 5.2c
select p1.firstname, p1.lastname from person p1, personteam where p1.id = personteam.personId and personteam.teamname = 'Music'
and not exists(select * from homegroup where p1.homegroupid = homegroup.id and homegroup.name = 'Byl');
