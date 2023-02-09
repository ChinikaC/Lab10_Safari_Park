DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS assignment;
DROP TABLE IF EXISTS enclosures;
DROP TABLE IF EXISTS staff;


CREATE TABLE enclosures(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40),
    capacity INT,
    closedForMaintenance BOOLEAN
);

INSERT INTO enclosures(name, capacity,closedForMaintenance) VALUES ('Big Cat Field', 30, true);
INSERT INTO enclosures(name, capacity,closedForMaintenance) VALUES ('Monkey House', 40, false);
INSERT INTO enclosures(name, capacity,closedForMaintenance) VALUES ('Vivarium', 35, true);

CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40),
    type VARCHAR(40),
    age INT,
    enclosure_id INT REFERENCES enclosures(id)
);

INSERT INTO animals(name, type, age, enclosure_id) VALUES ('Tony', 'Bengal Tiger', 16,1);
INSERT INTO animals(name, type, age, enclosure_id) VALUES ('Simba', 'Congo Lion', 8,1);
INSERT INTO animals(name, type, age, enclosure_id) VALUES ('Mbaku', 'Silver Back Gorilla', 10,2);
INSERT INTO animals(name, type, age, enclosure_id) VALUES ('George', 'Golden Snub Nosed Monkey', 12,2);
INSERT INTO animals(name, type, age, enclosure_id) VALUES ('Yoshi', 'Komodo Dragon', 14,3);
INSERT INTO animals(name, type, age, enclosure_id) VALUES ('Malfoy', 'Rock Python', 6,3);

CREATE TABLE staff(
id SERIAL PRIMARY KEY,
name VARCHAR(40),
employeeNumber INT
);

INSERT INTO staff(name, employeeNumber) VALUES ('Ed', 068);
INSERT INTO staff(name, employeeNumber) VALUES ('Edward', 001);
INSERT INTO staff(name, employeeNumber) VALUES ('Eddy', 054);
INSERT INTO staff(name, employeeNumber) VALUES ('Edbert', 007);
INSERT INTO staff(name, employeeNumber) VALUES ('Edwin', 013);
INSERT INTO staff(name, employeeNumber) VALUES ('Eddison', 026);

CREATE TABLE assignment(
id SERIAL PRIMARY KEY,
employee_id INT REFERENCES staff(id),
enclosure_id INT REFERENCES enclosures(id),
day VARCHAR(20)
);

INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (1,1,'Monday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (2,1,'Tuesday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (3,2,'Wednesday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (4,2,'Thursday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (5,3,'Friday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (6,3,'Saturday');

-- Q1: Write a query to find the names of the animals in a given enclosure.
-- A: SELECT animals.name FROM enclosures INNER JOIN animals ON enclosures.id = animals.enclosure_id WHERE enclosures.name = 'Monkey House';

-- Q2: Write a query to find the names of the staff in a given enclosure.
-- A: SELECT staff.name FROM enclosures INNER JOIN assignment ON enclosures.id = assignment.enclosure_id INNER JOIN staff ON assignment.employee_id = staff.id WHERE enclosures.name = 'Big Cat Field';