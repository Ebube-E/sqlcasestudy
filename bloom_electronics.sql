--Bloom Electronics Robust Database Project

--Task 1
-- create product table

create table product(
	product_id INT primary key,
	product_name Varchar(50),
	brand varchar (50),
	model Varchar (50),
	product_type Varchar (50),
	product_size INT,
	price decimal(15,2),
	description Varchar (255),
	warranty_period Varchar (50)
);

-- add an brand field to the customer table
alter table product add brand varchar(50);
-- create customer table

create table customer(
	customer_id int Primary key,
	first_name varchar(20),
	last_name varchar(20),
	email varchar (50),
	address varchar (255),
	phone_number varchar(20)	
);

-- create staff table

create table staff(
	staff_id int Primary key,
	first_name varchar(20),
	last_name varchar(20),
	position varchar (50),
	phone_number varchar(20),
	email varchar (50)	
);


-- create sale table

create table sale(
	sale_id int primary key,
	product_id int ,
	customer_id int,
	staff_id int,
	quantity_id int,
	selling_price decimal(15,2),
	discount decimal(5,2),
	total_price decimal(15,2),
	payment_method varchar(50),
	sale_date date,
	foreign key (customer_id) references customer(customer_id) -- There is a relationship between c.customer_id and a.customer_id
	--foreign key (product_id) references product(product_id) -- There is a relationship between c.customer_id and a.customer_id
	--foreign key (staff_id) references staff(staff_id) -- There is a relationship between c.customer_id and a.customer_id

);

-- Task 2 ( load tables)
select * from sale;
select * from customer;
select * from staff;
select * from product;
--Task 3
-- Insert a new record into the sale table.
insert into sale(
	sale_id, product_id, customer_id, staff_id, quantity_id, selling_price, discount, total_price, payment_method, sale_date)
values (10011, 201, 42, 502, 2, 4500, 0, 3000,'paypal', '2022-07-07'),
       (10012, 213, 51, 504, 4, 1500, 0, 6000, 'bank deposit', '2022-12-17');
---Outputs error because sale id already exist

--Task 4
-- Alter Statement -Sale table
--Add a column to store customers location.

Alter table sale add column customer_location varchar(20);

-- fill customer_location with 'FCT'
update sale
set customer_location = 'FCT';

-- Rename Payment method column to payment channel
alter table sale
rename column payment_method to payment_channel;


--Task 5: Payment method with the highest sales
-- Determine the leading payment method in contributing to total sales for optimising payment processing strategies.
select payment_channel, round(sum(total_price),2)
from sale
group by payment_channel
order by 2 desc; -- Paypal is the leading Payment method.

--Task 6: Price Range Analysis by brand
--Find the range of prices for each brand
select brand, model, selling_price, count(selling_price) no_of_sales
from sale s
inner join product p
on 
p.product_id = s.product_id
group by brand, model, selling_price
order by 1;

--Task 7
--Retrieve the product details and the corressponding staff information for each sale made.
select p.product_id, brand, 

-- Task 8: Best-Performing Brand
--Identify the brand with the highest total sales.

--Task 9
--Get the product details and names of the staff members involved in each sale, including 
