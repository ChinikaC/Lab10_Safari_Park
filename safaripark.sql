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
INSERT INTO enclosures(name, capacity,closedForMaintenance) VALUES ('Moneky House', 40, false);
INSERT INTO enclosures(name, capacity,closedForMaintenance) VALUES ('Vivarium', 35, true);

CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40),
    type VARCHAR(40),
    age INT,
    enclosures_id INT REFERENCES enclosures(id)
);

INSERT INTO animals(name, type, age, enclosures_id) VALUES ('Tony', 'Bengal Tiger', 16);
INSERT INTO animals(name, type, age, enclosures_id) VALUES ('Simba', 'Congo Lion', 8);
INSERT INTO animals(name, type, age, enclosures_id) VALUES ('Mbaku', 'Silver Back Gorilla', 10);
INSERT INTO animals(name, type, age, enclosures_id) VALUES ('George', 'Golden Sunb Nosed Monkey', 12);
INSERT INTO animals(name, type, age, enclosures_id) VALUES ('Yoshi', 'Komodo Drago', 14);
INSERT INTO animals(name, type, age, enclosures_id) VALUES ('Malfoy', 'Rock Python', 6);

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
enclosures_id INT REFERENCES enclosures(id),
day VARCHAR(20)
);

INSERT INTO assignment(employee_id, enclosures_id, day) VALUES ()
INSERT INTO assignment(employee_id, enclosures_id, day) VALUES ()
INSERT INTO assignment(employee_id, enclosures_id, day) VALUES ()