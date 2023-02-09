DROP TABLE IF EXISTS assignment;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS enclosures;

CREATE TABLE enclosures(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40),
    capacity INT,
    closedForMaintenance BOOLEAN
);

CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40),
    type VARCHAR(40),
    age INT,
    enclosures_id INT REFERENCES enclosures(id)
);

CREATE TABLE staff(
id SERIAL PRIMARY KEY,
name VARCHAR(40),
employeeNumber INT
);

CREATE TABLE assignment(
id SERIAL PRIMARY KEY,
employee_id INT REFERENCES staff(id),
enclosures_id INT REFERENCES enclosures(id),
day VARCHAR(20)
);