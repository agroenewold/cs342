-- Starter code for lab 3.
--
-- CS 342, Spring, 2017
-- kvlinden
-- Continued by Andrew Groenewold
--Spring, 2017

drop table PersonTeam;
drop table Person;
drop table HouseHold;
drop table Team;
drop table Homegroup;

create table HouseHold(
	ID integer PRIMARY KEY,
	street varchar(30),
	city varchar(30),
	state varchar(2),
	zipcode char(5),
	phoneNumber char(12)
	);

create table Homegroup (
	ID integer PRIMARY KEY,
	meetingTime varchar(20)
	);

create table Person (
	ID integer PRIMARY KEY,
	title varchar(4),
	firstName varchar(15),
	lastName varchar(15),
	membershipStatus char(1) CHECK (membershipStatus IN ('m', 'a', 'c')),
	houseHoldID integer NOT NULL,
	houseHoldRole varchar(30),
	mentorID integer,
	homegroupID integer,
	FOREIGN KEY (houseHoldID) REFERENCES HouseHold(ID),
	FOREIGN KEY (mentorID) REFERENCES Person(ID),
	FOREIGN KEY (homegroupID) REFERENCES Homegroup(ID)
	);

create table Team (
	ID integer PRIMARY KEY,
	description varchar(60)
	);

create table PersonTeam (
	personID integer,
	teamID integer,
	role varchar(20),
	FOREIGN KEY (personID) REFERENCES Person(ID),
	FOREIGN KEY (teamID) REFERENCES Team(ID),
	PRIMARY KEY(personID,teamID)
	);

INSERT INTO Household VALUES (0,'2347 Oxford Dr. SE','Grand Rapids','MI','49506','616-243-5680');

INSERT INTO Homegroup VALUES (0, 'Mondays at 7PM');

INSERT INTO Team VALUES (0, 'Worship Team');
INSERT INTO Team VALUES (1, 'Deacons');

INSERT INTO Person VALUES (1,'ms.','Brenda','VanderLinden','m', 0, 'parent', NULL, NULL);
INSERT INTO Person VALUES (0,'mr.','Keith','VanderLinden','m', 0, 'parent', 1, 0);

INSERT INTO PersonTeam VALUES (0,1,'Secretary');
