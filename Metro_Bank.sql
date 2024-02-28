-- Create Statement

-- Create all the tables in our DB (Customer, Employee, Account, Loan, transaction and Branches)

-- Customer Table

create table customer(
	customer_id int Primary key,
	first_name varchar(20),
	last_name varchar(20),
	date_of_birth Date,
	address text,
	phone_number varchar(20),
	city varchar(20)
);


-- create account table
create table account(
	account_number int Primary key,
	customer_id int,
	account_type varchar (20),
	balance decimal(15,2),
	date_opened date,
	foreign key (customer_id) references customer(customer_id) -- There is a relationship between c.customer_id and a.customer_id
);

-- Create Branch table
create table branch(
	branch_id int Primary key,
	branch_name varchar (50),
	branch_address varchar (50),
	branch_phone_number varchar(20)
);

-- Create Transactions table
create table transactions(
	transaction_id int Primary key,
	account_number int ,
	transaction_type varchar (20),
	amount decimal(15,2),
	transaction_date date,
	foreign key (account_number) references account(account_number)
	
);


-- Create Employee table
create table employee(
	employee_id int Primary key,
	name varchar (50),
	position varchar (20),
	branch_id int,
	hire_date date,
	foreign key (branch_id) references branch(branch_id)
	
);

-- Create Load Table
create table loan(
	loan_id int Primary key,
	customer_id int,
	loan_amount decimal (15,2),
	loan_type varchar(20),
	issue_date date,
	intrest_rate decimal(4,2),
	foreign key (customer_id) references customer(customer_id)
);


-- Alter Statement modifies the changes
-- add an email field to the customer table
alter table customer add email varchar(50);
-- change the data type from decimal to float in loan table, intrest_rate.
alter table loan
alter column intrest_rate type float;

-- increase branch adress data type to 255
alter table branch
alter column branch_address type varchar(255);

-- ensure phone number in customer table to be unique
alter table customer add unique(phone_nmuber);

-- rename phone_number column in customer table
alter table customer rename column phone_nmuber to phone_number;


--Data Manipulation language
-- customer table
insert into customer(customer_id, first_name, last_name, date_of_birth, address, phone_number, city, email)
values (4, 'Merie', 'Ihemadu', '1989-01-01', '2 Pashmina Gardens', '07557325288', 'Coventry', 'ebube_ihemadu@yahoo.com'),
(3, 'Chimdi', 'Nkem', '2020-01-01', '2 Pashmina Gardens', '07557325290', 'Coventry', 'chimdi_nkem@yahoo.com');


select * from customer

-- Account table
insert into account(account_number, customer_id, account_type, balance, date_opened)
values (123460, '4', 'savings', 50500.66, '2022-01-01'),
(7891090, '3', 'current', 200068.76,'2022-01-01');

select * from account;

-- update statement: allows to update the records or make changes
update account
set balance = balance + 500
where customer_id = 1;

update account
set balance = balance + 500
where account_number = 123456;

update account
set account_type = 'Savings'
where account_number = 123456;

--Delete statement: you specicy the record you want to delete
delete from account
where customer_id = 2;

-- Truncate statement: truncate clears all records. you have to break the connection(contraints)
alter table transactions drop constraint transactions_account_number_fkey;-- to remove the r/ship

Truncate table account;

alter table transactions add constraint account_number foreign key (account_number)
references account(account_number);-- to add back  the connection

-- drop all tables
drop table employee;
drop table transactions;
drop table account;
drop table loan;
drop table branch;
drop table customer;


-- Data Query Language
-- select statement: to view records
select * from account;
select * from branch;
select * from customer;
select * from employee;
select * from loan;
select * from transactions;