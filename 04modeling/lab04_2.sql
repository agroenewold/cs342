-- This command file loads an experimental person database.
-- The data conforms to the following assumptions:
--     * People can have 0 or many team assignments.
--     * People can have 0 or many visit dates.
--     * Teams and visits don't affect one another.
--
-- CS 342, Spring, 2017
-- kvlinden

--Andrew Groenewold, Spring 2017
--Ex 4.2.a. They are BCNF and 4NF. Every dependency is trivial.
--Ex 4.2.b. It is BNF because every functional dependency is trivial. It is not 4NF because
--there are multivalued dependencies between PERSONNAME and TEAMNAME and between PERSONNAME
--and PERSONVIS, but PERSONNAME is not a superkey.
--Ex 4.2.c. I think the first schema is better because if Shamkant joins a new team or visits
--again we only need to add one row instead of 3.

DROP TABLE PersonTeam;
DROP TABLE PersonVisit;

CREATE TABLE PersonTeam (
	personName varchar(10),
    teamName varchar(10)
	);

CREATE TABLE PersonVisit (
	personName varchar(10),
    personVisit date
	);

-- Load records for two team memberships and two visits for Shamkant.
INSERT INTO PersonTeam VALUES ('Shamkant', 'elders');
INSERT INTO PersonTeam VALUES ('Shamkant', 'executive');
INSERT INTO PersonVisit VALUES ('Shamkant', '22-FEB-2015');
INSERT INTO PersonVisit VALUES ('Shamkant', '1-MAR-2015');

-- Query a combined "view" of the data of the form View(name, team, visit).
SELECT pt.personName, pt.teamName, pv.personVisit
FROM PersonTeam pt, PersonVisit pv
WHERE pt.personName = pv.personName;
