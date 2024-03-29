-- create role
CREATE ROLE dev WITH LOGIN CREATEDB PASSWORD 'ax2';

-- create databases
CREATE DATABASE company;
CREATE DATABASE projectdb;

\c company;

-- create tables
CREATE TABLE companies
(
    company_id   SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL
);

CREATE TABLE contacts
(
    contact_id   SERIAL PRIMARY KEY,
    company_id   INT,
    contact_name VARCHAR(255) NOT NULL,
    phone        VARCHAR(25),
    email        VARCHAR(100),
    CONSTRAINT fk_company
        FOREIGN KEY (company_id)
            REFERENCES companies (company_id)
);

-- insert data
INSERT INTO companies(company_name)
VALUES ('BlueBird Inc'),
       ('Dolphin LLC');

INSERT INTO contacts(company_id, contact_name, phone, email)
VALUES (1, 'John Doe', '(408)-111-1234', 'john.doe@bluebird.dev'),
       (1, 'Jane Doe', '(408)-111-1235', 'jane.doe@bluebird.dev'),
       (2, 'David Wright', '(408)-222-1234', 'david.wright@dolphin.dev');